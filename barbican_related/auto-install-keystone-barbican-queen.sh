
sudo yum update -y 
sudo yum install nano vim langpacks-en glibc-all-langpacks -y
sudo timedatectl set-timezone Asia/Taipei 
sudo sed -i 's#SELINUX=permissive#SELINUX=disabled#g' /etc/selinux/config 
sudo yum install https://repos.fedorapeople.org/repos/openstack/openstack-queens/rdo-release-queens-2.noarch.rpm -y
sudo yum install python-openstackclient -y
sudo yum install -y network-scripts net-tools 
sudo yum install mariadb-server -y 
sudo systemctl start mariadb.service 
sudo systemctl enable mariadb.service

######
### setting root password & mysql_secure_installation.sql
sudo echo -e "
-- Kill the anonymous users
DELETE FROM mysql.user WHERE User='';
-- allow remote login for root
GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' IDENTIFIED BY 'foxconn';
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'foxconn';

-- Kill off the demo database
DROP DATABASE IF EXISTS test;
DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%';

-- keystone database
CREATE DATABASE keystone;
GRANT ALL PRIVILEGES ON keystone.* TO 'keystone'@'localhost' IDENTIFIED BY 'foxconn';
GRANT ALL PRIVILEGES ON keystone.* TO 'keystone'@'%' IDENTIFIED BY 'foxconn';

-- barbican database
CREATE DATABASE barbican;
GRANT ALL PRIVILEGES ON barbican.* TO 'barbican'@'localhost' IDENTIFIED BY 'foxconn';
GRANT ALL PRIVILEGES ON barbican.* TO 'barbican'@'%' IDENTIFIED BY 'foxconn';

-- Make our changes take effect
FLUSH PRIVILEGES;
" > /root/mysql_secure_installation.sql
sudo mysql -sfu root < /root/mysql_secure_installation.sql

sudo yum install -y python2-qpid-proton-0.22.0-1.el7.x86_64
sudo yum install openstack-keystone httpd mod_wsgi -y
sudo mv /etc/keystone/keystone.conf /etc/keystone/keystone_backup.conf
sudo echo -e '
#!/usr/bin/perl
while(<>)
{
    ## reflash bottum
    if   (/^\[(.+)\]/){$database = 0; $token = 0;}
    
    # bottum detatch
    if   (/^\[database\]/){$database = 1 }
    if   (/^\[token\]/){$token = 1}
    
    # add new message to conf
    if   (/^#connection =/ && $database == 1 ){print "connection = mysql+pymysql://keystone:foxconn\@127.0.0.1/keystone\n";}
    elsif(/^#provider =/ && $token == 1 ){print "provider = fernet\n";}
    else{print ; }
}
' > /root/keystone_conf_init.pl 
sudo perl /root/keystone_conf_init.pl /etc/keystone/keystone_backup.conf > /etc/keystone/keystone.conf

sudo su -s /bin/sh -c "keystone-manage db_sync" keystone 
sudo keystone-manage fernet_setup --keystone-user keystone --keystone-group keystone; keystone-manage credential_setup --keystone-user keystone --keystone-group keystone; keystone-manage bootstrap --bootstrap-password admin_foxconn --bootstrap-admin-url http://127.0.0.1:5000/v3/ --bootstrap-internal-url http://127.0.0.1:5000/v3/ --bootstrap-public-url http://127.0.0.1:5000/v3/ --bootstrap-region-id RegionOne
sudo ln -s /usr/share/keystone/wsgi-keystone.conf /etc/httpd/conf.d/

sudo systemctl start httpd 
sudo systemctl enable httpd

echo -e "
export OS_USERNAME=admin
export OS_PASSWORD=admin_foxconn
export OS_PROJECT_NAME=admin
export OS_USER_DOMAIN_NAME=Default
export OS_PROJECT_DOMAIN_NAME=Default
export OS_AUTH_URL=http://127.0.0.1:5000/v3
export OS_IDENTITY_API_VERSION=3
" > admin-openrc.sh

sudo yum install rabbitmq-server -y 
sudo systemctl enable rabbitmq-server.service
sudo systemctl start rabbitmq-server.service
sudo chown rabbitmq:rabbitmq /var/lib/rabbitmq/.erlang.cookie
sudo chmod 400 /var/lib/rabbitmq/.erlang.cookie
sudo rabbitmqctl add_user openstack foxconn 
sudo rabbitmqctl set_permissions -p / openstack ".*" ".*" ".*" 
sudo rabbitmqctl set_policy -p / ha-all '^(?!amq\.).*' '{"ha-mode": "all"}'

sudo yum install memcached -y ; 
sudo systemctl enable memcached.service ; 
sudo systemctl start memcached.service


### Must need to reboot 
echo -e '
#!/bin/bash

export OS_USERNAME=admin
export OS_PASSWORD=admin_foxconn
export OS_PROJECT_NAME=admin
export OS_USER_DOMAIN_NAME=Default
export OS_PROJECT_DOMAIN_NAME=Default
export OS_AUTH_URL=http://127.0.0.1:5000/v3
export OS_IDENTITY_API_VERSION=3

openstack project create service
openstack user create --domain default --project service --password admin_foxconn barbican
openstack role add --project service --user barbican admin
openstack role create creator
openstack role add --project service --user barbican creator
openstack service create --name barbican --description "Key Manager" key-manager
openstack endpoint create --region RegionOne key-manager public http://127.0.0.1:9311
openstack endpoint create --region RegionOne key-manager internal http://127.0.0.1:9311
openstack endpoint create --region RegionOne key-manager admin http://127.0.0.1:9311

sudo yum install openstack-barbican-api python2-barbicanclient -y

sudo cp /etc/barbican/barbican.conf /etc/barbican/barbican_backup.conf
sudo cat > barbican_conf_init.pl << EOF
#!/usr/bin/perl
while(<>)
{
    ## reflash bottum
    if   (/^\[(.+)\]/)
    {
        \$DEFAULT = 0;
        \$keystone_authtoken = 0;
        \$secretstore = 0;
        \$crypto = 0;
        \$simple_crypto_plugin = 0;
    }
    
    # bottum detatch
    if   (/^\[DEFAULT\]/){\$DEFAULT = 1 }
    if   (/^\[keystone_authtoken\]/){\$keystone_authtoken = 1}
    if   (/^\[secretstore\]/){\$secretstore = 1}
    if   (/^\[crypto\]/){\$crypto = 1}
    if   (/^\[simple_crypto_plugin\]/){\$simple_crypto_plugin = 1}
    
    # add new message to conf
    if   (/^#sql_connection =/ && \$DEFAULT == 1 ){print "sql_connection = mysql+pymysql://barbican:foxconn\@127.0.0.1/barbican\n";}
    elsif(/^#host_href =/ && \$DEFAULT == 1 )     
    {
        print "
bind_host = 0.0.0.0
bind_port = 9311
host_href = http://127.0.0.1:9311
log_file = /var/log/barbican/api.log
";
    }
    elsif(/^#transport_url =/ && \$DEFAULT == 1 ) {print "transport_url = rabbit://openstack:foxconn\@127.0.0.1\n";}
    elsif(/^#www_authenticate_uri =/ && \$keystone_authtoken == 1 )
    {print "\$_
www_authenticate_uri = http://127.0.0.1:5000
auth_url = http://127.0.0.1:5000
memcached_servers = 127.0.0.1:11211
auth_type = password
project_domain_name = default
user_domain_name = default
project_name = service
username = barbican
password = admin_foxconn";}
    elsif(/^#enabled_secretstore_plugins =/ && \$secretstore == 1 ) {print "enabled_secretstore_plugins = store_crypto\n";}
    elsif(/^#enabled_crypto_plugins =/ && \$crypto == 1 ) {print "enabled_crypto_plugins = simple_crypto\n";}
    elsif(/^#kek =/ && \$simple_crypto_plugin == 1 ) {print "kek = YWJjZGVmZ2hpamtsbW5vcHFyc3R1dnd4eXoxMjM0NTY=\n";}
    else{print ; }
}
EOF
sudo perl barbican_conf_init.pl /etc/barbican/barbican_backup.conf > /etc/barbican/barbican.conf
sudo su -s /bin/sh -c "barbican-manage db upgrade" barbican
sudo systemctl enable --now openstack-barbican-api
sudo systemctl start --now openstack-barbican-api

sudo systemctl disable barbican_build_up.service
sudo systemctl stop barbican_build_up
'  > /root/startup.sh
sudo chmod +x /root/startup.sh


sudo echo -e '
[Unit]
Description=Building barbican server after reboot
After=network.target

[Service]
Type=simple
User=root
ExecStart=/bin/bash /root/startup.sh
Restart=always

[Install]
WantedBy=multi-user.target
' > /etc/systemd/system/barbican_build_up.service

sudo chmod 644 /etc/systemd/system/barbican_build_up.service
sudo systemctl daemon-reload
# sudo systemctl start barbican_build_up.service
# sudo systemctl status barbican_build_up
sudo systemctl enable barbican_build_up.service

sudo reboot 
