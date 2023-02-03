
## installation 
- https://www.cnblogs.com/eagle6688/p/17066856.html


```bash
## 安裝 Percona yum repository
sudo yum install https://repo.percona.com/yum/percona-release-latest.noarch.rpm -y
## 啟用repository
sudo percona-release enable-only tools release
## 安裝XtraBackup
sudo yum install percona-xtrabackup-80 -y
## 安裝qpress
sudo yum install qpress -y
## 安裝ZSTD壓縮
sudo yum install zstd -y

```


### Offical installaion XtraBackup-2.4
## https://docs.percona.com/percona-xtrabackup/2.4/installation/yum_repo.html
```bash
## 
yum install https://repo.percona.com/yum/percona-release-latest.noarch.rpm -y

## Make sure packages are now available from the repository
yum list | grep percona

## Enable the repository
percona-release enable-only tools release

## Install Percona XtraBackup
yum install percona-xtrabackup-24 -y
yum install percona-xtrabackup-23 -y

## To be able to make compressed backups, install the qpress package
yum install qpress -y

#### download rpm
wget https://www.percona.com/downloads/XtraBackup/Percona-XtraBackup-2.4.4/\
binary/redhat/7/x86_64/percona-xtrabackup-24-2.4.4-1.el7.x86_64.rpm
## install local rpm file
yum localinstall percona-xtrabackup-24-2.4.4-1.el7.x86_64.rpm



## uninstallation
yum remove percona-xtrabackup
yum remove xtrabackup

```


### Note:
- 8.0是針對8.0開發的，不兼容5.X的版本
- 2.4針對5.7開發，兼容5.6，5.5
- 2.3針對5.6開發，兼容5.5
- 2.2針對5.5開發
原文網址：https://kknews.cc/code/qgvxy2o.html](https://kknews.cc/code/qgvxy2o.html


openstack secret order create asymmetric --name 'secret-asy-2048' --bit-length 2048 --algorithm rsa


sudo mysql -sfu root -pfoxconn < barbican.backup-10000.sql
mysql -p -u root barbican < barbican.backup-10000.sql
mysql -p -u [user] [database] < backup-file.sql



```bash
xtrabackup \
--defaults-file=/etc/my.cnf.d/mariadb-server.cnf \
--backup \
--tables=instances,project \
--target-dir=/home/amingo/20220621-ProjectNInstance/ \
--datadir=/var/lib/mysql \
--user=root \
--password=foxconn


--defaults-file=/etc/my.cnf.d/mariadb-server.cnf \

## testing  rocky (fail at the redo log)
xtrabackup \
--backup \
--target-dir=/home/rocky/backup/mysql/test \
--datadir=/var/lib/mysql \
--user=root \
--password=foxconn


/home/rocky/backup/mysql/test



## centos
xtrabackup \
--defaults-file=/etc/my.cnf.d/mariadb-server.cnf \
--backup \
--target-dir=/home/centos/backup/mysql/xtrabackup_20230202 \
--datadir=/var/lib/mysql \
--user=root \
--password=foxconn


xtrabackup \
--backup \
--target-dir=/home/centos/backup/mysql/test \
--datadir=/var/lib/mysql \
--user=root \
--password=foxconn

xtrabackup \
--defaults-file=/home/centos/backup/test-remote/192.168.77.15/mysql-clients.cnf \
--backup \
--target-dir=/home/centos/backup/test-remote/192.168.77.15 \
--datadir=/var/lib/mysql \
--host=192.168.77.15 \
--port=3306  \
--user=root \
--password=foxconn


```

### error message
```bash
[root@deneil-barbican-test my.cnf.d]# xtrabackup --defaults-file=/etc/my.cnf.d/mariadb-server.cnf --backup --target-dir=/home/rocky/backup/mysql/ --datadir=/var/lib/mysql --user=root --password=foxconn
xtrabackup: recognized server arguments: --datadir=/var/lib/mysql --datadir=/var/lib/mysql 
xtrabackup: recognized client arguments: --backup=1 --target-dir=/home/rocky/backup/mysql/ --user=root --password=* 
230130 17:13:40  version_check Connecting to MySQL server with DSN 'dbi:mysql:;mysql_read_default_group=xtrabackup' as 'root'  (using password: YES).
230130 17:13:40  version_check Connected to MySQL server
230130 17:13:40  version_check Executing a version check against the server...
230130 17:13:40  version_check Done.
230130 17:13:40 Connecting to MySQL server host: localhost, user: root, password: set, port: not set, socket: not set
Using server version 10.5.16-MariaDB
xtrabackup version 2.4.27 based on MySQL server 5.7.40 Linux (x86_64) (revision id: aae8e82)
xtrabackup: uses posix_fadvise().
xtrabackup: cd to /var/lib/mysql
xtrabackup: open files limit requested 0, set to 1024
xtrabackup: using the following InnoDB configuration:
xtrabackup:   innodb_data_home_dir = .
xtrabackup:   innodb_data_file_path = ibdata1:12M:autoextend
xtrabackup:   innodb_log_group_home_dir = ./
xtrabackup:   innodb_log_files_in_group = 1
xtrabackup:   innodb_log_file_size = 100663296
InnoDB: Number of pools: 1
InnoDB: Unsupported redo log format. The redo log was created with MariaDB 10.5.16. Please follow the instructions at http://dev.mysql.com/doc/refman/5.7/en/upgrading-downgrading.html
[root@deneil-barbican-test my.cnf.d]# 

```


```bash
xtrabackup \
--defaults-file=/etc/my.cnf.d/mariadb-server.cnf \
--prepare \
--tables=instances,project \
--target-dir=/home/amingo/20220621-ProjectNInstance/ \
--datadir=/var/lib/mysql \
--user=root \
--password=foxconn

xtrabackup \
--defaults-file=/etc/my.cnf.d/mysql-clients.cnf \
--backup \
--target-dir=/home/centos/backup/mysql/innobackupex_20230201/ \
--datadir=/var/lib/mysql \
--user=root \
--password=foxconn

xtrabackup \
--defaults-file=/etc/my.cnf.d/mysql-clients.cnf \
--prepare \
--target-dir=/home/centos/backup/mysql/innobackupex_20230201/ \
--datadir=/var/lib/mysql \
--user=root \
--password=foxconn





```





## 備份所有資料庫
```bash
mkdir -p /home/centos/backup/mysql/innobackupex_20230131

innobackupex \
--defaults-file=/etc/my.cnf.d/mysql-clients.cnf \
--user root \
--password foxconn \
--no-timestamp /home/centos/backup/mysql/innobackupex_20230131

原文網址：https://kknews.cc/code/qgvxy2o.html


```


## 全量備份
```bash
mkdir -p /data/backup/
## 全量備份-備份至指定資料夾，且創立備份時間資料夾
innobackupex \
--defaults-file=/etc/my.cnf.d/mariadb-server.cnf \
--user=root \
--password=foxconn \
--socket=/var/lib/mysql/mysql.sock \
/data/backup/


innobackupex \
--defaults-file=/etc/my.cnf.d/mariadb-server.cnf \
--user=root \
--password=foxconn \
--datadir=/var/lib/mysql \
--socket=/var/lib/mysql/mysql.sock \
/home/centos/backup/mysql/blank_20230202

## backup
xtrabackup \
--defaults-file=/etc/my.cnf.d/mariadb-server.cnf \
--backup \
--target-dir=/home/centos/backup/mysql/blank_20230202 \
--datadir=/var/lib/mysql \
--user=root \
--password=foxconn

## prepare
xtrabackup \
--defaults-file=/etc/my.cnf.d/mariadb-server.cnf \
--prepare \
--target-dir=/home/centos/backup/mysql/blank_20230202 \
--datadir=/var/lib/mysql \
--user=root \
--password=foxconn




## 全量備份-備份至指定資料夾
innobackupex \
--defaults-file=/etc/my.cnf.d/mariadb-server.cnf \
--user=root \
--password=foxconn \
--socket=/var/lib/mysql/mysql.sock \
--no-timestamp /home/centos/backup/mysql/20230202

## 準備數據(prepare)
innobackupex \
--apply-log /data/backup/2023-02-01_17-19-24
```

## 還原備份資料庫
```bash
## 关闭mysql，并清除数据文件
# service mariadb stop
systemctl stop mariadb.service
# systemctl start mariadb.service
cd  mysqldata
rm -rf *

## 還原整個資料庫
innobackupex \
--defaults-file=/etc/my.cnf.d/mariadb-server.cnf \
--copy-back /data/backup/2023-02-01_17-19-24

innobackupex \
--defaults-file=/etc/my.cnf.d/mariadb-server.cnf \
--copy-back /home/centos/backup/mysql/blank_20230202


## 改權限
cd /var/lib/mysql
chown -R mysql:mysql *

```


## `/etc/my.cnf.d/mariadb-server.cnf`:
```conf
...
[mysqld]
datadir=/var/lib/mysql
socket=/var/lib/mysql/mysql.sock
log-error=/var/log/mariadb/mariadb.log
pid-file=/var/run/mariadb/mariadb.pid
...
```


## 增量備份
```bash
innobackupex \
--defaults-file=/etc/my.cnf.d/mariadb-server.cnf \
--no-timestamp \
--incremental-basedir=/data/backup/2023-02-01_17-19-24 \
--user=root --password=password \
--incremental \
/data/backup/2023-02-01_17-19-24_inc1


```

