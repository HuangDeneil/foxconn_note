
sudo dnf update -y 
sudo dnf install nano vim langpacks-en glibc-all-langpacks -y
sudo timedatectl set-timezone Asia/Taipei 
sudo sed -i 's#SELINUX=enforcing#SELINUX=disabled#g' /etc/selinux/config 
sudo dnf install https://repos.fedorapeople.org/repos/openstack/openstack-zed/rdo-release-zed-1.el9s.noarch.rpm -y
sudo dnf install -y python3-openstackclient 
sudo dnf install -y network-scripts net-tools 
sudo dnf install mariadb-server -y 
sudo systemctl start mariadb.service 
sudo systemctl enable mariadb.service

######
### setting root password & mysql_secure_installation.sql
sudo cat > mysql_secure_installation.sql << EOF
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
EOF
sudo mysql -sfu root < mysql_secure_installation.sql

sudo dnf install openstack-keystone httpd python3-mod_wsgi -y
sudo cp /etc/keystone/keystone.conf /etc/keystone/keystone_backup.conf

sudo cat > keystone_conf_init.pl << EOF
#!/usr/bin/perl
while(<>)
{
    ## reflash bottum
    if   (/^\[(.+)\]/){\$database = 0;\$token = 0;}
    
    # bottum detatch
    if   (/^\[database\]/){\$database = 1 }
    if   (/^\[token\]/){\$token = 1}
    
    # add new message to conf
    if   (/^#connection =/ && \$database == 1 ){print "connection = mysql+pymysql://keystone:foxconn\@127.0.0.1/keystone\n";}
    elsif(/^#provider =/ && \$token == 1 ){print "provider = fernet\n";}
    else{print ; }
}
EOF
sudo perl keystone_conf_init.pl /etc/keystone/keystone_backup.conf > /etc/keystone/keystone.conf


sudo su -s /bin/sh -c "keystone-manage db_sync" keystone 
sudo keystone-manage fernet_setup --keystone-user keystone --keystone-group keystone; keystone-manage credential_setup --keystone-user keystone --keystone-group keystone; keystone-manage bootstrap --bootstrap-password admin_foxconn --bootstrap-admin-url http://127.0.0.1:5000/v3/ --bootstrap-internal-url http://127.0.0.1:5000/v3/ --bootstrap-public-url http://127.0.0.1:5000/v3/ --bootstrap-region-id RegionOne

sudo cat > /etc/httpd/conf.d/wsgi-keystone.conf << EOF
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
EOF
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

sudo dnf install rabbitmq-server -y 
sudo systemctl enable rabbitmq-server.service
sudo systemctl start rabbitmq-server.service
sudo chown rabbitmq:rabbitmq /var/lib/rabbitmq/.erlang.cookie
sudo chmod 400 /var/lib/rabbitmq/.erlang.cookie
sudo rabbitmqctl add_user openstack foxconn 
sudo rabbitmqctl set_permissions -p / openstack ".*" ".*" ".*" 
sudo rabbitmqctl set_policy -p / ha-all '^(?!amq\.).*' '{"ha-mode": "all"}'

sudo dnf install memcached -y ; 
sudo systemctl enable memcached.service ; 
sudo systemctl start memcached.service


### Must need to reboot 
sudo dnf install cronie-noanacron -y
echo -e '
#!/bin/bash

. admin-openrc.sh
openstack project create service
openstack user create --domain default --project service --password admin_foxconn barbican
openstack role add --project service --user barbican admin
openstack role create creator
openstack role add --project service --user barbican creator
openstack service create --name barbican --description "Key Manager" key-manager
openstack endpoint create --region RegionOne key-manager public http://127.0.0.1:9311
openstack endpoint create --region RegionOne key-manager internal http://127.0.0.1:9311
openstack endpoint create --region RegionOne key-manager admin http://127.0.0.1:9311
sudo dnf install openstack-barbican-api openstack-barbican-keystone-listener openstack-barbican-worker -y

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
    elsif(/^#host_href =/ && \$DEFAULT == 1 )     {print "host_href = http://127.0.0.1:9311\n";}
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

sudo cat > /etc/httpd/conf.d/wsgi-barbican.conf << EOF
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
EOF

sudo systemctl enable --now openstack-barbican-api
sudo systemctl start --now openstack-barbican-api

list="mysql_secure_installation.sql keystone_conf_init.pl barbican_conf_init.pl /root/startup.sh"
sudo su -s /bin/sh -c "for i in $list; do if [ -f "mysql_secure_installation.sql" ] ;then rm $i ; fi ; done"

' > startup.sh
sudo chmod +x startup.sh
sudo cp startup.sh /root/
@reboot $HOME/startup.sh
