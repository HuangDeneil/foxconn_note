

# 其他連線方式 使用net-001上面用ip netns exec 直接ssh 進入同往段的機器
```bash
ip netns exec qdhcp-<OPSTK network_id> ssh -i <key.pem> <user>@<ip>

# example
ip netns exec qdhcp-cb807b61-8351-41fa-a635-add24dc7612f ssh -i Ubuntu20_key.pem rocky@192.168.66.10
```

## tj-testBed.Q
```bash

ip netns exec qdhcp-c94ceb9a-c58e-4897-87ef-dac98e4993ca ssh rocky@192.168.77.15

```


# KH-testBed.Q
```bash
## 連線至net-002
ssh -i ~/.ssh/foxconn-openstack_key.pem root@172.16.16.26

## 透過 net-002 進到network id 網域ssh 連線
## Ubuntu
ip netns exec qdhcp-764abfc0-05ee-4a6e-8b2b-5e0b81af9bf2 ssh -i ~/deneil-dev/Ubuntu20_key.pem ubuntu@192.168.77.16


## deneil-barbican-test
ip netns exec qdhcp-764abfc0-05ee-4a6e-8b2b-5e0b81af9bf2 ssh -i ~/deneil-dev/Ubuntu20_key.pem rocky@192.168.77.15


## deneil-test-rotate
ip netns exec qdhcp-764abfc0-05ee-4a6e-8b2b-5e0b81af9bf2 ssh -i ~/deneil-dev/Ubuntu20_key.pem rocky@192.168.77.25

## deneil-test (centOS 7.9)
ip netns exec qdhcp-764abfc0-05ee-4a6e-8b2b-5e0b81af9bf2 ssh -i ~/deneil-dev/Ubuntu20_key.pem centos@192.168.77.14



```

# KH-testBed.L
```bash
ssh -i ~/.ssh/foxconn-openstack_key.pem root@172.16.16.33

## deneil-rocky-test-keystone
ip netns exec qdhcp-fca993fc-fc6f-42b5-82a6-35220a3e6715 ssh -i ~/hu.deneil-dev/Ubuntu20_key.pem rocky@192.168.66.29
## deneil_rocky_linux_barbican
ip netns exec qdhcp-fca993fc-fc6f-42b5-82a6-35220a3e6715 ssh -i ~/hu.deneil-dev/Ubuntu20_key.pem rocky@192.168.66.28
## deneil_rocky_linux_9
ip netns exec qdhcp-fca993fc-fc6f-42b5-82a6-35220a3e6715 ssh -i ~/hu.deneil-dev/Ubuntu20_key.pem rocky@192.168.66.26

bash rocky_ssh.sh
bash ~/deneil-dev/myRockyLinuxBarbican.sh
```
---
# Work on Rocky linux 9
---

```bash
sudo su

## update 
# yum update -y

sudo dnf update -y

# install editor
# sudo yum install nano vim -y
sudo dnf install nano vim -y
```
## 時間配置
```bash
# sudo yum install chrony
dnf install langpacks-en glibc-all-langpacks -y
timedatectl set-timezone Asia/Taipei
```

---
## Disable selinux (修改完需要reboot才有權限開其他port)
```bash
sed -i 's#SELINUX=enforcing#SELINUX=disabled#g' /etc/selinux/config
```

## 等同於用editor 進去手動修
```bash
vim /etc/selinux/config
```
`/etc/selinux/config` 內容
```conf
...
SELINUX=disabled
...
SELINUXTYPE=targeted
```



## install openstack zed version
```bash
## download rpm file
dnf install https://repos.fedorapeople.org/repos/openstack/openstack-zed/rdo-release-zed-1.el9s.noarch.rpm -y

## install client
yum install python3-openstackclient -y
```

## Install network-scripts package
```bash
sudo dnf install network-scripts -y

## 其他工具 (optional)
sudo yum install net-tools -y
```




### check openstackclient version
```bash
openstack --version
#openstack 3.2.1

which openstack
#/usr/bin/openstack

rpm -qf /usr/bin/openstack
#python-openstackclient-3.2.1-3.el7ost.noarch

```

## mariadb install
```bash
yum install -y mariadb-server
# yum install -y socat 
# yum install -y galera 
```

## mariadb servie restart
```bash
# sudo systemctl restart mariadb.service
sudo systemctl start mariadb.service
sudo systemctl enable mariadb.service
```

## 設定mysql 密碼
```bash
mysql_secure_installation 
```

```bash
 ...
Switch to unix_socket authentication [Y/n] y
 ...
You already have your root account protected, so you can safely answer 'n'.
 ...
Change the root password? [Y/n] y
New password: 
Re-enter new password:
 ...
Remove anonymous users? [Y/n] y
 ... 
Disallow root login remotely? [Y/n] n
 ... 
Remove test database and access to it? [Y/n] y
 ...
Reload privilege tables now? [Y/n] y
 ... 
```

## keystone mysql database
```bash
mysql -uroot -pfoxconn
```
```SQL
-- 建立keystone database
MariaDB [(none)]>  create database keystone;
Query OK, 1 row affected (0.00 sec)

-- 設定從localhost可用keystone 身分登錄
MariaDB [(none)]> grant all privileges on keystone.* to 'keystone'@'localhost' identified by 'foxconn';
Query OK, 0 rows affected (0.00 sec)

-- 設定從任意ip可用keystone 身分登錄
MariaDB [(none)]> grant all privileges on keystone.* to 'keystone'@'%' identified by 'foxconn';
Query OK, 0 rows affected (0.00 sec)

MariaDB [(none)]> exit
Bye
```


```bash
sudo su
dnf update -y ; dnf install nano vim langpacks-en glibc-all-langpacks -y; timedatectl set-timezone Asia/Taipei ; sed -i 's#SELINUX=enforcing#SELINUX=disabled#g' /etc/selinux/config ; dnf install https://repos.fedorapeople.org/repos/openstack/openstack-zed/rdo-release-zed-1.el9s.noarch.rpm -y ; dnf install python3-openstackclient -y ; dnf install -y network-scripts net-tools ; dnf install mariadb-server -y ;systemctl start mariadb.service ; systemctl enable mariadb.service

dnf install openstack-keystone httpd python3-mod_wsgi memcached -y
```


## install keystone
```bash
dnf install openstack-keystone httpd python3-mod_wsgi memcached -y

```


```bash
## Edit keystone.conf
vim /etc/keystone/keystone.conf
```
```conf
[database]
# ...
connection = mysql+pymysql://keystone:foxconn@192.168.77.15/keystone
; connection = mysql+pymysql://keystone:foxconn@127.0.0.1/keystone

...

[token]
# ...
provider = fernet
...

```

## Populate the Identity service database:
```bash
su -s /bin/sh -c "keystone-manage db_sync" keystone
```

# Initialize Fernet key repositories:
```bash
keystone-manage fernet_setup --keystone-user keystone --keystone-group keystone
keystone-manage credential_setup --keystone-user keystone --keystone-group keystone
```

## Bootstrap the Identity service:
```bash 
keystone-manage bootstrap --bootstrap-password admin_foxconn \
--bootstrap-admin-url http://192.168.77.15:5000/v3/ \
--bootstrap-internal-url http://192.168.77.15:5000/v3/ \
--bootstrap-public-url http://192.168.77.15:5000/v3/ \
--bootstrap-region-id RegionOne


# keystone-manage bootstrap --bootstrap-password admin_foxconn \
# --bootstrap-admin-url http://127.0.0.1:5000/v3/ \
# --bootstrap-internal-url http://127.0.0.1:5000/v3/ \
# --bootstrap-public-url http://127.0.0.1:5000/v3/ \
# --bootstrap-region-id RegionOne
```

--------------------------------


# Configure the Apache HTTP server

<!-- 
## change server name
```bash
vim /etc/sysconfig/apache2
```
```conf
APACHE_SERVERNAME="controller"
``` 
-->

### Keystone apache2 conf
```bash
vim /etc/httpd/conf.d/wsgi-keystone.conf 
```
```conf
Listen 5000

<VirtualHost *:5000>
    WSGIDaemonProcess keystone-public processes=5 threads=1 user=keystone group=keystone display-name=%{GROUP}
    WSGIProcessGroup keystone-public
    WSGIScriptAlias / /usr/bin/keystone-wsgi-public
    WSGIApplicationGroup %{GLOBAL}
    WSGIPassAuthorization On
    ErrorLogFormat "%{cu}t %M"
    ErrorLog /var/log/httpd/keystone.log
    CustomLog /var/log/httpd/keystone_access.log combined

    <Directory /usr/bin>
        Require all granted
    </Directory>
</VirtualHost>
```
 

## keystone conf folder change right
```bash
chown -R keystone:keystone /etc/keystone
```

## apache2 service start
```bash
systemctl start httpd
systemctl enable httpd
# systemctl restart httpd
# systemctl status httpd
```


## admin-openrc.sh openstack admin
```bash
echo -e "
export OS_USERNAME=admin
export OS_PASSWORD=admin_foxconn
export OS_PROJECT_NAME=admin
export OS_USER_DOMAIN_NAME=Default
export OS_PROJECT_DOMAIN_NAME=Default
export OS_AUTH_URL=http://192.168.77.15:5000/v3
export OS_IDENTITY_API_VERSION=3
" > admin-openrc.sh


# echo -e "
# export OS_USERNAME=admin
# export OS_PASSWORD=admin_foxconn
# export OS_PROJECT_NAME=admin
# export OS_USER_DOMAIN_NAME=Default
# export OS_PROJECT_DOMAIN_NAME=Default
# export OS_AUTH_URL=http://127.0.0.1:5000/v3
# export OS_IDENTITY_API_VERSION=3
# " > admin-openrc.sh

```

### 測試keystone 是否成功
```bash
. admin-openrc.sh
openstack endpoint list
```


# ----------------------------------------------------------
# --------#####----------------------#----------------------
# --------#----#----------#-----#--------#------#-----------
# --------####-----###----###---###--#-#####--#####---------
# --------#--#----#--#----#--#--#--#-#---#------#-----------
# --------#---##---##--#--###---###--#---##-----##----------
# ----------------------------------------------------------
# Rabbitmq installation
yum install rabbitmq-server -y

<!-- 
## 修改conf ? (這步驟不確定)
nano /etc/rabbitmq/rabbitmq.conf
```conf
   ...
[{rabbit,[{loopback_users, []}]}].
``` -->

## 啟動服務
```bash
sudo systemctl enable rabbitmq-server.service
sudo systemctl start rabbitmq-server.service
# sudo systemctl restart rabbitmq-server.service
# sudo systemctl status rabbitmq-server.service

```

## 如果有多節點的狀況 需要將 controll node的 `/var/lib/rabbitmq/.erlang.cookie` 複製到各節點上的 `/var/lib/rabbitmq`

### `/var/lib/rabbitmq/.erlang.cookie` 需要改從屬 & 權限
```bash
sudo chown rabbitmq:rabbitmq /var/lib/rabbitmq/.erlang.cookie
sudo chmod 400 /var/lib/rabbitmq/.erlang.cookie
```

## 在其他節點中加入controller控制
```bash
rabbitmqctl stop_app
rabbitmqctl join_cluster rabbit@deneil-rocky-keystone-test
rabbitmqctl start_app
rabbitmqctl rabbitmqctl cluter_status
systemctl restart rabbitmq-server.service
```

## 設置用戶

# 新增用戶
```bash
rabbitmqctl add_user openstack foxconn
```
# output
```bash
[root@deneil-barbican-test-keystone rocky]# rabbitmqctl add_user openstack foxconn
warning: the VM is running with native name encoding of latin1 which may cause Elixir to malfunction as it expects utf8. Please ensure your locale is set to UTF-8 (which can be verified by running "locale" in your shell)
Adding user "openstack" ...
Done. Don't forget to grant the user permissions to some virtual hosts! See 'rabbitmqctl help set_permissions' to learn more.
```

# 設置用戶許可權
```bash
rabbitmqctl set_permissions -p / openstack ".*" ".*" ".*" 
```
# output
```bash
[root@deneil-barbican-test-keystone rocky]# rabbitmqctl set_permissions -p / openstack ".*" ".*" ".*" 
warning: the VM is running with native name encoding of latin1 which may cause Elixir to malfunction as it expects utf8. Please ensure your locale is set to UTF-8 (which can be verified by running "locale" in your shell)
Setting permissions for user "openstack" in vhost "/" ...
```



# 配置queue mirror
```bash
rabbitmqctl set_policy -p / ha-all '^(?!amq\.).*' '{"ha-mode": "all"}'
```
# output
```bash
[root@deneil-barbican-test-keystone rocky]# rabbitmqctl set_policy -p / ha-all '^(?!amq\.).*' '{"ha-mode": "all"}'
warning: the VM is running with native name encoding of latin1 which may cause Elixir to malfunction as it expects utf8. Please ensure your locale is set to UTF-8 (which can be verified by running "locale" in your shell)
Setting policy "ha-all" for pattern "^(?!amq\.).*" to "{"ha-mode": "all"}" with priority "0" for vhost "/" ...
```



```bash
[root@controller-03 ~]# rabbitmqctl list_users
Listing users ...
guest [administrator]
openstack []
...done.
[root@controller-03 ~]# rabbitmqctl list_permissions
Listing permissions in vhost "/" ...
guest .* .* .*
openstack .* .* .*
...done.
[root@controller-03 ~]# rabbitmqctl list_policies
Listing policies ...
/ ha-all all ^(?!amq\\.).* {"ha-mode":"all"} 0
...done.

```

## memcached
dnf install memcached -y

# 啟動
```bash
systemctl enable memcached.service
systemctl start memcached.service
```

































# -----------------------------------------
# -----------------------------------------
# -----------------------------------------

## Barbican

```
mysql -uroot -pfoxconn
```

```SQL
MariaDB [(none)]> CREATE DATABASE barbican;
Query OK, 1 row affected (0.000 sec)

MariaDB [(none)]> GRANT ALL PRIVILEGES ON barbican.* TO 'barbican'@'localhost' IDENTIFIED BY 'foxconn';
Query OK, 0 rows affected (0.050 sec)

MariaDB [(none)]> GRANT ALL PRIVILEGES ON barbican.* TO 'barbican'@'%' IDENTIFIED BY 'foxconn';
Query OK, 0 rows affected (0.057 sec)

MariaDB [(none)]> exit;
Bye
```

# 建立barbican 使用者
```bash
source admin-openrc.sh
```




# Create a project name as service
## 如果service project 已存在應該可忽略
```bash
openstack project create service
```
```bash
[rocky@deneil-barbican-test-keystone ~]$ openstack project create service
+-------------+----------------------------------+
| Field       | Value                            |
+-------------+----------------------------------+
| description |                                  |
| domain_id   | default                          |
| enabled     | True                             |
| id          | 35d4fb6e0f82458ba5bbabd67eec41f5 |
| is_domain   | False                            |
| name        | service                          |
| options     | {}                               |
| parent_id   | default                          |
| tags        | []                               |
+-------------+----------------------------------+
```




## Create the barbican user:
```bash
openstack user create --domain default --project service --password admin_foxconn barbican
#openstack user create --domain default --password-prompt barbican
```
## output
```bash
[root@deneil-barbican-test-keystone rocky]# openstack user create --domain default --password-prompt barbican
User Password: admin_foxconn
Repeat User Password: admin_foxconn
+---------------------+----------------------------------+
| Field               | Value                            |
+---------------------+----------------------------------+
| domain_id           | default                          |
| enabled             | True                             |
| id                  | d25644a6fafd4aafa31960aba8a439db |
| name                | barbican                         |
| options             | {}                               |
| password_expires_at | None                             |
+---------------------+----------------------------------+
```




## Add the admin role to the barbican user:
```bash
openstack role add --project service --user barbican admin
```

## Create the creator role:
```bash
openstack role create creator
```
# output
```bash
[rocky@deneil-barbican-test-keystone ~]$ openstack role create creator
+-------------+----------------------------------+
| Field       | Value                            |
+-------------+----------------------------------+
| description | None                             |
| domain_id   | None                             |
| id          | 1924a588e17f4860b7ee79053ef465fe |
| name        | creator                          |
| options     | {}                               |
+-------------+----------------------------------+
```


## Add the creator role to the barbican user:
```bash
openstack role add --project service --user barbican creator
```

## Create the barbican service entities:
```bash
openstack service create --name barbican --description "Key Manager" key-manager
```
# output
```bash
[rocky@deneil-barbican-test-keystone ~]$ openstack service create --name barbican --description "Key Manager" key-manager
+-------------+----------------------------------+
| Field       | Value                            |
+-------------+----------------------------------+
| description | Key Manager                      |
| enabled     | True                             |
| id          | a664fad6157e4af6ba422a37df8a2d73 |
| name        | barbican                         |
| type        | key-manager                      |
+-------------+----------------------------------+
```



# Create the Key Manager service API endpoints:
```bash
openstack endpoint create --region RegionOne key-manager public http://192.168.77.15:9311
openstack endpoint create --region RegionOne key-manager internal http://192.168.77.15:9311
openstack endpoint create --region RegionOne key-manager admin http://192.168.77.15:9311

# openstack endpoint create --region RegionOne key-manager public http://192.168.184.131:9311
# openstack endpoint create --region RegionOne key-manager internal http://192.168.184.131:9311
# openstack endpoint create --region RegionOne key-manager admin http://192.168.184.131:9311

# openstack endpoint create --region RegionOne key-manager public http://127.0.0.1:9311
# openstack endpoint create --region RegionOne key-manager internal http://127.0.0.1:9311
# openstack endpoint create --region RegionOne key-manager admin http://127.0.0.1:9311
```

# Barbican installation
```bash
sudo dnf install openstack-barbican-api openstack-barbican-keystone-listener openstack-barbican-worker -y
```


## Edit `/etc/barbican/barbican.conf`

```bash
vim /etc/barbican/barbican.conf
```

```conf
[DEFAULT]
...
sql_connection = mysql+pymysql://barbican:foxconn@192.168.77.15/barbican
; sql_connection = mysql+pymysql://barbican:foxconn@127.0.0.1/barbican
...
host_href = http://192.168.77.15:9311
...
transport_url = rabbit://openstack:foxconn@192.168.77.15
; transport_url = rabbit://openstack:foxconn@127.0.0.1
...

[keystone_authtoken]
...
www_authenticate_uri = http://192.168.77.15:5000
auth_url = http://192.168.77.15:5000
memcached_servers = 192.168.77.15:11211
auth_type = password
project_domain_name = default
user_domain_name = default
project_name = service
username = barbican
password = admin_foxconn

# ================= Secret Store Plugin ===================
[secretstore]
..
enabled_secretstore_plugins = store_crypto
# ================= Crypto plugin ===================
[crypto]
..
enabled_crypto_plugins = simple_crypto

[simple_crypto_plugin]
# the kek should be a 32-byte value which is base64 encoded
kek = 'YWJjZGVmZ2hpamtsbW5vcHFyc3R1dnd4eXoxMjM0NTY='


```

# Populate the Key Manager service database:
```bash
su -s /bin/sh -c "barbican-manage db upgrade" barbican
```




## wsgi-barbican.conf 
```bash
vim /etc/httpd/conf.d/wsgi-barbican.conf
```

```xml
<VirtualHost [::1]:9311>
    ServerName controller

    ## Logging
    ErrorLog "/var/log/httpd/barbican_wsgi_main_error_ssl.log"
    LogLevel debug
    ServerSignature Off
    CustomLog "/var/log/httpd/barbican_wsgi_main_access_ssl.log" combined

    WSGIApplicationGroup %{GLOBAL}
    WSGIDaemonProcess barbican-api display-name=barbican-api group=barbican processes=2 threads=8 user=barbican
    WSGIProcessGroup barbican-api
    WSGIScriptAlias / "/usr/lib/python2.7/site-packages/barbican/api/app.wsgi"
    WSGIPassAuthorization On
</VirtualHost>
```

<!-- 
# restart httpd
```bash
systemctl restart httpd
systemctl restart httpd.service
``` -->

```bash
systemctl enable --now openstack-barbican-api
systemctl start --now openstack-barbican-api
```

### Test barbican
```bash
openstack endpoint list
openstack secret store --name mysecret --payload j4=]d21
openstack secret list



openstack secret order create \
asymmetric \
--name 'user-defined-key-name' \
--bit-length 2048 \
--algorithm rsa \
--mode cbc

openstack secret order create \
key \
--name 'secret-sy-001-cbc' \
--mode cbc \
--bit-length 256 \
--algorithm aes 



openstack secret order create asymmetric --name 'secret-asy-2048' --mode ctr --bit-length 2048 --algorithm rsa
# http://192.168.77.15:9311/v1/orders/6c285ca3-f30c-4172-966a-325dfc568184

openstack secret order create asymmetric --name 'secret-asy-2048-2' --mode ctr --bit-length 2048 --algorithm rsa 
# http://192.168.77.15:9311/v1/orders/cb2560b6-bafa-43e9-aa2c-74d2df6d2e37


openstack secret order create asymmetric --name 'test-repeat' --mode ctr --bit-length 2048 --algorithm rsa 


openstack secret order create asymmetric --name 'secret-asy-4096' --mode ctr --bit-length 4096 --algorithm rsa 
openstack secret order create asymmetric --name 'secret-asy-8192' --mode ctr --bit-length 8192 --algorithm rsa 






# [bug] create successful but cannot view container & secret 
openstack secret order create asymmetric --name 'test-ssh-DSA' --mode ctr --bit-length 1024 --algorithm dsa

# error
openstack secret order create asymmetric --name 'secret-asy-001-aes' --mode ctr --bit-length 1024 --algorithm aes 
openstack secret order create key --name 'secret-sy-001-cbc' --mode cbc --bit-length 1024 --algorithm rsa 
openstack secret order create key --name 'secret-sy-001-cbc' --mode cbc --bit-length 1024 --algorithm aes 
openstack secret order create asymmetric --name 'test' --algorithm rsa
```

```bash
# url, user, ip, local_file_path, local_file_path
python test_transport.py \
http://192.168.77.15:9311/v1/orders/6c285ca3-f30c-4172-966a-325dfc568184 \
rocky \
192.168.77.5 \
example-rsa.pem \
example-rsa.pem-test
```



```sql
[rocky@deneil-control-node ~]$ openstack secret order list
+--------------------------------------------------------------------------+------------+------------------------------------------------------------------------------+-------------+---------------------------+--------+------------+---------------+
| Order href                                                               | Type       | Container href                                                               | Secret href | Created                   | Status | Error code | Error message |
+--------------------------------------------------------------------------+------------+------------------------------------------------------------------------------+-------------+---------------------------+--------+------------+---------------+
| http://192.168.77.15:9311/v1/orders/a906eda8-9f8d-4b4f-9592-4ee1fa3a1fb0 | Asymmetric | http://192.168.77.15:9311/v1/containers/a60f0605-25cd-458a-8cc9-0c5d7cff589c | N/A         | 2022-12-19T13:22:03+00:00 | ACTIVE | None       | None          |
+--------------------------------------------------------------------------+------------+------------------------------------------------------------------------------+-------------+---------------------------+--------+------------+---------------+


[rocky@deneil-control-node ~]$ openstack secret order get http://192.168.77.15:9311/v1/orders/a906eda8-9f8d-4b4f-9592-4ee1fa3a1fb0
+----------------+------------------------------------------------------------------------------+
| Field          | Value                                                                        |
+----------------+------------------------------------------------------------------------------+
| Order href     | http://192.168.77.15:9311/v1/orders/a906eda8-9f8d-4b4f-9592-4ee1fa3a1fb0     |
| Type           | Asymmetric                                                                   |
| Container href | http://192.168.77.15:9311/v1/containers/a60f0605-25cd-458a-8cc9-0c5d7cff589c |
| Secret href    | N/A                                                                          |
| Created        | 2022-12-19T13:22:03+00:00                                                    |
| Status         | ACTIVE                                                                       |
| Error code     | None                                                                         |
| Error message  | None                                                                         |
+----------------+------------------------------------------------------------------------------+

[rocky@deneil-control-node ~]$ openstack secret container get http://192.168.77.15:9311/v1/containers/a60f0605-25cd-458a-8cc9-0c5d7cff589c
+----------------+------------------------------------------------------------------------------+
| Field          | Value                                                                        |
+----------------+------------------------------------------------------------------------------+
| Container href | http://192.168.77.15:9311/v1/containers/a60f0605-25cd-458a-8cc9-0c5d7cff589c |
| Name           | first_key                                                                    |
| Created        | 2022-12-19 13:22:04+00:00                                                    |
| Status         | ACTIVE                                                                       |
| Type           | rsa                                                                          |
| Public Key     | http://192.168.77.15:9311/v1/secrets/0112ef6d-9d0d-4300-b65a-d0d21145fa77    |
| Private Key    | http://192.168.77.15:9311/v1/secrets/238ab6c6-61d1-4c73-81df-166836f5e010    |
| PK Passphrase  | None                                                                         |
| Consumers      | None                                                                         |
+----------------+------------------------------------------------------------------------------+



+---------------------------------------------------+------------+-----------------------------------------------------------+-------------+---------------------------+--------+------------+---------------+
| Order href                                        | Type       | Container href                                            | Secret href | Created                   | Status | Error code | Error message |
+---------------------------------------------------+------------+-----------------------------------------------------------+-------------+---------------------------+--------+------------+---------------+
| http://{barbican endpoint}/v1/orders/{order uuid} | Asymmetric | http://{barbican endpoint}/v1/containers/{container uuid} | N/A         | 2022-12-19T13:22:03+00:00 | ACTIVE | None       | None          |
+---------------------------------------------------+------------+-----------------------------------------------------------+-------------+---------------------------+--------+------------+---------------+



openstack secret store \
--payload '<your password>' \
--name 'passphrase test-expiration-2' \
--algorithm aes \
--secret-type passphrase \
--mode cbc \
--expiration 2022-12-28T02:50
--bit-length 256 \
--payload-content-type "text/plain" \

2022-12-28T02:39:51+00:00


openstack secret store \
--file input_file.pem \
--secret-type private \
--name test_no_contenet_type \
--algorithm rsa \
--bit-length 2048 
--payload-content-type "text/plain" \
```



# deletion all secret
```bash
## Deletion all order
for i in `openstack secret order list | awk '{print $2}'` 
do 
    if [[ ! "$i" == "Order" ]]; then
        openstack secret order delete $i
        echo $i deleted
    fi
done
## Deletion all container
for i in `openstack secret container list | awk '{print $2}'` 
do 
    if [[ ! "$i" == "|" || ! "$i" == "Container" ]]; then
        openstack secret container delete $i
        echo $i deleted
    fi
done
## Deletion all secrets
for i in `openstack secret list | awk '{print $2}'`
do 
    if [[ ! "$i" == "Secret" ]]; then
        openstack secret delete $i
        echo $i deleted
    fi
done

```


## 
```bash
[root@deneil-rocky-barbican-test-3 rocky]# openstack secret store --name mysecret --payload j4=]d21
+---------------+-----------------------------------------------------------------------+
| Field         | Value                                                                 |
+---------------+-----------------------------------------------------------------------+
| Secret href   | http://localhost:9311/v1/secrets/278c96a3-2e21-4bd7-88b6-cf3bac689b74 |
| Name          | mysecret                                                              |
| Created       | None                                                                  |
| Status        | None                                                                  |
| Content types | None                                                                  |
| Algorithm     | aes                                                                   |
| Bit length    | 256                                                                   |
| Secret type   | opaque                                                                |
| Mode          | cbc                                                                   |
| Expiration    | None                                                                  |
+---------------+-----------------------------------------------------------------------+
[root@deneil-rocky-barbican-test-3 rocky]# openstack secret list
+-----------------------------------------------------------------------+----------+---------------------------+--------+-----------------------------------------+-----------+------------+-------------+------+------------+
| Secret href                                                           | Name     | Created                   | Status | Content types  
                         | Algorithm | Bit length | Secret type | Mode | Expiration |
+-----------------------------------------------------------------------+----------+---------------------------+--------+-----------------------------------------+-----------+------------+-------------+------+------------+
| http://localhost:9311/v1/secrets/278c96a3-2e21-4bd7-88b6-cf3bac689b74 | mysecret | 2022-12-09T08:57:39+00:00 | ACTIVE | {'default': 'application/octet-stream'} | aes       |        256 | opaque      | cbc  | None       |
+-----------------------------------------------------------------------+----------+---------------------------+--------+-----------------------------------------+-----------+------------+-------------+------+------------+
```

```bash
# --mode ctr (--bit-length >= 1024)
openstack secret order create asymmetric --name 'secret-asy-4096' --mode ctr --bit-length 4096 --algorithm rsa 
openstack secret order create asymmetric --name 'secret-asy-2024' --mode ctr --bit-length 2048 --algorithm rsa 
openstack secret order create asymmetric --name 'secret-asy-1024' --mode ctr --bit-length 1024 --algorithm rsa 
```


## 
```bash
[rocky@deneil-barbican-test ~]$ openstack secret order create asymmetric --name 'secret-asy-1024' --mode ctr --bit-length 1024 --algorithm 
rsa
+----------------+--------------------------------------------------------------------------+
| Field          | Value                                                                    |
+----------------+--------------------------------------------------------------------------+
| Order href     | http://192.168.77.15:9311/v1/orders/a150e411-e612-4756-9c55-a49c1a5c2b35 |
| Type           | Asymmetric                                                               |
| Container href | None                                                                     |
| Secret href    | N/A                                                                      |
| Created        | None                                                                     |
| Status         | None                                                                     |
| Error code     | None                                                                     |
| Error message  | None                                                                     |
+----------------+--------------------------------------------------------------------------+

[rocky@deneil-barbican-test ~]$ openstack secret order get http://192.168.77.15:9311/v1/orders/a150e411-e612-4756-9c55-a49c1a5c2b35
+----------------+------------------------------------------------------------------------------+
| Field          | Value                                                                        |
+----------------+------------------------------------------------------------------------------+
| Order href     | http://192.168.77.15:9311/v1/orders/a150e411-e612-4756-9c55-a49c1a5c2b35     |
| Type           | Asymmetric                                                                   |
| Container href | http://192.168.77.15:9311/v1/containers/1ba80de2-40fb-4920-ad95-43cbe445a934 |
| Secret href    | N/A                                                                          |
| Created        | 2022-12-13T05:50:29+00:00                                                    |
| Status         | ACTIVE                                                                       |
| Error code     | None                                                                         |
| Error message  | None                                                                         |
+----------------+------------------------------------------------------------------------------+

[rocky@deneil-barbican-test ~]$ openstack secret container get http://192.168.77.15:9311/v1/containers/1ba80de2-40fb-4920-ad95-43cbe445a934+----------------+------------------------------------------------------------------------------+
| Field          | Value                                                                        |
+----------------+------------------------------------------------------------------------------+
| Container href | http://192.168.77.15:9311/v1/containers/1ba80de2-40fb-4920-ad95-43cbe445a934 |
| Name           | secret-asy-1024                                                              |
| Created        | 2022-12-13 05:50:29+00:00                                                    |
| Status         | ACTIVE                                                                       |
| Type           | rsa                                                                          |
| Public Key     | http://192.168.77.15:9311/v1/secrets/4ac5a11a-d3fb-4083-8e75-32433179e458    |
| Private Key    | http://192.168.77.15:9311/v1/secrets/0f269cd2-df8d-47cf-93ba-eb00ed698138    |
| PK Passphrase  | None                                                                         |
| Consumers      | None                                                                         |
+----------------+------------------------------------------------------------------------------+

[rocky@deneil-barbican-test ~]$ openstack secret get --payload http://192.168.77.15:9311/v1/secrets/4ac5a11a-d3fb-4083-8e75-32433179e458
+---------+------------------------------------------------------------------+
| Field   | Value                                                            |
+---------+------------------------------------------------------------------+
| Payload | -----BEGIN PUBLIC KEY-----                                       |
|         | MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDFt/KQA0Jy9yRWbJ77cHcam1pN |
|         | Ps4wBW07DpR2rdkSet1zJeEKdbVE3hyxfo/8cj2mx9YfHwi/srlSGtvTs2h4MxmK |
|         | tOA+0iViQmkrZ62MMnt4/aWw2dC1Z/GbfgqJnBWZQGsL0V0BDU5Y1DPILGtJHy9K |
|         | EmH29WRyHVl+4/mr8QIDAQAB                                         |
|         | -----END PUBLIC KEY-----                                         |
|         |                                                                  |
+---------+------------------------------------------------------------------+
[rocky@deneil-barbican-test ~]$ openstack secret get --payload http://192.168.77.15:9311/v1/secrets/0f269cd2-df8d-47cf-93ba-eb00ed698138
+---------+------------------------------------------------------------------+
| Field   | Value                                                            |
+---------+------------------------------------------------------------------+
| Payload | -----BEGIN PRIVATE KEY-----                                      |
|         | MIICdwIBADANBgkqhkiG9w0BAQEFAASCAmEwggJdAgEAAoGBAMW38pADQnL3JFZs |
|         | nvtwdxqbWk0+zjAFbTsOlHat2RJ63XMl4Qp1tUTeHLF+j/xyPabH1h8fCL+yuVIa |
|         | 29OzaHgzGYq04D7SJWJCaStnrYwye3j9pbDZ0LVn8Zt+ComcFZlAawvRXQENTljU |
|         | M8gsa0kfL0oSYfb1ZHIdWX7j+avxAgMBAAECgYBUyXUzXLJ6KpFinmHu4WOx/TzU |
|         | M0KoRSt6T95KpnKYAihE4NGIcsGxLq6PTv7f+v2FL90aq2xNCI+ALhRmzGDXqdux |
|         | hinYMKE/0fxDevv0qlRVHxqoIXPXiClgdFDxCInhTv4poS7DMB6/rMUKt5baq1k7 |
|         | WFTxDaoqr+MnZNi7gQJBAOKdVHGR1OPvmgSxwiojX8DrndCnMOT61oOM71ggP+xd |
|         | gXoiVr6PAVmzMoDmZNhjj5eeD44TLloWTHsz9Tg9jl0CQQDfW2N/58B66cW75NVj |
|         | utr89RSj/xb7pjQLFIHnO33ZcsZLpRqEe1Jr9H4tXaSnBGzGa6NwQ+m9YU8m3daN |
|         | DfKlAkEAxwECtvkpy0EOMDEqIXcPD4vZ+vHXrj3ZQ4zwYqNvf1Jd8bNWGeHbfbow |
|         | D6JDzQMhhjP31PxjKBmM8GSgY9MqwQJAKIP7WIhBcgpVw++OhbivYJNUWys6kAtm |
|         | BVyC897mxTr8nVwlo0J7gPmoqbIC3AkBcjy0OPkYvTGZmgNDl/KfwQJBAIurWqBy |
|         | eyuBRv0+qpM4iZsOcgOsXZBls/Q96ty8MkijbRWUXHM0cL5u5lX31SyMJhP9woHQ |
|         | d2sh5r/vu0S+sM4=                                                 |
|         | -----END PRIVATE KEY-----                                        |
|         |                                                                  |
+---------+------------------------------------------------------------------+

```
























## Error message
```bash
[root@deneil-rocky-keystone-test rocky]# openstack secret list
Failed to contact the endpoint at http://192.168.100.11:9311 for discovery. 
Fallback to using that endpoint as the base url.
Unable to establish connection to http://192.168.100.11:9311/secrets: HTTPConnectionPool(host='192.168.100.11', port=9311): Max retries exceeded with url: /secrets?limit=10&offset=0 (Caused by NewConnectionError('<urllib3.connection.HTTPConnection object at 0x7ff184e9e100>: Failed to establish a new connection: [Errno 111] Connection refused'))

```


vim /etc/httpd/conf.d/wsgi-barbican.conf
新增 `Listen 9311` ，再 `systemctl restart httpd` 之後

```bash
[root@deneil-rocky-keystone-test rocky]# openstack secret list
Failed to contact the endpoint at http://192.168.100.11:9311 for discovery. 
Fallback to using that endpoint as the base url.
4xx Client error: b'<!DOCTYPE HTML PUBLIC "-//IETF//DTD HTML 2.0//EN">\n<html><head>\n<title>404 Not Found</title>\n</head><body>\n<h1>Not Found</h1>\n<p>The requested URL was not found on this server.</p>\n</body></html>\n'    
b'<!DOCTYPE HTML PUBLIC "-//IETF//DTD HTML 2.0//EN">\n<html><head>\n<title>404 Not Found</title>\n</head><body>\n<h1>Not Found</h1>\n<p>The requested URL was not found on this server.</p>\n</body></html>\n'
```



```bash
[root@deneil-barbican-test-keystone conf.d]# openstack endpoint list
+----------------------------------+-----------+--------------+--------------+---------+-----------+------------------------------+
| ID                               | Region    | Service Name | Service Type | Enabled | Interface | URL                          |
+----------------------------------+-----------+--------------+--------------+---------+-----------+------------------------------+
| 63fd73bf135740d991734a62a50e1580 | RegionOne | barbican     | key-manager  | True    | admin     | http://192.168.77.8:9311     |
| 7bcd950309664b8a9a1c85d38e66f25a | RegionOne | keystone     | identity     | True    | internal  | http://192.168.77.8:5000/v3/ |
| 86ee10b51d1e4aa8b0db5f33a9f40886 | RegionOne | keystone     | identity     | True    | admin     | http://192.168.77.8:5000/v3/ |
| 9fafc5b7011c45538574c3c9bfb08e2c | RegionOne | barbican     | key-manager  | True    | public    | http://192.168.77.8:9311     |
| b426e6b08243440f820b3693d1f7de92 | RegionOne | keystone     | identity     | True    | public    | http://192.168.77.8:5000/v3/ |
| e75000e70c86405a9790e9adb3a5284a | RegionOne | barbican     | key-manager  | True    | internal  | http://192.168.77.8:9311     |
+----------------------------------+-----------+--------------+--------------+---------+-----------+------------------------------+
```








---




yum install net-tools -y

netstat -tulpn




## fail
cat ~/.ssh/id_rsa.pub | ssh username@remote_host "mkdir -p ~/.ssh && cat >> ~/.ssh/authorized_keys"


#### ####################################



curl -g -i -X GET http://192.168.77.15:5000/v3 -H "Accept: application/json" -H "User-Agent: openstacksdk/0.101.0 keystoneauth1/5.0.0 python-requests/2.25.1 CPython/3.9.14"

curl -g -i -X GET http://192.168.77.15:9311 -H "Accept: application/json" -H "User-Agent: openstacksdk/0.101.0 keystoneauth1/5.0.0 python-requests/2.25.1 CPython/3.9.14"

# 查token
```bash
openstack token issue
```

```bash
[rocky@deneil-control-node ~]$ openstack token issue

+------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Field      | Value                                                                                                                                                                                   |
+------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| expires    | 2022-12-29T04:21:15+0000                                                                                                                                                                |
| id         | gAAAAABjrQerU-YZWTAQWViR2tKAKqMbr0ZTPEp_iozAi4NMEe0neZaUJC2AZXFHK48ed88WcM-uB8HcSmP8J61ztn3z12ii_hdC_zprS01nu9MJdixpJopAOA1RVurwk_SYBupzbsIqvDA-2yi8Bmec8YCReIv6tdA_znuR3Lr4-n12Rne4k3w |
| project_id | ba29d252fcba4a2b88189ab78aca0100                                                                                                                                                        |
| user_id    | b0522483156240dea3348a31c0144693                                                                                                                                                        |
+------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
```

```bash

curl -g -i -X GET http://192.168.77.15:5000/v3 -H "Accept: application/json" -H "User-Agent: openstacksdk/0.101.0 keystoneauth1/5.0.0 python-requests/2.25.1 CPython/3.9.14"



token="gAAAAABjrRnmChRaKU9iZormGzgmbjDGc2sGHaRzpkMMU1kEShKEBMPWkEsDmWZv9oYX6knovD6ruv9SVOFAqR-fhpDryDgG6PNII5eAZtFZGD04iLgKTuwFJfFz-T4t8Btmgqth2JSR8XEl5nimk-DTk-LrXXWkoNOsDXJ1WBEg7fpVV0qzp8g"

curl -g -i -X GET "http://192.168.77.15:9311/v1/orders?limit=10&offset=0" -H "Accept: application/json" -H "User-Agent: openstacksdk/0.101.0 keystoneauth1/5.0.0 python-requests/2.25.1 CPython/3.9.14" -H "X-Auth-Token: $token"

uuid="http://192.168.77.15:9311/v1/containers/a60f0605-25cd-458a-8cc9-0c5d7cff589c"
## desc 印出
curl -g -i -X GET http://192.168.77.15:9311/v1/secrets?sort=created:desc -H "Accept: application/json" -H "X-Auth-Token: $token"

## 所有的secrets
curl -g -i -X GET http://192.168.77.15:9311/v1/secrets -H "Accept: application/json" -H "X-Auth-Token: $token"


## 所有的 containers
curl -g -i -X GET http://192.168.77.15:9311/v1/containers -H "Accept: application/json" -H "X-Auth-Token: $token"


## 所有的orders
curl -g -i -X GET http://192.168.77.15:9311/v1/orders -H "Accept: application/json" -H "X-Auth-Token: $token"

curl -g -i -X GET http://192.168.77.15:9311/v1/secrets/0112ef6d-9d0d-4300-b65a-d0d21145fa77 -H "Accept: application/json" -H "X-Auth-Token: $token"



GET /v1/secrets/{uuid}/metadata
Headers:
    Accept: application/json
    X-Auth-Token: <token>

## create key
curl -g -i -X POST http://192.168.77.15:9311/v1/secrets -H "Accept: application/json" -H "X-Auth-Token: $token" 

POST /v1/secrets
Headers:
    Content-Type: application/json
    X-Auth-Token: <token>

Content:
{
    "name": "AES key",
    "expiration": "2015-12-28T19:14:44.180394",
    "algorithm": "aes",
    "bit_length": 256,
    "mode": "cbc",
    "payload": "YmVlcg==",
    "payload_content_type": "application/octet-stream",
    "payload_content_encoding": "base64"
}

curl -g -i -X POST http://192.168.77.15:9311/v1/secrets -H "Accept: application/json" -H "X-Auth-Token: $token" -d {"name": "AES key",    "expiration": "2015-12-28T19:14:44.180394","algorithm": "aes","bit_length": 256,"mode": "cbc","payload": "YmVlcg==","payload_content_type": "application/octet-stream", "payload_content_encoding": "base64"}

curl -g -i -X POST http://192.168.77.15:9311/v1/secrets/ -H "Content-Type: application/json" -H "User-Agent: openstacksdk/0.101.0 keystoneauth1/5.0.0 python-requests/2.25.1 CPython/3.9.14" -H "X-Auth-Token: {SHA256}b2b8cdc4a6ecace95bcf2599d30aba820af0eabd843704c1d825ec97f485a774" -d '{"name": "test", "algorithm": "aes", "mode": "cbc", "bit_length": 256, "secret_type": "opaque"}'
```








# openstack secret order create
```bash
openstack secret order create asymmetric --name 'secret-asy-2024' --mode ctr --bit-length 2048 --algorithm rsa --debug


token="gAAAAABjrR5wELjBjZECchQSy5rgs0EiwGBVBd_MBAJcWwo6pUxV5bU43Qk0wpzGHs95F9zHB67IyxFDICb99IGBlTVmZa0Frx8Ug0nQxppPags88-KN6TX4fvLRWO852u52jdGkNh-y4WO3lDv6pLyBBGJYNO6m_I7p3F3gdmyegMoDCTYKB50"

curl -g -i -X POST http://192.168.77.15:9311/v1/secrets -H "Content-Type: application/json" -H "X-Auth-Token: $token" -d '{"type": "asymmetric", "meta": {"name": "secret-asy-2024-test=api", "algorithm": "rsa", "bit_length": 2048, "payload_content_type": "application/octet-stream"}}'

curl -g -i -X POST http://192.168.77.15:9311/v1/orders/ -H "Content-Type: application/json" -H "User-Agent: openstacksdk/0.101.0 keystoneauth1/5.0.0 python-requests/2.25.1 CPython/3.9.14" -H "X-Auth-Token: $token" -d '
{
    "type": "asymmetric", 
    "meta": 
    {
        "name": "secret-asy-test", 
        "algorithm": "rsa", 
        "bit_length": 2048, 
        "payload_content_type": "application/octet-stream"
    }
}'

```




curl -g -i -X GET "http://192.168.77.15:9311/v1/orders?limit=10&offset=0" -H "Accept: application/json" -H "User-Agent: openstacksdk/0.101.0 keystoneauth1/5.0.0 python-requests/2.25.1 CPython/3.9.14" -H "X-Auth-Token: {SHA256}3319e10ceab7dc36c41cde92070f2b8c6e539da683aae99d33742173ad3de443"



