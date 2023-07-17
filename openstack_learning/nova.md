

```bash

list="openstack-nova-api \
openstack-nova-conductor \
openstack-nova-console \
openstack-nova-novncproxy \
openstack-nova-scheduler \
openstack-nova-placement-api"



for i in $list
do 
sudo yum install $i -y
done

sudo yum install -y openstack-nova


curl -X GET http://osapi.dct-tb.mtjade.cloud:8774/v2.1/flavors/detail \
-H "User-Agent: python-novaclient" \
-H "Accept: application/json" \
-H "X-Auth-Token: $token




. admin-openrc.sh

# add nova user (set in service project)
openstack user create --domain default --project service --password foxconn nova

# add nova user in admin role
openstack role add --project service --user nova admin

# add placement user (set in service project)
openstack user create --domain default --project service --password foxconn placement

# add placement user in admin role
openstack role add --project service --user placement admin

# add service entry for nova
openstack service create --name nova --description "OpenStack Compute service" compute

# add service entry for placement
openstack service create --name placement --description "OpenStack Compute Placement service" placement

# define keystone host
export controller=127.0.0.1

# add endpoint for nova (public)
openstack endpoint create --region RegionOne compute public http://$controller:8774/v2.1/%\(tenant_id\)s

# add endpoint for nova (internal)
openstack endpoint create --region RegionOne compute internal http://$controller:8774/v2.1/%\(tenant_id\)s


# add endpoint for nova (admin)
openstack endpoint create --region RegionOne compute admin http://$controller:8774/v2.1/%\(tenant_id\)s

# add endpoint for placement (public)
openstack endpoint create --region RegionOne placement public http://$controller:8778

# add endpoint for placement (internal)
openstack endpoint create --region RegionOne placement internal http://$controller:8778


# add endpoint for placement (admin)
openstack endpoint create --region RegionOne placement admin http://$controller:8778





```


```sql
mysql -u root -pfoxconn

create database nova;

grant all privileges on nova.* to nova@'localhost' identified by 'foxconn';
grant all privileges on nova.* to nova@'%' identified by 'foxconn';


create database nova_api;
grant all privileges on nova_api.* to nova@'localhost' identified by 'foxconn';
grant all privileges on nova_api.* to nova@'%' identified by 'foxconn';

create database nova_cell0;
grant all privileges on nova_cell0.* to nova@'localhost' identified by 'foxconn';
grant all privileges on nova_cell0.* to nova@'%' identified by 'foxconn';

flush privileges;


```


```bash

i="openstack-nova"
sudo yum install $i --downloaddir=/home/centos/rpm/openstack-nova/$i --downloadonly -y
yum localinstall -y /home/centos/rpm/openstack-nova/$i/*

```





