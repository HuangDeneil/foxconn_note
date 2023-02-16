




list="nano \
vim \
mariadb-server \
httpd \
mod_wsgi \
rabbitmq-server \
memcached"

path="/share/data/rpm/required"
i="nano"
sudo yum install $i --downloaddir=$path/$i --downloadonly -y


for i in $list
do
sudo yum install $i --downloaddir=/home/centos/rpm/required/$i --downloadonly -y
done

## openstack main
list="https://repos.fedorapeople.org/repos/openstack/openstack-queens/rdo-release-queens-2.noarch.rpm \
python-openstackclient \
network-scripts \
python2-qpid-proton-0.22.0-1.el7.x86_64 \
openstack-keystone \
openstack-barbican-api \
python2-barbicanclient"

for i in $list
do
sudo yum install $i --downloaddir=/home/centos/rpm/openstack/$i --downloadonly -y
done

i="network-scripts"
sudo yum install $i --downloaddir=/home/centos/rpm/openstack/$i --downloadonly -y



yum install -y https://repos.fedorapeople.org/repos/openstack/openstack-queens/rdo-release-queens-2.noarch.rpm \
python-openstackclient

yum localinstall rdo-release-queens-2.noarch.rpm

rpm -ivh rdo-release-queens-2.noarch.rpm
rpm -ivh *
yum localinstall * -y

yum localinstall -y rpm/required/update/* 
yum localinstall -y rpm/required/vim/* 
yum localinstall -y rpm/required/nano/* 
yum localinstall -y rpm/required/tree/* 
yum localinstall -y rpm/required/mariadb-server/* 
yum localinstall -y rpm/required/rabbitmq-server/* 
yum localinstall -y rpm/required/memcached/* 


yum localinstall -y 00_openstack_queen/*
yum localinstall -y 01_python-openstackclient/*
yum localinstall -y 02_python2-qpid-proton-0.22.0-1.el7.x86_64/*
yum localinstall -y 03_openstack-keystone/*
yum localinstall -y 04_openstack-barbican-api/*
yum localinstall -y 05_python2-barbicanclient/*

