



```py
xargs = lo.parse_config_sec()

args = xargs['openrc']
user    =   args['user']
passwd  =   args['passwd']
auth_url=   args['auth_url']
domain  =   args['domain']
project =   args['project']

auth = '--os-username {user} --os-password {passwd} --os-auth-url {url} --os-project-domain-id {projectdomain} --os-project-name {project} --os-user-domain-id {userdomain}'.format(user=user, passwd=passwd, url=auth_url, projectdomain=domain,project=project,userdomain=domain)



p1=subprocess.Popen('/opt/FiMo/vmEvacuate/FiMo_vmEvacuate_API.sh {err} runningevacuatestatus'.format(err=err_node),shell=True,stdout=subprocess.PIPE)

    p1=subprocess.Popen('/opt/FiMo/vmEvacuate/FiMo_vmEvacuate_API.sh {err} setevacuatestatus20'.format(err=err_node),shell=True,stdout=subprocess.PIPE)

# Check power status via bmc
p1=subprocess.Popen('/opt/FiMo/vmEvacuate/FiMo_vmEvacuate_API.sh {err} powerstatus'.format(err=err_node),shell=True,stdout=subprocess.PIPE)

    if shutdown_node :
        logger1.info('Shutdown %s' % err_node)
        p1=subprocess.Popen('/opt/FiMo/vmEvacuate/FiMo_vmEvacuate_API.sh {err} poweroffServer'.format(err=err_node),shell=True,stdout=subprocess.PIPE)




# Check nova status first
while True:
    p1=subprocess.Popen('nova {auth} service-list --host  {err_node}'.format(err_node=err_node, auth=auth),shell=True,stdout=subprocess.PIPE)
    p2=subprocess.Popen("grep {err_node}".format(err_node=err_node),shell=True,stdin=p1.stdout,stdout=subprocess.PIPE)
    p3=subprocess.Popen("awk -F \'|\' '{print $7}'",shell=True,stdin=p2.stdout,stdout=subprocess.PIPE)


    cmd = f"""nova {auth} service-list --host  {err_node} | grep {err_node} | """+"awk -F \'|\' '{print $7}' "
    print (subprocess.check_output(f'{cmd}', shell=True, text=True).rstrip())


if node_key:
    paz1=subprocess.Popen('mysql -uroot -pfoxconn -e "select aggregate_hosts.aggregate_id from nova_api.aggregate_hosts where host = \'{err_node}\';"|sed -e \'1d\''.format(err_node=err_node),shell=True,stdout=subprocess.PIPE)

    while True:
		pc1=subprocess.Popen('nova {auth} aggregate-show {ori_zone_id}'.format(ori_zone_id=spare_zone_id,auth=auth),shell=True,stdout=subprocess.PIPE)
		pc2=subprocess.Popen("grep {evac_node}".format(evac_node=evac_node),shell=True,stdin=pc1.stdout,stdout=subprocess.PIPE)
	
    p2=subprocess.Popen('nova {auth} aggregate-add-host {new_zone_id} {evac_node}'.format(new_zone_id=new_zone_id,evac_node=evac_node,auth=auth),shell=True,stdout=subprocess.PIPE)



"""
Step 2. change node's AZ in update  aggregate_hosts set aggregate_id='xx' where id='xx' and deleted='NULL';
"""
print("[*] Step.2 Update spare node")
node_key = []
evac_node = ""
for key in node_mapping:
	node_key.append(key)
if node_key:
        paz1=subprocess.Popen('mysql -uroot -pfoxconn -e "select aggregate_hosts.aggregate_id from nova_api.aggregate_hosts where host = \'{err_node}\';"|sed -e \'1d\''.format(err_node=err_node),shell=True,stdout=subprocess.PIPE)







"""
Step 4
4.  Evacuate VMs to the spare node chosen.
5.  If exception occurs, i.e., some evacuation failed,  do exception handling script. (By exception case we ever had, some db field clean work will be done, and redo the process from step III.
"""

for vm in vmlist:
	if vm:
		logger1.info("Evacuate {vm} to {evac_node}".format(vm=vm,evac_node=evac_node))
		
        p4=subprocess.Popen('nova {auth} evacuate --force {vm} {evac_node}'.format(evac_node=evac_node, auth=auth, vm=vm),shell=True,stdout=subprocess.PIPE)



p5=subprocess.Popen('nova {auth} list --all --host {node}'.format(node=evac_node, auth=auth),shell=True,stdout=subprocess.PIPE)
p6=subprocess.Popen("awk 'NR>3{print $2}'",shell=True,stdin=p5.stdout,stdout=subprocess.PIPE)

```


## CPU info 

```python

def getCpuinfoToJson(self, token, req_compute, compute_url):
    for key, host_name in req_compute.items():
        resultPath = os.path.join("result","{}.json".format(host_name))
        file = Path(resultPath)
        if file.is_file():
            print("----- {} CPU infor json file for this compute node already exists -----".format(host_name))
        else:
            print("----- {} CPU infor of this compute node is not exist, get and save the node infor -----".format(host_name))
            # Get list of hypervisors detail
            headers = {'Content-Type': 'application/json',
                    'X-Auth-Token': token}
            url = '{}/v2.1/os-hypervisors/detail'.format(compute_url)
            res = requests.get(url, headers=headers)
            node_detail = json.loads(res.content)

            self._getCpuinfo(node_detail["hypervisors"], host_name)
    return req_compute

"compute_url": "http://192.168.60.200:8774/v2.1/os-hypervisors/detail"

```




```bash

token=`openstack  token issue | grep "| id" | awk '{print $4}'`

# tj-testBed
REQ=`curl -X GET http://192.168.9.200:8774/v2.1/os-hypervisors/detail -H "Accept: application/json" -H "X-Auth-Token: $token"`

# KHQ-testBed
REQ=`curl -X GET http://192.168.60.200:8774/v2.1/os-hypervisors/detail -H "Accept: application/json" -H "X-Auth-Token: $token"`

echo  $REQ |  python -m json.tool > all.compute.json

echo  $REQ |  python -m json.tool | grep "created" | wc -l


```





```bash

[root@tj-testbed-control-001 ~]# openstack aggregate create test-Spare-zone
+-------------------+----------------------------+
| Field             | Value                      |
+-------------------+----------------------------+
| availability_zone | None                       |
| created_at        | 2023-02-23T02:02:40.312976 |
| deleted           | False                      |
| deleted_at        | None                       |
| id                | 12                         |
| name              | test-Spare-zone            |
| updated_at        | None                       |
+-------------------+----------------------------+



openstack aggregate list
[root@tj-testbed-control-001 ~]# openstack aggregate list
+----+-----------------+-------------------+
| ID | Name            | Availability Zone |
+----+-----------------+-------------------+
|  2 | FiXo-Zone-01    | FiXo-Zone-01      |
|  9 | FiXo-Zone-Groot | FiXo-Zone-Groot   |
| 12 | test-Spare-zone | test-Spare-zone   |
+----+-----------------+-------------------+

openstack aggregate create test-Spare-zone

openstack aggregate set --zone test-Spare-zone test-Spare-zone


## 從 FiXo-Zone-01 移除 tj-testbed-compute-005
nova aggregate-remove-host 2 tj-testbed-compute-005


## 將 tj-testbed-compute-005 加進去到 test-Spare-zone
nova aggregate-add-host 12 tj-testbed-compute-005
nova aggregate-add-host test-Spare-zone tj-testbed-compute-005



# FiXo-Zone-Groot to test-Spare-zone
nova aggregate-remove-host FiXo-Zone-Groot tj-testbed-compute-005
nova aggregate-add-host test-Spare-zone tj-testbed-compute-005

# test-Spare-zone to FiXo-Zone-Groot 
nova aggregate-remove-host test-Spare-zone tj-testbed-compute-005
nova aggregate-add-host FiXo-Zone-Groot tj-testbed-compute-005




[root@dct-queens-ctl-001 ~]# openstack hypervisor list
+----+---------------------------+-----------------+----------------+-------+
| ID | Hypervisor Hostname       | Hypervisor Type | Host IP        | State |
+----+---------------------------+-----------------+----------------+-------+
|  3 | dct-queens-com-002        | QEMU            | 192.168.60.19  | up    |
|  6 | dct-queens-com-003        | QEMU            | 192.168.60.21  | up    |
|  9 | dct-queens-com-001        | QEMU            | 192.168.60.17  | up    |
| 12 | dct-queens-com-005        | QEMU            | 192.168.60.93  | up    |
| 15 | dct-queens-com-004        | QEMU            | 192.168.60.92  | up    |
| 18 | dct-queens-com-006-gpu    | QEMU            | 192.168.60.65  | up    |
| 50 | dct-queens-com-013        | QEMU            | 192.168.60.119 | up    |
| 53 | dct-queens-com-015        | QEMU            | 192.168.60.121 | up    |
| 68 | dct-queens-com-014        | QEMU            | 192.168.60.120 | up    |
| 71 | dct-queens-com-007-minsky | QEMU            | 192.168.60.112 | up    |
| 74 | dct-queens-com-008-minsky | QEMU            | 192.168.60.113 | up    |
| 77 | dct-queens-com-009-minsky | QEMU            | 192.168.60.114 | up    |
+----+---------------------------+-----------------+----------------+-------+
nova list --all --host dct-queens-com-007-minsky
nova list --all --host dct-queens-com-008-minsky
nova list --all --host dct-queens-com-009-minsky



openstack aggregate create test-evacuate-zone
openstack aggregate set --zone test-evacuate-zone test-evacuate-zone


## 將 minsky 加進去到 test-Spare-zone
nova aggregate-add-host 113 dct-queens-com-007-minsky
nova aggregate-add-host 113 dct-queens-com-008-minsky
nova aggregate-add-host 113 dct-queens-com-009-minsky
nova aggregate-add-host 113 dct-queens-com-014

nova aggregate-add-host test-Spare-zone dct-queens-com-007-minsky




[root@dct-queens-ctl-001 autoevacuation]# openstack aggregate list
+-----+-----------------------+-----------------------+
|  ID | Name                  | Availability Zone     |
+-----+-----------------------+-----------------------+
|   9 | AZ-1                  | Availability-Zone-1   |
|  18 | AZ-2                  | Availability-Zone-2   |
|  27 | Availability-Zone-GPU | Availability-Zone-GPU |
|  75 | stringray-gpu         | stringray-gpu         |
|  95 | AZ-3                  | Availability-Zone-3   |
| 113 | test-Spare-zone       | test-Spare-zone       |
| 122 | test-evacuate-zone    | test-evacuate-zone    |
+-----+-----------------------+-----------------------+
# test-Spare-zone to test-evacuate-zone
# com-008
nova aggregate-remove-host test-Spare-zone dct-queens-com-008-minsky
nova aggregate-add-host test-evacuate-zone dct-queens-com-008-minsky

# com-009
nova aggregate-remove-host test-Spare-zone dct-queens-com-009-minsky
nova aggregate-add-host test-evacuate-zone dct-queens-com-009-minsky




# test-evacuate-zone to  test-Spare-zone
# com-008
nova aggregate-remove-host test-evacuate-zone dct-queens-com-008-minsky
nova aggregate-add-host test-Spare-zone dct-queens-com-008-minsky

# com-009
nova aggregate-remove-host test-evacuate-zone dct-queens-com-009-minsky
nova aggregate-add-host test-Spare-zone dct-queens-com-009-minsky


openstack aggregate remove host test-evacuate-zone dct-queens-com-009-minsky --debug

curl -g -i -X POST http://osapi.dct-tb.mtjade.cloud:8774/v2.1/os-aggregates/122/action \
-H "User-Agent: python-novaclient" \
-H "Content-Type: application/json" \
-H "Accept: application/json" \
-H "X-Auth-Token: {SHA1}a7c1a07f90e34a3ae99512c41910746e6d6a45d6" \
-d '{"remove_host": {"host": "dct-queens-com-009-minsky"}}'


openstack aggregate add host test-Spare-zone dct-queens-com-009-minsky --debug


curl -g -i -X POST http://osapi.dct-tb.mtjade.cloud:8774/v2.1/os-aggregates/113/action \
-H "User-Agent: python-novaclient" \
-H "Content-Type: application/json" \
-H "Accept: application/json" \
-H "X-Auth-Token: {SHA1}591de346b7d4ecc219779b4fbb9a10a54a93a82d" \
-d '{"add_host": {"host": "dct-queens-com-009-minsky"}}'


nova aggregate-add-host 9 dct-queens-com-007-minsky

openstack availability zone list

## nova-compute.service
# systemctl stop openstack-nova-compute.service
# systemctl start openstack-nova-compute.service
# systemctl status openstack-nova-compute.service

cmd="systemctl stop openstack-nova-compute.service"
cmd="systemctl start openstack-nova-compute.service"
cmd="systemctl status openstack-nova-compute.service"

ssh dct-queens-com-007-minsky $cmd
ssh dct-queens-com-008-minsky $cmd
ssh dct-queens-com-009-minsky $cmd

python evacuation.py dct-queens-com-007-minsky


# deneil-minsky-vm-test1
ac5898aa-4b1c-4447-93fa-058c47dcf7b3

nova evacuate --force ac5898aa-4b1c-4447-93fa-058c47dcf7b3 dct-queens-com-014
nova evacuate --force ac5898aa-4b1c-4447-93fa-058c47dcf7b3 dct-queens-com-008-minsky



## 顯示指定節點上的VM們
nova list --all --host tj-testbed-compute-005
nova list --all --host tj-testbed-compute-006

[root@tj-testbed-control-001 python_peripheral_tool]# nova list --all --host tj-testbed-compute-006  
+--------------------------------------+------------------+----------------------------------+--------+------------+-------------+---------------------------------------+
| ID                                   | Name             | Tenant ID                        | Status | Task State | Power State | Networks                              |
+--------------------------------------+------------------+----------------------------------+--------+------------+-------------+---------------------------------------+
| 5f125d20-b48d-4772-8f69-015b4279d81c | deneil-test-VM   | 71e93aa11b6b40b9abf39a5a619f1f9d | ACTIVE | -          | Running     | API_net=192.168.9.228                 |
| 9acb671d-fb31-4a0c-a8a2-ae7b3f98684e | ll-instance11902 | 71e93aa11b6b40b9abf39a5a619f1f9d | ACTIVE | -          | Running     | admin-private-rdtestnet=192.168.109.9 |
+--------------------------------------+------------------+----------------------------------+--------+------------+-------------+---------------------------------------+




openstack server migrate d1df1b5a-70c4-4fed-98b7-423362f2c47c --live HostC



nova evacuate --force 9acb671d-fb31-4a0c-a8a2-ae7b3f98684e tj-testbed-compute-003


## 測試遷移deneil-test-VM 至 tj-testbed-compute-003 
nova evacuate --force 5f125d20-b48d-4772-8f69-015b4279d81c tj-testbed-compute-003 
nova evacuate 5f125d20-b48d-4772-8f69-015b4279d81c tj-testbed-compute-005








nova live-migration --force bf235a95-6fa0-4588-a3c2-d093de16b92f tj-testbed-compute-006



# deneil-test-VM-100 至 tj-testbed-compute-003 

nova evacuate --force {vm} {evac_node}
nova evacuate --force 7cf80f56-781b-48a9-b3f7-a89136d3fb8b tj-testbed-compute-003 

nova live-migration --force 7cf80f56-781b-48a9-b3f7-a89136d3fb8b tj-testbed-compute-003 

###
## nova host-evacuate-live --force 


nova server-migration-list 7cf80f56-781b-48a9-b3f7-a89136d3fb8b


nova live-migration 7cf80f56-781b-48a9-b3f7-a89136d3fb8b tj-testbed-compute-003

## deneil-test-VM-400 from tj-testbed-compute-003 to tj-testbed-compute-006 
nova live-migration edce5997-90c8-4c04-ad49-ce43c5c83a6a tj-testbed-compute-006



nova migrate --host tj-testbed-compute-003 7cf80f56-781b-48a9-b3f7-a89136d3fb8b 


nova live-migration --force 5f125d20-b48d-4772-8f69-015b4279d81c tj-testbed-compute-003


nova reset or reboot

nova reboot 9acb671d-fb31-4a0c-a8a2-ae7b3f98684e


## 遷移ll的到tj-testbed-compute-003 
openstack server migrate 9acb671d-fb31-4a0c-a8a2-ae7b3f98684e --live tj-testbed-compute-003 
nova live-migration --force 9acb671d-fb31-4a0c-a8a2-ae7b3f98684e tj-testbed-compute-003 
nova live-migration 9acb671d-fb31-4a0c-a8a2-ae7b3f98684e tj-testbed-compute-003 

nova show 605f9c28-5092-4654-accf-20c25fd30b4d | grep 'OS-EXT-SRV-ATTR:host'

nova live-migration --block-migrate 605f9c28-5092-4654-accf-20c25fd30b4d tj-testbed-compute-005
nova live-migration --force 605f9c28-5092-4654-accf-20c25fd30b4d tj-testbed-compute-005

nova show 605f9c28-5092-4654-accf-20c25fd30b4d | grep 'OS-EXT-SRV-ATTR:host\|status'


nova live-migration --force c0c8f701-1040-4f79-a482-9e6bf80010f6 dct-queens-com-007
nova show c0c8f701-1040-4f79-a482-9e6bf80010f6 | grep 'OS-EXT-SRV-ATTR:host\|status'



token=`openstack  token issue | grep "| id" | awk '{print $4}'`
curl -g -i -X POST \
http://osapi.dct-tb.mtjade.cloud:8774/v2.1/servers/c0c8f701-1040-4f79-a482-9e6bf80010f6/action \
-H "Accept: application/json" \
-H "User-Agent: python-novaclient" 
-H "OpenStack-API-Version: compute 2.60" \
-H "X-OpenStack-Nova-API-Version: 2.60" \
-H "X-Auth-Token: $token" \
-H "Content-Type: application/json" \
-d '
{
    "os-migrateLive": 
    {
        "block_migration": "auto", 
        "host": "dct-queens-com-007", 
        "force": true
    }
}
'










# nova migrate [--host <host>] [--poll] <server>
nova migrate --host tj-testbed-compute-003 9acb671d-fb31-4a0c-a8a2-ae7b3f98684e


nova server-migration-list 9acb671d-fb31-4a0c-a8a2-ae7b3f98684e

nova server-migration-show 9acb671d-fb31-4a0c-a8a2-ae7b3f98684e

nova live-migration --force 9acb671d-fb31-4a0c-a8a2-ae7b3f98684e tj-testbed-compute-003
nova live-migration-force-complete 9acb671d-fb31-4a0c-a8a2-ae7b3f98684e tj-testbed-compute-003 


nova host-evacuate-live --force 

nova server-migration-list 9acb671d-fb31-4a0c-a8a2-ae7b3f98684e

## 遷移ll的到tj-testbed-compute-003 
openstack server migrate 5f125d20-b48d-4772-8f69-015b4279d81c --live tj-testbed-compute-005

nova live-migration --force 5f125d20-b48d-4772-8f69-015b4279d81c tj-testbed-compute-005


[root@tj-testbed-control-001 python_peripheral_tool]# nova evacuate --force 9acb671d-fb31-4a0c-a8a2-ae7b3f98684e tj-testbed-compute-003
ERROR (BadRequest): Compute service of tj-testbed-compute-006 is still in use. (HTTP 400) (Request-ID: req-6f70f74b-70bf-4e1d-8bc3-28fc38abf1dc)


```





```bash

[root@tj-testbed-control-001 python_peripheral_tool]# nova hypervisor-list
+--------------------------------------+------------------------+-------+---------+
| ID                                   | Hypervisor hostname    | State | Status  |
+--------------------------------------+------------------------+-------+---------+
| f4ff18c1-34d4-4627-9920-ae1b8913fef0 | tj-testbed-compute-002 | up    | enabled |
| fe1f7f19-4d02-4288-9853-f6ece0ec9d7f | tj-testbed-compute-004 | up    | enabled |
| ddb05077-49ab-4ba4-b865-f629cb38235c | tj-testbed-compute-003 | up    | enabled |
| 1522b88d-c75d-494f-9662-a66eda625c1a | tj-testbed-compute-001 | up    | enabled |
| a4a81702-6ea9-4ff9-8523-0c892380df1c | tj-testbed-compute-005 | up    | enabled |
| 946831e5-5407-44ef-8c0e-653751a111d0 | tj-testbed-compute-006 | up    | enabled |
+--------------------------------------+------------------------+-------+---------+





[root@tj-testbed-control-001 ~]# nova aggregate-remove-host FiXo-Zone-Groot tj-testbed-compute-005
Host tj-testbed-compute-005 has been successfully removed from aggregate 9 
+----+-----------------+-------------------+--------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------+--------------------------------------+
| Id | Name            | Availability Zone | Hosts                    | Metadata
                                                                                  | UUID                                 |
+----+-----------------+-------------------+--------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------+--------------------------------------+
| 9  | FiXo-Zone-Groot | FiXo-Zone-Groot   | 'tj-testbed-compute-006' | 'ais=true', 'apigw=true', 'availability_zone=FiXo-Zone-Groot', 'cis=true', 'cis-hub=true', 'cis-psd=true', 'dbs=true', 'fico=true', 'fiwo=true', 'mqs=true', 'sfs=true' | 701de874-ca12-4eae-b942-270b9cfd1b02 |
+----+-----------------+-------------------+--------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------+--------------------------------------+


[root@tj-testbed-control-001 ~]# nova aggregate-add-host test-Spare-zone tj-testbed-compute-005
Host tj-testbed-compute-005 has been successfully added for aggregate 12
+----+-----------------+-------------------+--------------------------+-------------------------------------+--------------------------------------+
| Id | Name            | Availability Zone | Hosts                    | Metadata                            | UUID                                 |
+----+-----------------+-------------------+--------------------------+-------------------------------------+--------------------------------------+
| 12 | test-Spare-zone | test-Spare-zone   | 'tj-testbed-compute-005' | 'availability_zone=test-Spare-zone' | 7a9f008d-71da-48c2-b856-cf85c130f18f |
+----+-----------------+-------------------+--------------------------+-------------------------------------+--------------------------------------+







[root@tj-testbed-control-001 ~]# nova aggregate-remove-host 2 tj-testbed-compute-005

nova aggregate-add-host 12 tj-testbed-compute-005
Host tj-testbed-compute-005 has been successfully removed from aggregate 2 
+----+--------------+-------------------+--------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+--------------------------------------+
| Id | Name         | Availability Zone | Hosts                          | Metadata                       | UUID                                 |
+----+--------------+-------------------+--------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+--------------------------------------+
| 2  | FiXo-Zone-01 | FiXo-Zone-01      | 'tj-testbed-compute-001', 'tj-testbed-compute-002', 'tj-testbed-compute-004', 'tj-testbed-compute-003' | 'ais=true', 'apigw=true', 'availability_zone=FiXo-Zone-01', 'bcs=true', 'bds=true', 'cis=true', 'cis-hbr=true', 'cis-hub=true', 'cis-psd=true', 'dbs=true', 'fico=true', 'fiwo=true', 'mqs=true', 'octavia=true', 'psd=true', 'sfs=true' | 9dcd8879-457b-463a-9eb0-af3c1c6548f7 |
+----+--------------+-------------------+--------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+--------------------------------------+

```



```bash
[root@tj-testbed-control-001 ~]# openstack aggregate list
+----+-----------------+-------------------+
| ID | Name            | Availability Zone |
+----+-----------------+-------------------+
|  2 | FiXo-Zone-01    | FiXo-Zone-01      |
|  9 | FiXo-Zone-Groot | FiXo-Zone-Groot   |
| 12 | test-Spare-zone | test-Spare-zone   |
+----+-----------------+-------------------+
[root@tj-testbed-control-001 ~]# openstack network list
+--------------------------------------+--------------------+--------------------------------------+
| ID                                   | Name               | Subnets                              |
+--------------------------------------+--------------------+--------------------------------------+
| 5aa967fa-b4ed-456e-8717-acf5628634e2 | FHW                | 9277b92d-68a7-4f26-a285-b51def7e543e |
| c94ceb9a-c58e-4897-87ef-dac98e4993ca | private-deneil-FHW | 1aeadf23-2c5a-4f81-a0c2-4e68c8dc4f10 |
+--------------------------------------+--------------------+--------------------------------------+
FiCo-v2m4-Q1


## 開 VM 到指定 compute-node
nova boot \
--flavor FiCo-v2m4-Q1 \
--availability-zone FiXo-Zone-Groot:tj-testbed-compute-006 \
--security-groups eef4e3fd-f781-4817-b6ed-7f2e546bda60 \
--key-name deneil_keypair \
--user-data /home/deneil/password-cloud-init \
--nic net-id=e23d8db4-d7dd-469b-bdf0-1d84aa62adc4 \
--boot-volume 6e462e91-9304-49b0-a3c0-00af7aeec4c4 \
Groot-VM-test-2
--poll \


cinder create
--volume-type


```
























