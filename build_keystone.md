




```bash
sudo su

## update 
sudo yum update -y

sudo yum install nano vim -y

## Install network-scripts package
sudo dnf install network-scripts -y


## Disable NetworkManager
sudo systemctl disable NetworkManager
sudo systemctl stop NetworkManager
sudo systemctl enable NetworkManager


## download rpm file
dnf install https://repos.fedorapeople.org/repos/openstack/openstack-zed/rdo-release-zed-1.el9s.noarch.rpm -y

## install client
yum install python3-openstackclient -y

```

## Disable selinux
```bash
vim /etc/selinux/config
```
```conf
...
SELINUX=disabled
...
SELINUXTYPE=targeted
```
### note : 沒有關閉selinux會導致keystone沒有權限開5000 port

# keystone installation

1. MariaDB installation & database setting
```bash
# mariadb install
yum install -y mariadb-server

# sudo systemctl restart mariadb.service
sudo systemctl start mariadb.service
sudo systemctl enable mariadb.service


# 設定root passwd & login policy
mysql_secure_installation 
```

```bash
[root@deneil-barbican-test-keystone rocky]# mysql_secure_installation
...

Switch to unix_socket authentication [Y/n] y
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

MariaDB [(none)]> exit;
Bye
```


2. install keystone


### download required
```bash
dnf install openstack-keystone httpd python3-mod_wsgi memcached -y
```

## Edit `keystone.conf`
vim /etc/keystone/keystone.conf

```conf
[database]
# ...
connection = mysql+pymysql://keystone:foxconn@192.168.77.8/keystone
; connection = mysql+pymysql://keystone:foxconn@192.168.77.6/keystone
# connection = mysql+pymysql://keystone:foxconn@192.168.77.17/keystone
# connection = mysql+pymysql://keystone:keystone_foxconn@192.168.19.41/keystone

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
--bootstrap-admin-url http://192.168.77.8:5000/v3/ \
--bootstrap-internal-url http://192.168.77.8:5000/v3/ \
--bootstrap-public-url http://192.168.77.8:5000/v3/ \
--bootstrap-region-id RegionOne
```


```bash 
keystone-manage bootstrap --bootstrap-password admin_foxconn \
--bootstrap-admin-url http://192.168.66.29:5000/v3/ \
--bootstrap-internal-url http://192.168.66.29:5000/v3/ \
--bootstrap-public-url http://192.168.66.29:5000/v3/ \
--bootstrap-region-id RegionOne
```

```bash 
keystone-manage bootstrap --bootstrap-password admin_foxconn \
--bootstrap-admin-url http://192.168.66.26:5000/v3/ \
--bootstrap-internal-url http://192.168.66.26:5000/v3/ \
--bootstrap-public-url http://192.168.66.26:5000/v3/ \
--bootstrap-region-id RegionOne
```






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







## 
```bash
echo -e "
export OS_USERNAME=admin
export OS_PASSWORD=admin_foxconn
export OS_PROJECT_NAME=admin
export OS_USER_DOMAIN_NAME=Default
export OS_PROJECT_DOMAIN_NAME=Default
export OS_AUTH_URL=http://192.168.66.29:5000/v3
export OS_IDENTITY_API_VERSION=3
" > admin-openrc.sh

```

## Test keystone work
```bash
. admin-openrc.sh
openstack endpoint list


```













