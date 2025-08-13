
## Goal
- 建立地端的 openstack 雙節點模擬機器，能夠在 VM 模擬的openstack 環境中，用 nova 開設出 VM，測試 nova evacuate API

## meterial
1. virtualbox VM 
    - VM info
        ```json
        [
            {
                "name":   "node1",
                "enp0s3": "192.168.1.144",
                "enp0s8": "192.168.56.121",
                "disk_size": "200GB",
                "os": "rocky linux 9.5",
                "root_password": "foxconn",
                "CPU": "4",
                "memery": "8GB",
                "openstack node role": "control,compute",
                "Nested VT-x/AMD-V": "Enable"
            },
            {
                "name":      "node2",
                "enp0s3":    "192.168.1.183",
                "enp0s8":    "192.168.56.122",
                "disk_size": "200GB",
                "os":        "rocky linux 9.5",
                "root_password": "foxconn",
                "CPU":        "4",
                "memery":     "8GB",
                "openstack node role": "network,compute",
                "Nested VT-x/AMD-V":   "Enable"
            }
        ]
        ```
        - enp0s3 統一是 "橋接介面卡" 網段是 192.168.1.0/24
        - enp0s8 統一是 "Host only" 網段是 192.168.56.0/24
        - 已依據 docker 官方步驟安裝 docker
2. openstack 版本 stable/2024.1
3. 用 kolla 建立 rocky9 為基底的 images，提供 kolla-ansible 使用  
4. 用 kolla-ansible 對兩台 VM 進行openstack 部屬


## 步驟
1. 安裝 VM 所需套件
    - [undercloud/overcloud 機器] docker 
        ```bash
        sudo yum remove docker docker-client docker-client-latest docker-common docker-latest docker-latest-logrotate docker-logrotate docker-engine

        sudo yum install -y yum-utils
        sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
        sudo yum install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

        systemctl enable docker
        systemctl start docker

        ## 將 iaas.fixo.cloud:4000 設定為信任的 registry server
        echo "192.168.1.102 iaas.fixo.cloud" >> /etc/hosts
        sudo tee /etc/docker/daemon.json > /dev/null << 'EOF'
        {
                "data-root": "/home/lib/docker",
                "log-driver": "json-file",
                "log-opts": {
                        "max-file": "5",
                        "max-size": "50m"
                },
                "insecure-registries": ["iaas.fixo.cloud:4000"]
        }
        EOF
        sudo systemctl restart docker
        docker run -d -p 4000:5000 --restart=always --name registry registry:2
        ```

    - [undercloud 機器] kolla 
        ```bash
        # 1. 安裝 Python 開發套件和必要依賴
        sudo dnf -y install git python3-devel libffi-devel gcc openssl-devel python3-libselinux

        # 2. 建立並激活 Python 虛擬環境
        python3 -m venv /root/openstack/python_env 
        source /root/openstack/python_env/bin/activate

        # 3. 升級 pip
        pip install --upgrade pip

        # 3. 安裝 kolla
        # 安裝 kolla 17.0.0 對應 OpenStack 2024.1 (Caracal)
        git clone https://github.com/openstack/kolla.git -b stable/2024.1
        cd kolla && pip install .
        pip install tox python-openstackclient 
        pip install 'docker==7.1.0'
        
        ```

    - [undercloud 機器] kolla-ansible 
        ```bash
        # 確保在虛擬環境中
        source /root/openstack/python_env/bin/activate

        yum install epel-release -y
        dnf install git python3-devel libffi-devel gcc openssl-devel python3-libselinux

        git clone https://github.com/openstack/kolla-ansible.git -b stable/2024.1
        cd kolla-ansible 
        pip install .
        kolla-ansible install-deps
        ```

2. [undercloud 機器] 用 kolla 建立 rocky9 為基底的 images，提供 kolla-ansible 使用 
    ```bash
    # 建立 OpenStack Rocky 9 基礎映像檔（針對 OpenStack 2024.1 版本）
    kolla-build --base rocky --tag 2024.1 \
    --registry iaas.fixo.cloud:4000 --push \
    keystone glance nova neutron placement horizon \
    mariadb memcached rabbitmq haproxy keepalived \
    cinder heat \
    fluentd cron kolla-toolbox openvswitch iscsid glance

    # 驗證推送結果
    curl -X GET http://iaas.fixo.cloud:4000/v2/_catalog | jq
    ```

4. [undercloud 機器] 定義 kolla-ansible 服務所需的其他資訊
    - kolla-ansible 設定黨準備
        - global.yml 
        - passwords.yml 

5. [undercloud 機器] 建立 inventory.ini

6. [undercloud 機器] 部署命令順序
    ```bash
    # 確保在虛擬環境中
    source /root/openstack/python_env/bin/activate

    # 1. 環境檢查
    kolla-ansible -i /root/openstack/inventory.ini bootstrap-servers

    # 1.1主機名稱解析 & /etc/docker/daemon.json 配置 insecure-registries
    for node in "node1 node2"
    do 

    ssh $node sh -c "
    echo -e '
    192.168.1.144 node1
    192.168.1.183 node2
    192.168.1.102 iaas.fixo.cloud
    ' >> /etc/hosts"

    ssh $node 'sudo tee /etc/docker/daemon.json > /dev/null << '"'"'EOF'"'"'
    {
        "bridge": "none",
        "default-ulimits": {
            "nofile": {
                "hard": 1048576,
                "name": "nofile",
                "soft": 1048576
            }
        },
        "ip-forward": false,
        "iptables": false,
        "log-opts": {
            "max-file": "5",
            "max-size": "50m"
        },
        "insecure-registries": ["iaas.fixo.cloud:4000"]
    }
    EOF'""
    done

    # 2. 預檢查
    kolla-ansible -i /root/openstack/inventory.ini prechecks

    # 3. 部署
    kolla-ansible -i /root/openstack/inventory.ini deploy

    # 4. 生成 OpenStack 客戶端配置
    kolla-ansible -i /root/openstack/inventory.ini post-deploy
    ```








7. openstack 操作紀錄
    a. 完成 openstack 部屬後，執行完 `post-deploy` 會產生 admin-openrc.sh 在 /etc/kolla/ 下
    ### admin-openrc.sh
    ```bash
    # Ansible managed

    # Clear any old environment that may conflict.
    for key in $( set | awk '{FS="="}  /^OS_/ {print $1}' ); do unset $key ; done
    export OS_PROJECT_DOMAIN_NAME='Default'
    export OS_USER_DOMAIN_NAME='Default'
    export OS_PROJECT_NAME='admin'
    export OS_TENANT_NAME='admin'
    export OS_USERNAME='admin'
    export OS_PASSWORD='admin_foxconn'
    export OS_AUTH_URL='http://192.168.1.210:5000'
    export OS_INTERFACE='internal'
    export OS_ENDPOINT_TYPE='internalURL'
    export OS_IDENTITY_API_VERSION='3'
    export OS_REGION_NAME='RegionOne'
    export OS_AUTH_PLUGIN='password'
    ```
    b. 使用 vip (http://192.168.1.210) 可直接在 web 上打開 horizon 操作
        - account / password : admin / admin_foxconn
    c. 安裝 openstack cli
        ```bash
        pip install python-openstackclient 
        ```
    


### 其他 openstack 操作筆記
```bash
## image download
curl -O https://dl.rockylinux.org/pub/rocky/9/images/x86_64/Rocky-9-GenericCloud-Base-9.6-20250531.0.x86_64.qcow2

## upload cloud image
. admin-openrc.sh
openstack image create 
--container-format bare 
--disk-format qcow2 
--file  Rocky-9-GenericCloud-Base-9.6-20250531.0.x86_64.qcow2 
--public --property title="Rocky linux 9" 
--property type="linux" rocky9

## Create flavor

## Create AZ & Set node1&node2 to AZ

## Create network
openstack network create my_private_network
openstack subnet create --network my_private_network --subnet-range 192.168.1.0/24 my_private_subnet

## Create VM
openstack server create \
--flavor 77e20ff1-3c5e-4619-b6b4-6d751dfa1c15 \
--image 146136cc-a63e-4fd1-8f8c-30fbedc82087 \
--nic net-id=75fdcbf3-fde6-4ce0-826a-eadbfd18b565 \
--key-name rd_key \
--user-data /root/password-cloud-init \
vm1

openstack server create \
--flavor 77e20ff1-3c5e-4619-b6b4-6d751dfa1c15 \
--image 146136cc-a63e-4fd1-8f8c-30fbedc82087 \
--nic net-id=75fdcbf3-fde6-4ce0-826a-eadbfd18b565 \
--key-name rd_key \
--user-data /root/password-cloud-init \
vm2



```


