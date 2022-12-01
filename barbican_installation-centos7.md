## jemalloc-3.6.0-1
wget https://mirrors.cloud.tencent.com/mariadb/yum/10.3/centos/7/x86_64/rpms/jemalloc-3.6.0-1.el7.x86_64.rpm
sudo rpm -ivh jemalloc-3.6.0-1.el7.x86_64.rpm

## perl 5.16 rpm install
```bash
list="\
perl-5.16.3-297.el7.x86_64.rpm \
perl-Carp-1.26-244.el7.noarch.rpm \
perl-constant-1.27-2.el7.noarch.rpm \
perl-Encode-2.51-7.el7.x86_64.rpm \
perl-Exporter-5.68-3.el7.noarch.rpm \
perl-File-Path-2.09-2.el7.noarch.rpm \
perl-File-Temp-0.23.01-3.el7.noarch.rpm \
perl-Filter-1.49-3.el7.x86_64.rpm \
perl-Getopt-Long-2.40-3.el7.noarch.rpm \
perl-HTTP-Tiny-0.033-3.el7.noarch.rpm \
perl-libs-5.16.3-297.el7.x86_64.rpm \
perl-macros-5.16.3-297.el7.x86_64.rpm \
perl-parent-0.225-244.el7.noarch.rpm \
perl-PathTools-3.40-5.el7.x86_64.rpm \
perl-Pod-Escapes-1.04-297.el7.noarch.rpm \
perl-Pod-Perldoc-3.20-4.el7.noarch.rpm \
perl-Pod-Simple-3.28-4.el7.noarch.rpm \
perl-Pod-Usage-1.63-3.el7.noarch.rpm \
perl-podlators-2.5.1-3.el7.noarch.rpm \
perl-Scalar-List-Utils-1.27-248.el7.x86_64.rpm \
perl-Socket-2.010-5.el7.x86_64.rpm \
perl-Storable-2.45-3.el7.x86_64.rpm \
perl-Text-ParseWords-3.29-4.el7.noarch.rpm \
perl-threads-1.87-4.el7.x86_64.rpm \
perl-threads-shared-1.43-6.el7.x86_64.rpm \
perl-Time-HiRes-1.9725-3.el7.x86_64.rpm \
perl-Time-Local-1.2300-2.el7.noarch.rpm \
"
for i in $list 
do
    wget http://mirror.centos.org/centos/7/os/x86_64/Packages/$i
done





```
sudo rpm -ivh perl-5.16.3-297.el7.x86_64.rpm perl-libs-5.16.3-297.el7.x86_64.rpm perl-macros-5.16.3-297.el7.x86_64.rpm perl-threads-shared-1.43-6.el7.x86_64.rpm perl-threads-1.87-4.el7.x86_64.rpm perl-constant-1.27-2.el7.noarch.rpm perl-Carp-1.26-244.el7.noarch.rpm perl-File-Temp-0.23.01-3.el7.noarch.rpm perl-File-Path-2.09-2.el7.noarch.rpm perl-PathTools-3.40-5.el7.x86_64.rpm perl-Exporter-5.68-3.el7.noarch.rpm perl-Socket-2.010-5.el7.x86_64.rpm perl-Storable-2.45-3.el7.x86_64.rpm perl-Scalar-List-Utils-1.27-248.el7.x86_64.rpm perl-Filter-1.49-3.el7.x86_64.rpm perl-Getopt-Long-2.40-3.el7.noarch.rpm perl-Pod-Simple-3.28-4.el7.noarch.rpm perl-Text-ParseWords-3.29-4.el7.noarch.rpm perl-Time-HiRes-1.9725-3.el7.x86_64.rpm perl-Time-Local-1.2300-2.el7.noarch.rpm perl-Pod-Escapes-1.04-297.el7.noarch.rpm perl-Pod-Usage-1.63-3.el7.noarch.rpm perl-Encode-2.51-7.el7.x86_64.rpm perl-Pod-Perldoc-3.20-4.el7.noarch.rpm perl-podlators-2.5.1-3.el7.noarch.rpm perl-HTTP-Tiny-0.033-3.el7.noarch.rpm perl-parent-0.225-244.el7.noarch.rpm


```bash
sudo rpm -ivh \
MariaDB-backup-10.3.37-1.el7.centos.x86_64.rpm
MariaDB-backup-debuginfo-10.3.37-1.el7.centos.x86_64.rpm
MariaDB-cassandra-engine-10.3.37-1.el7.centos.x86_64.rpm
MariaDB-cassandra-engine-debuginfo-10.3.37-1.el7.centos.x86_64.rpm
MariaDB-client-10.3.35-1.el7.centos.x86_64.rpm
MariaDB-client-10.3.37-1.el7.centos.x86_64.rpm
MariaDB-client-debuginfo-10.3.37-1.el7.centos.x86_64.rpm
MariaDB-common-10.3.35-1.el7.centos.x86_64.rpm
MariaDB-common-10.3.37-1.el7.centos.x86_64.rpm
MariaDB-common-debuginfo-10.3.37-1.el7.centos.x86_64.rpm
MariaDB-compat-10.3.35-1.el7.centos.x86_64.rpm
MariaDB-compat-10.3.37-1.el7.centos.x86_64.rpm
MariaDB-connect-engine-10.3.37-1.el7.centos.x86_64.rpm
MariaDB-connect-engine-debuginfo-10.3.37-1.el7.centos.x86_64.rpm
MariaDB-cracklib-password-check-10.3.37-1.el7.centos.x86_64.rpm
MariaDB-cracklib-password-check-debuginfo-10.3.37-1.el7.centos.x86_64.rpm
MariaDB-devel-10.3.35-1.el7.centos.x86_64.rpm
MariaDB-devel-10.3.37-1.el7.centos.x86_64.rpm
MariaDB-devel-debuginfo-10.3.37-1.el7.centos.x86_64.rpm
MariaDB-gssapi-server-10.3.37-1.el7.centos.x86_64.rpm
MariaDB-gssapi-server-debuginfo-10.3.37-1.el7.centos.x86_64.rpm
MariaDB-oqgraph-engine-10.3.37-1.el7.centos.x86_64.rpm
MariaDB-oqgraph-engine-debuginfo-10.3.37-1.el7.centos.x86_64.rpm
MariaDB-rocksdb-engine-10.3.37-1.el7.centos.x86_64.rpm
MariaDB-rocksdb-engine-debuginfo-10.3.37-1.el7.centos.x86_64.rpm
MariaDB-server-10.3.35-1.el7.centos.x86_64.rpm
MariaDB-server-10.3.37-1.el7.centos.x86_64.rpm
MariaDB-server-debuginfo-10.3.37-1.el7.centos.x86_64.rpm
MariaDB-shared-10.3.37-1.el7.centos.x86_64.rpm
MariaDB-shared-debuginfo-10.3.37-1.el7.centos.x86_64.rpm
MariaDB-test-10.3.35-1.el7.centos.x86_64.rpm
MariaDB-test-10.3.37-1.el7.centos.x86_64.rpm
MariaDB-test-debuginfo-10.3.37-1.el7.centos.x86_64.rpm
MariaDB-tokudb-engine-10.3.37-1.el7.centos.x86_64.rpm
MariaDB-tokudb-engine-debuginfo-10.3.37-1.el7.centos.x86_64.rpm
boost-program-options-1.53.0-28.el7.x86_64.rpm
galera-25.3.29-1.rhel7.el7.centos.x86_64.rpm
jemalloc-3.6.0-1.el7.x86_64.rpm
libzstd-1.3.4-1.el7.x86_64.rpm
socat-1.7.3.2-2.el7.aarch64.rpm
```




## RPM-GPG-KEY-MariaDB
wget https://mirrors.cloud.tencent.com/mariadb/yum/RPM-GPG-KEY-MariaDB

## import GPG key
sudo rpm --import ./RPM-GPG-KEY-MariaDB



## libboost_program_options.so.1.53.0
wget http://mirror.centos.org/centos/7/os/x86_64/Packages/boost-program-options-1.53.0-28.el7.x86_64.rpm
sudo rpm -ivh boost-program-options-1.53.0-28.el7.x86_64.rpm

## galera-25.3.29-1
wget https://mirrors.cloud.tencent.com/mariadb/yum/10.3/centos/7/x86_64/rpms/galera-25.3.29-1.rhel7.el7.centos.x86_64.rpm
sudo rpm -ivh galera-25.3.29-1.rhel7.el7.centos.x86_64.rpm





https://mirrors.cloud.tencent.com/mariadb/yum/10.3/centos/7/x86_64/rpms/MariaDB-backup-10.3.35-1.el7.centos.x86_64.rpm

https://mirrors.cloud.tencent.com/mariadb/yum/10.3/centos/7/x86_64/rpms/MariaDB-backup-debuginfo-10.3.35-1.el7.centos.x86_64.rpm


https://mirrors.cloud.tencent.com/mariadb/yum/10.3/centos/7/x86_64/rpms/MariaDB-client-10.3.35-1.el7.centos.x86_64.rpm






## libzstd-1.3.4
wget https://mirrors.cloud.tencent.com/mariadb/yum/10.3/centos/7/x86_64/rpms/libzstd-1.3.4-1.el7.x86_64.rpm
sudo rpm -ivh libzstd-1.3.4-1.el7.x86_64.rpm

## MariaDB-devel-10.3.35
wget https://mirrors.cloud.tencent.com/mariadb/yum/10.3/centos/7/x86_64/rpms/MariaDB-devel-10.3.35-1.el7.centos.x86_64.rpm
sudo rpm -ivh MariaDB-devel-10.3.35-1.el7.centos.x86_64.rpm

## MariaDB-compat-10.3.35
wget https://mirrors.cloud.tencent.com/mariadb/yum/10.3/centos/7/x86_64/rpms/MariaDB-compat-10.3.35-1.el7.centos.x86_64.rpm
sudo rpm -ivh MariaDB-compat-10.3.35-1.el7.centos.x86_64.rpm

```bash 
[centos@deneil-barbican-test rpm]$ sudo rpm -ivh MariaDB-compat-10.3.35-1.el7.centos.x86_64.rpm
error: Failed dependencies:
        MariaDB-common is needed by MariaDB-compat-10.3.35-1.el7.centos.x86_64
        mariadb-libs < 1:10.1.0 conflicts with MariaDB-compat-10.3.35-1.el7.centos.x86_64
        mariadb-libs <= 1:10.1.48-1.el7.centos is obsoleted by MariaDB-compat-10.3.35-1.el7.centos.x86_64
```



## MariaDB-common-10.3.35
wget https://mirrors.cloud.tencent.com/mariadb/yum/10.3/centos/7/x86_64/rpms/MariaDB-common-10.3.35-1.el7.centos.x86_64.rpm
sudo rpm -ivh MariaDB-common-10.3.35-1.el7.centos.x86_64.rpm

```bash
[centos@deneil-barbican-test ~]$ sudo rpm -ivh MariaDB-common-10.3.35-1.el7.centos.x86_64.rpm
warning: MariaDB-common-10.3.35-1.el7.centos.x86_64.rpm: Header V4 DSA/SHA1 Signature, key ID 1bb943db: NOKEY
error: Failed dependencies:
        MariaDB-compat is needed by MariaDB-common-10.3.35-1.el7.centos.x86_64
```

## MariaDB-client-10.3.35-1.el7
wget https://mirrors.cloud.tencent.com/mariadb/yum/10.3/centos/7/x86_64/rpms/MariaDB-client-10.3.35-1.el7.centos.x86_64.rpm
sudo rpm -ivh MariaDB-client-10.3.35-1.el7.centos.x86_64.rpm

```bash
[centos@deneil-barbican-test ~]$ sudo rpm -ivh MariaDB-client-10.3.35-1.el7.centos.x86_64.rpm
warning: MariaDB-client-10.3.35-1.el7.centos.x86_64.rpm: Header V4 DSA/SHA1 Signature, key ID 1bb943db: NOKEY
error: Failed dependencies:
        MariaDB-common is needed by MariaDB-client-10.3.35-1.el7.centos.x86_64
        libaio.so.1()(64bit) is needed by MariaDB-client-10.3.35-1.el7.centos.x86_64
        libaio.so.1(LIBAIO_0.1)(64bit) is needed by MariaDB-client-10.3.35-1.el7.centos.x86_64
        libaio.so.1(LIBAIO_0.4)(64bit) is needed by MariaDB-client-10.3.35-1.el7.centos.x86_64
        perl(Exporter) is needed by MariaDB-client-10.3.35-1.el7.centos.x86_64
        perl(Fcntl) is needed by MariaDB-client-10.3.35-1.el7.centos.x86_64
        perl(File::Temp) is needed by MariaDB-client-10.3.35-1.el7.centos.x86_64
        perl(Getopt::Long) is needed by MariaDB-client-10.3.35-1.el7.centos.x86_64
        perl(IPC::Open3) is needed by MariaDB-client-10.3.35-1.el7.centos.x86_64
        perl(Sys::Hostname) is needed by MariaDB-client-10.3.35-1.el7.centos.x86_64
        /usr/bin/perl is needed by MariaDB-client-10.3.35-1.el7.centos.x86_64
```

## MariaDB-server-10.3.35-1.el7
wget https://mirrors.cloud.tencent.com/mariadb/yum/10.3/centos/7/x86_64/rpms/MariaDB-server-10.3.35-1.el7.centos.x86_64.rpm
sudo rpm -ivh MariaDB-server-10.3.35-1.el7.centos.x86_64.rpm

```bash
[centos@deneil-barbican-test ~]$ sudo rpm -ivh MariaDB-server-10.3.35-1.el7.centos.x86_64.rpm
warning: MariaDB-server-10.3.35-1.el7.centos.x86_64.rpm: Header V4 DSA/SHA1 Signature, key ID 1bb943db: NOKEY
error: Failed dependencies:
        MariaDB-common is needed by MariaDB-server-10.3.35-1.el7.centos.x86_64
        MariaDB-client is needed by MariaDB-server-10.3.35-1.el7.centos.x86_64
        galera is needed by MariaDB-server-10.3.35-1.el7.centos.x86_64
        lsof is needed by MariaDB-server-10.3.35-1.el7.centos.x86_64
        libaio.so.1()(64bit) is needed by MariaDB-server-10.3.35-1.el7.centos.x86_64
        libaio.so.1(LIBAIO_0.1)(64bit) is needed by MariaDB-server-10.3.35-1.el7.centos.x86_64
        libaio.so.1(LIBAIO_0.4)(64bit) is needed by MariaDB-server-10.3.35-1.el7.centos.x86_64
        perl(Data::Dumper) is needed by MariaDB-server-10.3.35-1.el7.centos.x86_64
        perl(DBI) is needed by MariaDB-server-10.3.35-1.el7.centos.x86_64
        perl(File::Basename) is needed by MariaDB-server-10.3.35-1.el7.centos.x86_64
        perl(File::Copy) is needed by MariaDB-server-10.3.35-1.el7.centos.x86_64
        perl(File::Path) is needed by MariaDB-server-10.3.35-1.el7.centos.x86_64
        perl(File::Temp) is needed by MariaDB-server-10.3.35-1.el7.centos.x86_64
        perl(Getopt::Long) is needed by MariaDB-server-10.3.35-1.el7.centos.x86_64
        perl(POSIX) is needed by MariaDB-server-10.3.35-1.el7.centos.x86_64
        perl(strict) is needed by MariaDB-server-10.3.35-1.el7.centos.x86_64
        perl(Sys::Hostname) is needed by MariaDB-server-10.3.35-1.el7.centos.x86_64
        perl(vars) is needed by MariaDB-server-10.3.35-1.el7.centos.x86_64
        /usr/bin/perl is needed by MariaDB-server-10.3.35-1.el7.centos.x86_64
```


## MariaDB-test-10.3.35
wget https://mirrors.cloud.tencent.com/mariadb/yum/10.3/centos/7/x86_64/rpms/MariaDB-test-10.3.35-1.el7.centos.x86_64.rpm






```bash
[centos@deneil-barbican-test MariaDB]$ rpm -ivh MariaDB-*
error: Failed dependencies:
        libaio.so.1()(64bit) is needed by MariaDB-backup-10.3.37-1.el7.centos.x86_64
        libaio.so.1(LIBAIO_0.1)(64bit) is needed by MariaDB-backup-10.3.37-1.el7.centos.x86_64
        libaio.so.1(LIBAIO_0.4)(64bit) is needed by MariaDB-backup-10.3.37-1.el7.centos.x86_64
        libthrift-0.9.1.so()(64bit) is needed by MariaDB-cassandra-engine-10.3.37-1.el7.centos.x86_64
        libaio.so.1()(64bit) is needed by MariaDB-client-10.3.35-1.el7.centos.x86_64
        libaio.so.1(LIBAIO_0.1)(64bit) is needed by MariaDB-client-10.3.35-1.el7.centos.x86_64
        libaio.so.1(LIBAIO_0.4)(64bit) is needed by MariaDB-client-10.3.35-1.el7.centos.x86_64
        libaio.so.1()(64bit) is needed by MariaDB-client-10.3.37-1.el7.centos.x86_64
        libaio.so.1(LIBAIO_0.1)(64bit) is needed by MariaDB-client-10.3.37-1.el7.centos.x86_64
        libaio.so.1(LIBAIO_0.4)(64bit) is needed by MariaDB-client-10.3.37-1.el7.centos.x86_64
        mariadb-libs < 1:10.1.0 conflicts with MariaDB-compat-10.3.35-1.el7.centos.x86_64
        mariadb-libs <= 1:10.1.48-1.el7.centos is obsoleted by MariaDB-compat-10.3.35-1.el7.centos.x86_64
        mariadb-libs < 1:10.1.0 conflicts with MariaDB-compat-10.3.37-1.el7.centos.x86_64
        mariadb-libs <= 1:10.1.48-1.el7.centos is obsoleted by MariaDB-compat-10.3.37-1.el7.centos.x86_64
        libodbc.so.2()(64bit) is needed by MariaDB-connect-engine-10.3.37-1.el7.centos.x86_64
        libJudy.so.1()(64bit) is needed by MariaDB-oqgraph-engine-10.3.37-1.el7.centos.x86_64
        lsof is needed by MariaDB-server-10.3.35-1.el7.centos.x86_64
        libaio.so.1()(64bit) is needed by MariaDB-server-10.3.35-1.el7.centos.x86_64
        libaio.so.1(LIBAIO_0.1)(64bit) is needed by MariaDB-server-10.3.35-1.el7.centos.x86_64
        libaio.so.1(LIBAIO_0.4)(64bit) is needed by MariaDB-server-10.3.35-1.el7.centos.x86_64
        perl(Data::Dumper) is needed by MariaDB-server-10.3.35-1.el7.centos.x86_64
        perl(DBI) is needed by MariaDB-server-10.3.35-1.el7.centos.x86_64
        lsof is needed by MariaDB-server-10.3.37-1.el7.centos.x86_64
        libaio.so.1()(64bit) is needed by MariaDB-server-10.3.37-1.el7.centos.x86_64
        libaio.so.1(LIBAIO_0.1)(64bit) is needed by MariaDB-server-10.3.37-1.el7.centos.x86_64
        libaio.so.1(LIBAIO_0.4)(64bit) is needed by MariaDB-server-10.3.37-1.el7.centos.x86_64
        perl(Data::Dumper) is needed by MariaDB-server-10.3.37-1.el7.centos.x86_64
        perl(DBI) is needed by MariaDB-server-10.3.37-1.el7.centos.x86_64
        libaio.so.1()(64bit) is needed by MariaDB-test-10.3.35-1.el7.centos.x86_64
        libaio.so.1(LIBAIO_0.1)(64bit) is needed by MariaDB-test-10.3.35-1.el7.centos.x86_64
        libaio.so.1(LIBAIO_0.4)(64bit) is needed by MariaDB-test-10.3.35-1.el7.centos.x86_64
        perl(Data::Dumper) is needed by MariaDB-test-10.3.35-1.el7.centos.x86_64
        libaio.so.1()(64bit) is needed by MariaDB-test-10.3.37-1.el7.centos.x86_64
        libaio.so.1(LIBAIO_0.1)(64bit) is needed by MariaDB-test-10.3.37-1.el7.centos.x86_64
        libaio.so.1(LIBAIO_0.4)(64bit) is needed by MariaDB-test-10.3.37-1.el7.centos.x86_64
        perl(Data::Dumper) is needed by MariaDB-test-10.3.37-1.el7.centos.x86_64
```
## libaio.so.1
wget http://mirror.centos.org/centos/7/os/x86_64/Packages/libaio-0.3.109-13.el7.x86_64.rpm
## libthrift-0.9.1.so
wget https://download-ib01.fedoraproject.org/pub/epel/7/x86_64/Packages/t/thrift-0.9.1-15.el7.x86_64.rpm
## mariadb-libs
wget https://rpmfind.net/linux/centos/7.9.2009/os/x86_64/Packages/mariadb-libs-5.5.68-1.el7.x86_64.rpm
## libodbc.so.2
wget http://mirror.centos.org/centos/7/os/x86_64/Packages/unixODBC-2.3.1-14.el7.x86_64.rpm
## libJudy.so.1
wget https://download-ib01.fedoraproject.org/pub/epel/7/x86_64/Packages/j/Judy-1.0.5-8.el7.x86_64.rpm
## lsof
wget http://mirror.centos.org/centos/7/os/x86_64/Packages/lsof-4.87-6.el7.x86_64.rpm
## perl(Data::Dumper)
wget https://www.rpmfind.net/linux/centos/7.9.2009/os/x86_64/Packages/perl-Data-Dumper-2.145-3.el7.x86_64.rpm
## perl(DBI)
wget https://www.rpmfind.net/linux/centos/7.9.2009/os/x86_64/Packages/perl-DBI-1.627-4.el7.x86_64.rpm
 
sudo rpm -ivh libaio-0.3.109-13.el7.x86_64.rpm thrift-0.9.1-15.el7.x86_64.rpm mariadb-libs-5.5.68-1.el7.x86_64.rpm unixODBC-2.3.1-14.el7.x86_64.rpm Judy-1.0.5-8.el7.x86_64.rpm lsof-4.87-6.el7.x86_64.rpm perl-Data-Dumper-2.145-3.el7.x86_64.rpm perl-DBI-1.627-4.el7.x86_64.rpm
 


## socat-1.7.3.2-2
wget http://mirror.centos.org/altarch/7/os/aarch64/Packages/socat-1.7.3.2-2.el7.aarch64.rpm
rpm -ivh socat-1.7.3.2-2.el7.aarch64.rpm

## Erlang
wget https://packages.erlang-solutions.com/erlang/rpm/centos/7/x86_64/esl-erlang_24.0.2-1~centos~7_amd64.rpm
sudo yum -y install esl-erlang*.rpm


## rabbitmq-server-3.8.19-1
wget https://github.com/rabbitmq/rabbitmq-server/releases/download/v3.8.19/rabbitmq-server-3.8.19-1.el7.noarch.rpm


