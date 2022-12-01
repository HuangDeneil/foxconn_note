
yum update -y
yum upgrade -y
yum install nano
yum install tree
yum install -y wget 

## old 
# yum install -y MariaDB-server MariaDB-client MariaDB-compat galera socat jemalloc

yum install -y mariadb-server
yum install -y socat 
yum install -y galera 

## update yum
sudo yum makecache

## list all repo
dnf repolist

# yum install -y jemalloc



## libboost_program_options.so.1.53.0
wget http://mirror.centos.org/centos/7/os/x86_64/Packages/boost-program-options-1.53.0-28.el7.x86_64.rpm
sudo rpm -ivh boost-program-options-1.53.0-28.el7.x86_64.rpm

## galera-25.3.29 (required libboost_program_options.so.1.53.0)
wget https://mirrors.cloud.tencent.com/mariadb/yum/10.3/centos/7/x86_64/rpms/galera-25.3.29-1.rhel7.el7.centos.x86_64.rpm
sudo rpm -ivh galera-25.3.29-1.rhel7.el7.centos.x86_64.rpm

## jemalloc-3.6.0-1
wget https://mirrors.cloud.tencent.com/mariadb/yum/10.3/centos/7/x86_64/rpms/jemalloc-3.6.0-1.el7.x86_64.rpm
sudo rpm -ivh jemalloc-3.6.0-1.el7.x86_64.rpm

## start service
# sudo systemctl restart mariadb.service
sudo systemctl start mariadb.service
sudo systemctl status mariadb.service

## 設定mysql 密碼
 mysql_secure_installation 
```bash
[root@deneil-test3 centos]#  mysql_secure_installation 

NOTE: RUNNING ALL PARTS OF THIS SCRIPT IS RECOMMENDED FOR ALL MariaDB
      SERVERS IN PRODUCTION USE!  PLEASE READ EACH STEP CAREFULLY!

In order to log into MariaDB to secure it, we'll need the current
password for the root user.  If you've just installed MariaDB, and
you haven't set the root password yet, the password will be blank,
so you should just press enter here.

Enter current password for root (enter for none):
OK, successfully used password, moving on...

Setting the root password ensures that nobody can log into the MariaDB
root user without the proper authorisation.

Set root password? [Y/n] y
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

---
# Rabbitmq installation

## Erlang (rabbitmq required)
```bash
wget https://packages.erlang-solutions.com/erlang/rpm/centos/7/x86_64/esl-erlang_24.0.2-1~centos~7_amd64.rpm
sudo yum -y install esl-erlang*.rpm
```

## rabbitmq-server-3.8.19-1
```bash
wget https://github.com/rabbitmq/rabbitmq-server/releases/download/v3.8.19/rabbitmq-server-3.8.19-1.el7.noarch.rpm
sudo rpm -ivh rabbitmq-server-3.8.19-1.el7.noarch.rpm
```

## 確認是否安裝成功
chkconfig --list

```bash
[root@deneil-test3 centos]# chkconfig --list

Note: This output shows SysV services only and does not include native
      systemd services. SysV configuration data might be overridden by native
      systemd configuration.

      If you want to list systemd services use 'systemctl list-unit-files'.
      To see services enabled on particular target use
      'systemctl list-dependencies [target]'.

netconsole      0:off   1:off   2:off   3:off   4:off   5:off   6:off
network         0:off   1:off   2:on    3:on    4:on    5:on    6:off
```


yum install rabbitmq-server




sudo systemctl enable rabbitmq-server.service
sudo systemctl start rabbitmq-server.service

cat /var/lib/rabbitmq/.erlang.cookie
```bash
[root@deneil-test3 centos]#  cat /var/lib/rabbitmq/.erlang.cookie
CIJDCJWFXOANNNGRURKQ
```


## 將使用者跟擁有者換成rabbitmq:rabbitmq
chown rabbitmq:rabbitmq /var/lib/rabbitmq/.erlang.cookie
chmod 400 /var/lib/rabbitmq/.erlang.cookie

```bash
[root@deneil-test3 centos]# chown rabbitmq:rabbitmq /var/lib/rabbitmq/.erlang.cookie
[root@deneil-test3 centos]# chmod 400 /var/lib/rabbitmq/.erlang.cookie
[root@deneil-test3 centos]#  ls /var/lib/rabbitmq/ -la
total 12
drwxr-xr-x.  3 rabbitmq rabbitmq   40 Nov 22 08:09 .
drwxr-xr-x. 31 root     root     4096 Nov 22 08:04 ..
-r--------.  1 rabbitmq rabbitmq   20 Nov 22 00:00 .erlang.cookie
```

systemctl daemon-reload

systemctl restart rabbitmq-server.service


## rabbitmq servive down
systemctl stop rabbitmq-server.service

## rabbitmq servive up
systemctl start rabbitmq-server.service

rabbitmqctl cluster_status

---- 

# 增加用戶

## 1. 增加openstack用戶
```bash
[root@deneil-test3 centos]# rabbitmqctl add_user openstack foxconn
warning: the VM is running with native name encoding of latin1 which may cause Elixir to malfunction as it expects utf8. Please ensure your locale is set to UTF-8 (which can be verified by running "locale" in your shell)
Adding user "openstack" ...
Done. Don't forget to grant the user permissions to some virtual hosts! See 'rabbitmqctl help set_permissions' to learn more.
```

## 2. 設置用戶許可權
rabbitmqctl set_permissions -p / openstack ".*" ".*" ".*"
```bash
[root@deneil-test3 centos]# rabbitmqctl set_permissions -p / openstack ".*" ".*" ".*"
warning: the VM is running with native name encoding of latin1 which may cause Elixir to malfunction as it expects utf8. Please ensure your locale is set to UTF-8 (which can be verified by running "locale" in your shell)
Setting permissions for user "openstack" in vhost "/" ...
```

## 3. 配置queue mirror
rabbitmqctl set_policy -p / ha-all '^(?!amq\.).*' '{"ha-mode": "all"}'
```bash
[root@deneil-test3 centos]# rabbitmqctl set_policy -p / ha-all '^(?!amq\.).*' '{"ha-mode": "all"}'
warning: the VM is running with native name encoding of latin1 which may cause Elixir to malfunction as it expects utf8. Please ensure your locale is set to UTF-8 (which can be verified by running "locale" in your shell)
Setting policy "ha-all" for pattern "^(?!amq\.).*" to "{"ha-mode": "all"}" with priority "0" for vhost "/" ...
```

---





# OpenStack Train and earlier are available on both CentOS 7 and RHEL 7.
# <<< 官方說明: CentOS7只能裝到 Train >>>
## Queens 到Train version barbican只有在HSM api功能上的更新
## 另外在Train修改secret 預設最大長度(10 kB to 20 kb)及最大request長度(15 kB to 25 kB) 但是應該不會影響

## train release installing
# yum install centos-release-openstack-train

## queens release installing
yum install centos-release-openstack-queens

yum install python-openstackclient


## 1. Keystone installationk
yum -y install openstack-keystone 


## centOS7
yum -y install python-memcached
yum -y install httpd mod_wsgi memcached

## 2. 啟動Memcached服務
nano /etc/sysconfig/memcached
```conf
PORT="11211"
USER="memcached"
MAXCONN="1024"
CACHESIZE="64"
OPTIONS="-l 0.0.0.0,::1,controller"
```

systemctl enable memcached.service
systemctl start memcached.service












