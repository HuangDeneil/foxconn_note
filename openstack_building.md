

# 其他連線方式 使用net-001上面用ip netns exec 直接ssh 進入同往段的機器
ip netns exec qdhcp-<OPSTK network_id> ssh -i <key.pem> <user>@<ip>

ip netns exec qdhcp-cb807b61-8351-41fa-a635-add24dc7612f ssh -i Ubuntu20_key.pem rocky@192.168.66.10

## 連線至net-002
ssh -i ~/keyTest/foxconn-openstack_key.pem root@172.16.16.26

## 透過 net-002 進到network id 網域ssh 連線
ip netns exec qdhcp-764abfc0-05ee-4a6e-8b2b-5e0b81af9bf2 ssh -i ~/deneil-dev/Ubuntu20_key.pem rocky@192.168.77.4


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
dnf makecache --refresh
dnf -y install arp-scan

```

## Disable `firewall`

```bash
sudo systemctl disable firewalld
sudo systemctl stop firewalld
```

## Disable NetworkManager
```bash
sudo systemctl disable NetworkManager
sudo systemctl stop NetworkManager
```

## Install network-scripts package
```bash
sudo dnf install network-scripts -y
```

# Start Network Service
```bash
sudo systemctl enable network
sudo systemctl start network
```

## Disable selinux
- edited `/etc/selinux/config`


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
connection = mysql+pymysql://keystone:foxconn@192.168.77.17/keystone
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
  --bootstrap-admin-url http://192.168.77.4:5000/v3/ \
  --bootstrap-internal-url http://192.168.77.4:5000/v3/ \
  --bootstrap-public-url http://192.168.77.4:5000/v3/ \
  --bootstrap-region-id RegionOne
```


### ###################################################################
--------------------------------



# Configure the Apache HTTP server



# Start service
```bash
sudo systemctl start httpd
```

# Enable
```bash
sudo systemctl enable httpd
```



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


chown -R keystone:keystone /etc/keystone

## apache2 service start
```bash
systemctl enable httpd
systemctl start  httpd
systemctl restart  httpd
systemctl status httpd
```


## 
```bash
export OS_USERNAME=admin
export OS_PASSWORD=foxconn
export OS_PROJECT_NAME=admin
export OS_USER_DOMAIN_NAME=Default
export OS_PROJECT_DOMAIN_NAME=Default
export OS_AUTH_URL=http://192.168.77.4:5000/v3
export OS_IDENTITY_API_VERSION=3
```


























---







































# Rabbitmq installation

yum install rabbitmq-server -y

nano /etc/rabbitmq/rabbitmq.conf
```conf
   ...
[{rabbit,[{loopback_users, []}]}].
```

sudo systemctl enable rabbitmq-server.service
sudo systemctl start rabbitmq-server.service


<!-- 
# Now is using Centos stream 9

sudo dnf update -y
sudo dnf config-manager --enable crb
sudo dnf install -y centos-release-openstack-zed
sudo setenforce 0
sudo dnf update -y
sudo dnf install -y openstack-packstack
sudo packstack --allinone

 -->


