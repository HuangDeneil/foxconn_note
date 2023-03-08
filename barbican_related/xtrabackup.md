
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



## 全量備份
```bash
##################
### 
### innobackupex
### 

--socket=/var/lib/mysql/mysql.sock \

backup_path="/data/backup/mysql"
backup_path="/share/data-NFS/backup/mysql/centos7/ori"
mkdir $backup_path -p
## 全量備份-備份至指定資料夾，且創立備份時間資料夾
innobackupex \
--defaults-file=/etc/my.cnf.d/mariadb-server.cnf \
--user=root \
--password=foxconn \
$backup_path

## 準備數據(prepare)
innobackupex --apply-log $backup_path/2023-02-06_08-56-03

## 全量備份-備份至指定資料夾
innobackupex \
--defaults-file=/etc/my.cnf.d/mariadb-server.cnf \
--user=root \
--password=foxconn \
--socket=/var/lib/mysql/mysql.sock \
--no-timestamp $backup_path/blank_20230206

## 準備數據(prepare)
innobackupex --apply-log $backup_path/blank_20230206

################
### 
### xtrabackup
### 
backup_path="/data/backup/mysql/ori"
backup_path="/data/backup/mysql/test2"
mkdir $backup_path -p
## backup
xtrabackup \
--defaults-file=/etc/my.cnf.d/mariadb-server.cnf \
--backup \
--target-dir=$backup_path \
--user=root \
--password=foxconn


## prepare
xtrabackup \
--defaults-file=/etc/my.cnf.d/mariadb-server.cnf \
--prepare \
--target-dir=$backup_path \
--user=root \
--password=foxconn



```

## 還原備份資料庫
```bash
## 關閉 mariadb
systemctl stop mariadb.service
# systemctl start mariadb.service

## 清除系統中mysql 儲存位置的一切資料
rm -rf /var/lib/mysql/*

## 還原整個資料庫
backup_path="/data/backup/mysql"
##################
### 
### innobackupex
### 
innobackupex \
--defaults-file=/etc/my.cnf.d/mariadb-server.cnf \
--copy-back $backup_path/2023-02-06_08-56-03

innobackupex \
--defaults-file=/etc/my.cnf.d/mariadb-server.cnf \
--copy-back $backup_path/blank_20230206

backup_path="/data/backup/mysql/ori"
backup_path="/data/backup/mysql/innobackupex/full-20key"

################
### 
### xtrabackup
### 
xtrabackup \
--defaults-file=/etc/my.cnf.d/mariadb-server.cnf \
--target-dir=$backup_path \
--copy-back 

## 改權限
chown -R mysql:mysql /var/lib/mysql

## 開啟 mariadb
systemctl start mariadb.service

openstack secret list
```

```sql
mysql -u root -pfoxconn
show databases;
use barbican
show tables;
select * from secrets;
select * from kek_data;
select * from encrypted_data;

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
backup_path="/data/backup/mysql"
full_backup_path="$backup_path/innobackupex/full"
defaults_file="/etc/my.cnf.d/mariadb-server.cnf"

sock_path="/var/lib/mysql/mysql.sock"

--socket=$sock_path \
## 第一次須建立全量備份
innobackupex \
--defaults-file=$defaults_file \
--user=root \
--password=foxconn \
--no-timestamp $full_backup_path


## 第一次差量備份
increase_backup_path="$backup_path/innobackupex/increase-1"
innobackupex \
--defaults-file=$defaults_file \
--no-timestamp \
--user=root \
--password=foxconn \
--incremental-basedir=$full_backup_path \
--incremental $increase_backup_path

increase_backup_path="$backup_path/innobackupex/increase-1-full"
innobackupex \
--defaults-file=$defaults_file \
--user=root \
--password=foxconn \
--no-timestamp $increase_backup_path


## 建立第一把key
openstack secret order create asymmetric --name 'secret-asy-2048' --bit-length 2048 --algorithm rsa

## 第二次差量備份
increase_backup_path="$backup_path/innobackupex/increase-2"
innobackupex \
--defaults-file=$defaults_file \
--no-timestamp \
--user=root \
--password=foxconn \
--incremental-basedir=$full_backup_path \
--incremental $increase_backup_path

## 建立第二把key
openstack secret order create asymmetric --name 'secret-asy-2048-2' --bit-length 2048 --algorithm rsa

## 第三次差量備份
increase_backup_path="$backup_path/innobackupex/increase-3"
innobackupex \
--defaults-file=$defaults_file \
--no-timestamp \
--user=root \
--password=foxconn \
--incremental-basedir=$full_backup_path \
--incremental $increase_backup_path



## 產生20把key
count=0
for i in {1..20}
do
    count=$((count+=1))
    keyname="key-$count"
    echo -e "Now is creating $keyname"

openstack secret order create \
asymmetric \
--name $keyname \
--bit-length 2048 \
--algorithm rsa

done 2>&1  | tee key.log



## 第四次差量備份
full_backup_path="$backup_path/innobackupex/full-ori"
increase_backup_path="$backup_path/innobackupex/increase-4"
innobackupex \
--defaults-file=$defaults_file \
--no-timestamp \
--user=root \
--password=foxconn \
--incremental-basedir=$full_backup_path \
--incremental $increase_backup_path



backup_path="/data/backup/mysql"

full_backup_path="$backup_path/innobackupex/full-ori"
full_backup_path="$backup_path/test2"
increase_backup_path="$backup_path/innobackupex/increase-3"

## 產full backup redo log
innobackupex --apply-log --redo-only $full_backup_path

## 將差量備份合併到full backup
innobackupex --apply-log --incremental-dir=$increase_backup_path $full_backup_path


# 注：
# --incremental: 增量备份存放路径
# --incremental-basedir: 基于哪个目录增量

## 差量備份
xtrabackup \
--defaults-file=/etc/my.cnf.d/mariadb-server.cnf \
--backup \
--datadir=/var/lib/mysql \
--user=root \
--password=foxconn \
--incremental-basedir=$backup_path/test \
--target-dir=$backup_path/test-increase 







```






## 還原差量備份
```bash

## 關閉 mariadb
systemctl stop mariadb.service
# systemctl start mariadb.service

## 清除系統中mysql 儲存位置的一切資料
rm -rf /var/lib/mysql/*

backup_path="/data/backup/mysql"
full_backup_path="$backup_path/innobackupex/full"
full_backup_path="$backup_path/innobackupex/full-20key"

## 產redo log
innobackupex --apply-log --redo-only $full_backup_path

increase_backup_path="$backup_path/innobackupex/increase-3"
## 將差量備份合併到full backup
innobackupex --apply-log \
--incremental-dir=$increase_backup_path \
$full_backup_path

defaults_file="/etc/my.cnf.d/mariadb-server.cnf"
##################
### 
### innobackupex
### 
innobackupex --defaults-file=$defaults_file --copy-back $full_backup_path

## 改權限
chown -R mysql:mysql /var/lib/mysql

## 開啟 mariadb
systemctl start mariadb.service

openstack secret list
```

```sql
mysql -u root -pfoxconn
show databases;
use barbican
show tables;
select * from secrets;
select * from kek_data;
select * from encrypted_data;


```














```bash
### 增量的恢复
# 1）停止数据库
ps -ef|grep mysql
systemctl stop mariadb.service
# service mariadb.service stop

# systemctl start mariadb.service

## 清除系統中mysql 儲存位置的一切資料
rm -rf /var/lib/mysql/*


defaults_file="/etc/my.cnf.d/mariadb-server.cnf"
backup_path="/data/backup/mysql"
full_backup_path="$backup_path/xtrabackup/full-ori"

## 第一次全量備份
if [ ! -d "$full_backup_path" ] ;then
    mkdir -p $full_backup_path
fi

## 第一次全量備份 [backup]
xtrabackup \
--defaults-file=$defaults_file \
--backup \
--target-dir=$full_backup_path \
--user=root \
--password=foxconn




## 先建立folder
increase_backup_path="$backup_path/xtrabackup/increase-1"

if [ ! -d "$increase_backup_path" ] ;then
    mkdir -p $increase_backup_path
fi

## 第一次差量備份
xtrabackup \
--defaults-file=$defaults_file \
--backup \
--user=root \
--password=foxconn \
--incremental-basedir=$full_backup_path \
--target-dir=$increase_backup_path 


[root@deneil-barbican-test-seting xtrabackup]# du -sh *
86M     full-ori
11M     increase-1
96M     zipfile


#####################
## 
## merge redo log
## 
#####################
defaults_file="/etc/my.cnf.d/mariadb-server.cnf"
backup_path="/data/backup/mysql"
full_backup_path="$backup_path/xtrabackup/full-ori"
increase_backup_path="$backup_path/xtrabackup/increase-1"

## prepare - full backup
xtrabackup \
--defaults-file=$defaults_file \
--prepare \
--apply-log-only \
--target-dir=$full_backup_path \
--user=root \
--password=foxconn

## prepare - increased backup merge log to root full backup
xtrabackup \
--defaults-file=$defaults_file \
--prepare \
--incremental-dir=$increase_backup_path \
--target-dir=$full_backup_path \
--user=root \
--password=foxconn


xtrabackup \
--defaults-file=$defaults_file \
--target-dir=$full_backup_path \
--copy-back 


## 改權限
chown -R mysql:mysql /var/lib/mysql

## 開啟 mariadb
systemctl start mariadb.service


openstack secret list
```

```sql
mysql -u root -pfoxconn
show databases;
use barbican
show tables;
select * from secrets;
select * from kek_data;
select * from encrypted_data;

```


```bash


defaults_file="/etc/my.cnf.d/mariadb-server.cnf"
backup_path="/data/backup/mysql"
full_backup_path="$backup_path/xtrabackup/full-ori"
increase_backup_path="$backup_path/xtrabackup/specific_table"

## 第一次全量備份
if [ ! -d "$full_backup_path" ] ;then
    mkdir -p $full_backup_path
fi

## 第一次全量備份 [backup]
xtrabackup \
--defaults-file=$defaults_file \
--backup \
--target-dir=$full_backup_path \
--user=root \
--password=foxconn



xtrabackup \
--defaults-file=/etc/my.cnf.d/mariadb-server.cnf \
--backup \
--tables=instances,project \
--target-dir=/home/amingo/20220621-ProjectNInstance/ \
--datadir=/var/lib/mysql \
--user=root \
--password=foxconn



  --tables=name       filtering by regexp for table names.
  --databases=name    filtering by list of databases.
  --databases-exclude=name 
                      Excluding databases based on name, Operates the same way
                      as --databases, but matched names are excluded from
                      backup. Note that this option has a higher priority than
                      --databases.


  --copy-back         Copy all the files in a previously made backup from the
                      backup directory to their original locations.
  -u, --user=name     This option specifies the MySQL username used when
                      connecting to the server, if that's not the current user.
                      The option accepts a string argument. See mysql --help
                      for details.
  -H, --host=name     This option specifies the host to use when connecting to
                      the database server with TCP/IP.  The option accepts a
                      string argument. See mysql --help for details.
  -P, --port=#        This option specifies the port to use when connecting to
                      the database server with TCP/IP.  The option accepts a
                      string argument. See mysql --help for details.
  -p, --password[=name] 
                      This option specifies the password to use when connecting
                      to the database. It accepts a string argument.  See mysql
                      --help for details.


  --open-files-limit=# 
                      the maximum number of file descriptors to reserve with
                      setrlimit().
  --redo-log-version=# 
                      Redo log version of the backup. For --prepare only.





```

```bash
backup_path="/share/data-NFS/backup/mysql/"

backup_path="/data/backup/mysql"

full_backup_path="$backup_path/ori"
defaults_file="/etc/my.cnf.d/mariadb-server.cnf"

sock_path="/var/lib/mysql/mysql.sock"

## 第一次須建立全量備份
innobackupex \
--defaults-file=$defaults_file \
--user=root \
--password=foxconn \
--no-timestamp $full_backup_path

## 產生20把key
count=0
for i in {1..20}
do
    count=$((count+=1))
    keyname="key2-$count"
    echo -e "Now is creating $keyname"

openstack secret order create \
asymmetric \
--name $keyname \
--bit-length 2048 \
--algorithm rsa

done 2>&1  | tee key.log

## 第四次差量備份
full_backup_path="$backup_path/centos7/ori"
increase_backup_path="$backup_path/centos7/increase-1"
innobackupex \
--defaults-file=$defaults_file \
--no-timestamp \
--user=root \
--password=foxconn \
--incremental-basedir=$full_backup_path \
--incremental $increase_backup_path


```




```bash


backup_path="/data/backup/mysql"
increase_backup_path="$backup_path/full.add_new_user"
defaults_file="/etc/my.cnf.d/mariadb-server.cnf"

## 全備份
innobackupex \
--defaults-file=$defaults_file \
--user=root \
--password=foxconn \
--no-timestamp \
$increase_backup_path

xtrabackup \
--defaults-file=/etc/my.cnf.d/mariadb-server.cnf \
--backup \
--target-dir=$increase_backup_path \
--user=root \
--password=foxconn

## mysql service
systemctl stop mariadb.service
systemctl start mariadb.service


/data/backup/mysql/test-keystone

/var/lib/mysql/keystone

" # token required tables
keystone.federated_user          # Empty (required)
keystone.project_tag             # Empty (required)
keystone.federation_protocol     # Empty (required)
keystone.group                   # Empty
keystone.nonlocal_user           # Empty
keystone.assignment
keystone.password
keystone.user_group_membership   # Empty
keystone.role
keystone.implied_role            # Empty
keystone.project_endpoint_group  # Empty
keystone.user_option             # Empty
keystone.project_endpoint        # Empty
keystone.endpoint
keystone.endpoint_group
keystone.local_user
keystone.project
keystone.service_provider        # Empty
keystone.service
keystone.user
"

" # 
keystone.revocation_event        # Empty  

"

"
keystone.assignment
keystone.endpoint
keystone.endpoint_group
keystone.federated_user
keystone.federation_protocol
keystone.group
keystone.implied_role
keystone.local_user
keystone.nonlocal_user
keystone.password
keystone.project_endpoint
keystone.project_endpoint_group
keystone.project
keystone.project_tag
keystone.revocation_event
keystone.role
keystone.service
keystone.service_provider
keystone.user
keystone.user_group_membership
keystone.user_option
"





keystone.access_token            # Empty *
keystone.mapping                 # Empty *
keystone.system_assignment       #       *
keystone.application_credential  # Empty *
keystone.migrate_version         #       *
keystone.region                  #       *
keystone.token                       # Empty  *
keystone.application_credential_role # Empty  *
keystone.registered_limit        # Empty  *
keystone.trust                   # Empty  *
keystone.identity_provider       # Empty  *
keystone.request_token           # Empty  *
keystone.trust_role              # Empty  *
keystone.config_register         # Empty  *
keystone.id_mapping              # Empty  *
keystone.policy_association      # Empty  *
keystone.consumer                # Empty  *
keystone.idp_remote_ids          # Empty  *
keystone.credential              # Empty  
keystone.sensitive_config        # Empty  
keystone.limit                   # Empty  
keystone.whitelisted_config      # Empty  
keystone.policy
keystone.endpoint_group


list="access_token \
mapping \
system_assignment \
application_credential \
migrate_version \
region \
token \
application_credential_role \
registered_limit \
trust \
identity_provider \
request_token \
trust_role \
config_register \
id_mapping \
policy_association \
consumer \
idp_remote_ids \
credential \
sensitive_config \
limit \
whitelisted_config \
policy \
endpoint_group"


for i in $list
do
    mv /var/lib/mysql/keystone/${i}.* ./
done



keystone.access_token            # Empty *
keystone.mapping                 # Empty *
keystone.system_assignment       #       *
keystone.application_credential  # Empty *
keystone.migrate_version         #       *
keystone.region                  #       *
keystone.token                       # Empty  *
keystone.application_credential_role # Empty  *
keystone.registered_limit        # Empty  *
keystone.trust                   # Empty  *
keystone.identity_provider       # Empty  *
keystone.request_token           # Empty  *
keystone.trust_role              # Empty  *
keystone.config_register         # Empty  *
keystone.id_mapping              # Empty  *
keystone.policy_association      # Empty  *
keystone.consumer                # Empty  *
keystone.idp_remote_ids          # Empty  *
keystone.credential              # Empty  
keystone.sensitive_config        # Empty  
keystone.limit                   # Empty  
keystone.whitelisted_config      # Empty  


## keystone & barbican
echo -e "\
mysql.columns_priv
mysql.column_stats
mysql.db
mysql.event
mysql.func
mysql.general_log
mysql.gtid_slave_pos
mysql.help_category
mysql.help_keyword
mysql.help_relation
mysql.help_topic
mysql.host
mysql.index_stats
mysql.innodb_index_stats
mysql.innodb_table_stats
mysql.plugin
mysql.proc
mysql.procs_priv
mysql.proxies_priv
mysql.roles_mapping
mysql.servers
mysql.slow_log
mysql.tables_priv
mysql.table_stats
mysql.time_zone
mysql.time_zone_leap_second
mysql.time_zone_name
mysql.time_zone_transition
mysql.time_zone_transition_type
mysql.user
keystone.federated_user
keystone.project_tag
keystone.federation_protocol
keystone.group
keystone.nonlocal_user
keystone.assignment
keystone.password
keystone.user_group_membership
keystone.role
keystone.implied_role
keystone.project_endpoint_group
keystone.user_option
keystone.project_endpoint
keystone.endpoint
keystone.endpoint_group
keystone.local_user
keystone.project
keystone.service_provider
keystone.service
keystone.user
keystone.revocation_event
barbican.projects
barbican.kek_data
barbican.encrypted_data
barbican.orders
barbican.containers
barbican.container_acls
barbican.container_secret
barbican.container_consumer_metadata
barbican.secrets
barbican.secret_acls
barbican.secret_stores
barbican.secret_user_metadata
barbican.secret_store_metadata" > /root/tables.txt

xtrabackup \
--defaults-file=/etc/my.cnf.d/mariadb-server.cnf \
--backup \
--tables-file=/root/tables.txt \
--target-dir=/data/backup/mysql/basic_test \
--user=root \
--password=foxconn


xtrabackup \
--defaults-file=/etc/my.cnf.d/mariadb-server.cnf \
--backup \
--tables-file=/root/tables.txt \
--target-dir=/data/backup/mysql/basic_keystone-barbican_required_tables \
--user=root \
--password=foxconn


## 停止mysql service
systemctl stop mariadb.service

rm -rf /var/lib/mysql/*


xtrabackup \
--defaults-file=/etc/my.cnf.d/mariadb-server.cnf \
--target-dir=/data/backup/mysql/basic_test \
--copy-back 

# --target-dir=/data/backup/mysql/basic_test \
# --target-dir=/data/backup/mysql/full.add_new_user \

cp -rf /data/backup/mysql/full.add_new_user/keystone/* /var/lib/mysql/keystone/ 

## 將 keystone 部分備份的資料夾內的
cp -rf /data/backup/mysql/basic_test/keystone/* /var/lib/mysql/keystone/ 

## 將 barbican 部分備份的資料夾內的
cp -rf /data/backup/mysql/basic_test/barbican/* /var/lib/mysql/barbican/ 
# cp -rf /data/backup/mysql/basic_barbican_required_tables/barbican/* /var/lib/mysql/barbican/ 

## 修改傭有者權限
chown mysql:mysql -R /var/lib/mysql/*

## 啟動mysql
systemctl start mariadb.service









## 開啟mysql service ，先用mysql自行建立基本資料在 /var/lib/mysql
systemctl start mariadb.service

## 停止mysql service
systemctl stop mariadb.service

## 清理 /var/lib/mysql/mysql/ 
rm -rf /var/lib/mysql/mysql/*

## 建立 keystone & barbican folder
mkdir /var/lib/mysql/keystone/ 
mkdir /var/lib/mysql/barbican/

## 將 keystone 部分備份的資料夾內的
cp -rf /data/backup/mysql/basic_test/mysql/* /var/lib/mysql/mysql/ 

## 將 keystone 部分備份的資料夾內的
cp -rf /data/backup/mysql/basic_test/keystone/* /var/lib/mysql/keystone/ 

## 將 barbican 部分備份的資料夾內的
cp -rf /data/backup/mysql/basic_test/barbican/* /var/lib/mysql/barbican/ 

## 修改擁有者權限
chown mysql:mysql -R /var/lib/mysql/*

## 啟動mysql
systemctl start mariadb.service












innobackupex --databases="mydatabase.mytable mysql" $increase_backup_path

mv /var/lib/mysql/barbican/alembic_version* ./
mv /var/lib/mysql/barbican/certificate* ./
mv /var/lib/mysql/barbican/project_* ./
mv /var/lib/mysql/barbican/order_* ./
mv /var/lib/mysql/barbican/container_acl_* ./
mv /var/lib/mysql/barbican/secret_acl_* ./ 
mv /var/lib/mysql/barbican/preferred_* ./
mv /var/lib/mysql/barbican/transport_keys* ./
mv /var/lib/mysql/barbican/secret_user_metadata* ./




echo -e "barbican.projects
barbican.kek_data
barbican.encrypted_data
barbican.orders
barbican.containers
barbican.container_acls
barbican.container_secret
barbican.container_consumer_metadata
barbican.secrets
barbican.secret_acls
barbican.secret_stores
barbican.secret_user_metadata
barbican.secret_store_metadata" > /root/tables.txt
xtrabackup \
--defaults-file=/etc/my.cnf.d/mariadb-server.cnf \
--backup \
--tables-file=/root/tables.txt \
--target-dir=/data/backup/mysql/basic_barbican_required_tables \
--user=root \
--password=foxconn



xtrabackup \
--defaults-file=/etc/my.cnf.d/mariadb-server.cnf \
--target-dir=/data/backup/mysql/test-barbican \
--copy-back 

## 可直接將備份的DB data作複製貼到/var/lib/mysql/還原DB
systemctl stop mariadb.service
rm -rf /var/lib/mysql/barbican/*
# cp -rf /data/backup/mysql/test-barbican/barbican/* /var/lib/mysql/barbican/ 
# cp -rf /data/backup/mysql/basic_barbican_required_tables/barbican/* /var/lib/mysql/barbican/ 
cp -rf /data/backup/mysql/innobackupex/increase-1-full/barbican/* /var/lib/mysql/barbican/ 
chown mysql:mysql -R /var/lib/mysql/*
systemctl start mariadb.service

mysql -u root -pfoxconn



## 全還原
systemctl stop mariadb.service

rm -rf /var/lib/mysql/*

xtrabackup \
--defaults-file=/etc/my.cnf.d/mariadb-server.cnf \
--target-dir=/data/backup/mysql/innobackupex/increase-1-full \
--copy-back 

chown mysql:mysql -R /var/lib/mysql/*
systemctl start mariadb.service


# systemctl restart mariadb.service

# sudo su -s /bin/sh -c "barbican-manage db upgrade" barbican
# sudo systemctl restart --now openstack-barbican-api


containers,container_secret,container_consumer_metadata,encrypted_data,kek_data,orders,projects,secret_store_metadata,secrets,secret_user_metadata

xtrabackup \
--defaults-file=/etc/my.cnf.d/mariadb-server.cnf \
--backup \
--databases=keystone,barbican \
--tables=containers,container_secret,container_consumer_metadata,encrypted_data,kek_data,orders,projects,secret_store_metadata,secrets,secret_user_metadata \
--target-dir=/data/backup/mysql/test-keystone-barbican \
--datadir=/var/lib/mysql \
--user=root --password=foxconn



xtrabackup \
--defaults-file=/etc/my.cnf.d/mariadb-server.cnf \
--backup \
--databases=keystone \
--target-dir=/data/backup/mysql/test-keystone \
--datadir=/var/lib/mysql \
--user=root --password=foxconn




xtrabackup \
--defaults-file=/etc/my.cnf.d/mariadb-server.cnf \
--backup \
--databases=keystone,nova \
--tables=instances,project \
--target-dir=/home/amingo/20220621-DBnTables/ \
--datadir=/var/lib/mysql \
--user=root --password=foxconn


backup_path="backup/mysql/"
parial_backup_path="$backup_path/parial"

# 方式三：使用--databases参数
innobackupex \
--defaults-file=/etc/my.cnf.d/mariadb-server.cnf \
--databases="barbican.containers keystone" \
--user=root \
--password=foxconn \
$parial_backup_path


```


```bash
use barbican
MariaDB [barbican]> show tables from barbican;
+-----------------------------------+
| Tables_in_barbican                |
+-----------------------------------+
| alembic_version                   |
| certificate_authorities           |
| certificate_authority_metadata    |
| container_acl_users               |
| container_acls                    |
| container_consumer_metadata       |
| container_secret                  |
| containers                        |
| encrypted_data                    |
| kek_data                          |
| order_barbican_metadata           |
| order_plugin_metadata             |
| order_retry_tasks                 |
| orders                            |
| preferred_certificate_authorities |
| project_certificate_authorities   |
| project_quotas                    |
| project_secret_store              |
| projects                          |
| secret_acl_users                  |
| secret_acls                       |
| secret_store_metadata             |
| secret_stores                     |
| secret_user_metadata              |
| secrets                           |
| transport_keys                    |
+-----------------------------------+

select * from barbican.containers;
select * from barbican.container_secret;
select * from barbican.container_consumer_metadata;
select * from barbican.encrypted_data;
select * from barbican.kek_data;
select * from barbican.orders;
select * from barbican.projects;
select * from barbican.secret_store_metadata;
select * from barbican.secrets;
select * from barbican.secret_user_metadata;


barbican.containers
barbican.container_secret
barbican.container_consumer_metadata
barbican.encrypted_data
barbican.kek_data
barbican.orders
barbican.projects
barbican.secret_store_metadata
barbican.secrets
barbican.secret_user_metadata



# 方式二：使用--tables-file参数
echo "mydatabase.mytable" > /tmp/tables.txt  

innobackupex --tables-file=/tmp/tables.txt \
--user=backup \
--password=backup \
/path/to/backup 



```




```bash
token=`openstack token issue | grep "| id" | awk '{print $4}'`

curl \
-X PUT http://127.0.0.1:9311/v1/secrets/cc27a451-b37f-4a7c-a8fe-a1bac033d6dd/metadata \
-H "Content-Type: application/json" \
-H "X-Auth-Token: $token" \
-d '{
  "metadata": {
      "description": "contains the rsa key",
      "geolocation": "test",
      "testing": "test"
    }
}'

curl \
-X GET http://127.0.0.1:9311/v1/secrets/cc27a451-b37f-4a7c-a8fe-a1bac033d6dd/metadata \
-H "Content-Type: application/json" \
-H "X-Auth-Token: $token"


curl \
-X GET "http://127.0.0.01:9311/v1/secrets?limit=10&name=test-api-upload-3" \
-H "Accept: application/json" \
-H "X-Auth-Token: $token"


token=`openstack  token issue | grep "| id" | awk '{print $4}'`
curl \
-X POST http://127.0.0.1:9311/v1/secrets/ \
-H "Content-Type: application/json" \
-H "X-Auth-Token: $token" \
-d '{"name": "test-api-upload-3", 
"algorithm": "rsa", 
"mode": "", 
"bit_length": 2048, 
"secret_type": "private", 
"payload": "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQCoJ9aTaEQAfSZN\nJzf9zbV65Zu/mxrrwqPkUV1iy1vtfA9FbK9zOQuDjBjVT245LGjisSlZcWMjc1de\nF5sw7sL/mwIXg9aN4Ix1OPF0cVYVWNP2p7iIe7VxAwSeeq4Xo35LSIX34GADvjQo\nmqkkeg0DVALtaUO2J26O2WULRBBzBrMi9wZDk+dtEy+DWh8mhCf/CUlTdlxNTX50\n99u1O+2eWpxPpRPr7KPMNZRU4QYPDj3Ccx0F0iYPK4lUbY9KZhfkFV1JSj+0yY48\nByxJUYZ5GswcaDlyaXVPh2M7fDqOjs6GdBPR+qp8UVMSowxTDxX0n34ngWdoEi0r\nj6YJV1B3AgMBAAECggEAOBAgMEFA+tC+5lY/CrV83h6TUMyLqzLXpZWjBv86BPGp\nvcHAtS+9sPwSg3vaCeHOjlX2rUVqgjVAWbSRHz1bchDiH6jq7Z6B9csoZWQsCS32\nbXP5yDdGhQk2jwfj5ymxP7RMRhpeqKDPjwIRhoHSuNtXpoPD+YUoDSRZ1em5ej+k\ne9xrtqrWJOuFc/rwcL+2FMq4vtXjd0cA9Ox2WIAHr6jiMUx61DHRpdmSYLy7qU/k\nwg/VUipzw/OzXFoOMbFqCa4wncAwIsLZueW3awfTY3e8L6pYYAK8WbuI5+Qvebci\nVaCmflS92ZlwVgclF227y6kivfhCZia4fM91gtMeUQKBgQDmRyN5hMg1OAnkUO6e\npoV8ST+RlPGSyQFwFcacvgPcHgJeyeEB3CWcT4u0J4x82XAKe8dXNpXG97eG1gjA\noIv+ty01nDfUjJiX6/iv2FkiEnYh/VehbC62pGk/vfuruER5remh0CbC6+3Z263F\njM49EmsVmLNoD2Wt6zrWyPVpewKBgQC68Eu3czIuKvzYwix2r3eemv7GOw4TGsZq\n+liBArhP7dyKuv8kcr+sXKP30Rw/F4kuNxTZ6iOUp0++ifPtMu/GzCDDsLfOc+nc\nvTYwUuROPfmEhOtt73aoTu+GH9RoJrQa6WyRRyxoLlT4M50EPivQXHztYjluXV7h\nlFxf359ONQKBgQCi3EEcmmo2KVHlpc99aOwTQIKy5ZIMbBiWOvBivohgTuECROjb\nteTrrd5yJV5YljeFUpFi/vni5CNqO0mpYmJgXRCeT8O0kVMCbyNMykgPrtrZoyEs\nyyQmjBTbvfOWORZEsFkB1gLz7IQlhhZaFwFtc+9EMOEBgZI59JmCelIGrQKBgQCM\njjigCqFkTTYn1HeSFYSfYHLHoYeHnc4qiWkaN21Vy8bTGJ7WTOEJO+6dWkEevxeK\nBChNYNq33sT6wscBRhc7JihMewb41/ay3iFsXCcFHVwK49YQpshU7GT0N+KBHPi2\nc2QKJ7Wf75Y7uLMKiaRv2dqksgH0lYfNnLuH6p/hMQKBgF9yurywod2Hb9uTGzGS\nHLFZI44QnKpJr/kSPhyh90o/52KTlhnN3C8mJ81tLJhAOH1L7beeG2hiYyy+gQCU\n/Rejy2CpQkkyyc9AEzFcxHzluH03uwDzyLhDYZ7JweY7V8NVR073QM+wbc9oo3HU\nGUUTiasF3KtqIF3rpqAM/l0f\n-----END PRIVATE KEY-----\n", 
"payload_content_type": "text/plain" 
}'




```


















