

# 其他連線方式 使用net-001上面用ip netns exec 直接ssh 進入同往段的機器
ip netns exec qdhcp-<OPSTK network_id> ssh -i <key.pem> <user>@<ip>

ip netns exec qdhcp-cb807b61-8351-41fa-a635-add24dc7612f ssh -i Ubuntu20_key.pem rocky@192.168.66.10

## 連線至net-002
ssh -i ~/keyTest/foxconn-openstack_key.pem root@172.16.16.26

## 透過 net-002 進到network id 網域ssh 連線
ip netns exec qdhcp-764abfc0-05ee-4a6e-8b2b-5e0b81af9bf2 ssh -i ~/deneil-dev/Ubuntu20_key.pem rocky@192.168.77.4

ip netns exec qdhcp-764abfc0-05ee-4a6e-8b2b-5e0b81af9bf2 ssh -i ~/deneil-dev/Ubuntu20_key.pem rocky@192.168.77.6



bash rocky_ssh.sh
bash ~/deneil-dev/myRockyLinuxBarbican.sh

# Rocky linux 9

---

export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8


```bash
sudo su

## update 
yum update -y
```

## Disable `firewall`

<!-- ```bash
sudo systemctl disable firewalld
sudo systemctl stop firewalld
``` -->

## Install network-scripts package
```bash
sudo dnf install network-scripts -y
```

## Disable NetworkManager
```bash
sudo systemctl disable NetworkManager
sudo systemctl stop NetworkManager
sudo systemctl enable NetworkManager
```


<!-- 
# Start Network Service
```bash
sudo systemctl enable network
sudo systemctl start network
``` -->

## Disable selinux
```bash
sudo yum install nano vim -y
vim /etc/selinux/config
```
```conf
...
SELINUX=disabled
...
SELINUXTYPE=targeted
```

## 時間配置
```bash
sudo yum install chrony
```


## install openstack zed version
```bash
## download rpm file
dnf install https://repos.fedorapeople.org/repos/openstack/openstack-zed/rdo-release-zed-1.el9s.noarch.rpm -y

## install client
yum install python3-openstackclient -y
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

# mariadb install
```bash
yum install -y mariadb-server
yum install -y socat 
yum install -y galera 
```

# mariadb servie restart
```bash
# sudo systemctl restart mariadb.service
sudo systemctl start mariadb.service
sudo systemctl enable mariadb.service
```

## 設定mysql 密碼
mysql_secure_installation 

```bash
[root@deneil-barbican-rock-test rocky]# mysql_secure_installation

NOTE: RUNNING ALL PARTS OF THIS SCRIPT IS RECOMMENDED FOR ALL MariaDB
      SERVERS IN PRODUCTION USE!  PLEASE READ EACH STEP CAREFULLY!

In order to log into MariaDB to secure it, we'll need the current
password for the root user. If you've just installed MariaDB, and
haven't set the root password yet, you should just press enter here.

Enter current password for root (enter for none): 
OK, successfully used password, moving on...

Setting the root password or using the unix_socket ensures that nobody
can log into the MariaDB root user without the proper authorisation.

You already have your root account protected, so you can safely answer 'n'.

Switch to unix_socket authentication [Y/n] y
Enabled successfully!
Reloading privilege tables..
 ... Success!


You already have your root account protected, so you can safely answer 'n'.

Change the root password? [Y/n] y
New password: 
Re-enter new password:
Password updated successfully!
Reloading privilege tables..
 ... Success!


By default, a MariaDB installation has an anonymous user, allowing anyone
to log into MariaDB without having to have a user account created for
them.  This is intended only for testing, and to make the installation
go a bit smoother.  You should remove them before moving into a
production environment.

Remove anonymous users? [Y/n] y
 ... Success!

Normally, root should only be allowed to connect from 'localhost'.  This
ensures that someone cannot guess at the root password from the network.

Disallow root login remotely? [Y/n] n
 ... skipping.

By default, MariaDB comes with a database named 'test' that anyone can
access.  This is also intended only for testing, and should be removed
before moving into a production environment.

Remove test database and access to it? [Y/n] y
 - Dropping test database...
 ... Success!
 - Removing privileges on test database...
 ... Success!

Reloading the privilege tables will ensure that all changes made so far
will take effect immediately.

Reload privilege tables now? [Y/n] y
 ... Success!

Cleaning up...

All done!  If you've completed all of the above steps, your MariaDB
installation should now be secure.

Thanks for using MariaDB!
```

## keystone mysql database
```bash
[root@deneil-barbican-rock-test rocky]# mysql -uroot -pfoxconn
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
```


## install keystone
dnf install openstack-keystone httpd python3-mod_wsgi -y


vim /etc/keystone/keystone.conf

```conf
[database]
# ...
connection = mysql+pymysql://keystone:foxconn@192.168.77.6/keystone
# connection = mysql+pymysql://keystone:foxconn@192.168.77.17/keystone
# connection = mysql+pymysql://keystone:keystone_foxconn@192.168.19.41/keystone

...

[token]
# ...
provider = fernet
...

```

## Populate the Identity service database:
su -s /bin/sh -c "keystone-manage db_sync" keystone


# Initialize Fernet key repositories:
```bash
keystone-manage fernet_setup --keystone-user keystone --keystone-group keystone
keystone-manage credential_setup --keystone-user keystone --keystone-group keystone
```

## Bootstrap the Identity service:
```bash 
keystone-manage bootstrap --bootstrap-password admin_foxconn \
--bootstrap-admin-url http://192.168.77.6:5000/v3/ \
--bootstrap-internal-url http://192.168.77.6:5000/v3/ \
--bootstrap-public-url http://192.168.77.6:5000/v3/ \
--bootstrap-region-id RegionOne
```


### ###################################################################
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
vim /etc/httpd/conf.d/wsgi-keystone.conf 


```xml
Listen 5000

<VirtualHost *:5000>
    WSGIDaemonProcess keystone-public processes=5 threads=1 user=keystone group=keystone display-name=%{GROUP}
    WSGIProcessGroup keystone-public
    WSGIScriptAlias / /usr/bin/keystone-wsgi-public
    WSGIApplicationGroup %{GLOBAL}
    WSGIPassAuthorization On
    ErrorLogFormat "%{cu}t %M"
    ErrorLog /var/log/apache2/keystone.log
    CustomLog /var/log/apache2/keystone_access.log combined

    <Directory /usr/bin>
        Require all granted
    </Directory>
</VirtualHost>
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
    ErrorLog /var/log/keystone/keystone.log
    CustomLog /var/log/keystone/keystone_access.log combined

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
systemctl restart httpd
systemctl status httpd
```


## 
```bash
export OS_USERNAME=admin
export OS_PASSWORD=admin_foxconn
export OS_PROJECT_NAME=admin
export OS_USER_DOMAIN_NAME=Default
export OS_PROJECT_DOMAIN_NAME=Default
export OS_AUTH_URL=http://192.168.77.6:5000/v3
export OS_IDENTITY_API_VERSION=3
```


openstack endpoint list



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
rabbitmqctl join_cluster rabbit@control1
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

## Create the barbican user:
```bash
openstack user create --domain default --password-prompt barbican
```
## output
```bash
[root@deneil-barbican-test-keystone rocky]# openstack user create --domain default --password-prompt barbican
User Password:
Repeat User Password:
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
openstack endpoint create --region RegionOne key-manager public http://192.168.77.8:9311
openstack endpoint create --region RegionOne key-manager internal http://192.168.77.8:9311
openstack endpoint create --region RegionOne key-manager admin http://192.168.77.8:9311

```

# Barbican installation
```bash

sudo yum install openstack-barbican-api openstack-barbican-keystone-listener openstack-barbican-worker -y

```


## Edit `/etc/barbican/barbican.conf`

```bash
vim /etc/barbican/barbican.conf
```



```conf
[DEFAULT]
...
sql_connection = mysql+pymysql://barbican:foxconn@192.168.77.8/barbican
...

[DEFAULT]
...
transport_url = rabbit://openstack:RABBIT_PASS@192.168.77.8
...

[keystone_authtoken]
...
www_authenticate_uri = http://192.168.77.8:5000
auth_url = http://192.168.77.8:5000
memcached_servers = 192.168.77.8:11211
auth_type = password
project_domain_name = default
user_domain_name = default
project_name = service
username = barbican
password = admin_foxconn

```

# Populate the Key Manager service database:
```bash
su -s /bin/sh -c "barbican-manage db upgrade" barbican
```






---


















































