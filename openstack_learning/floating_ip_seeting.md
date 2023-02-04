neutron router-create deneil-router




#### VM 連接兩個subnet
## 在 Internet-210 連接的subnet上VM 


## 建立subnet上指定port方法
```bash
openstack port create --fixed-ip subnet=<subnet>,ip-address=<ip-address>
neutron port-create --fixed-ip subnet=<subnet>,ip-address=<ip-address>
```

## 在FHW-private_network上建立192.168.200.15 port
openstack port create --network 74c70a16-8cb6-427e-bc28-80d8a6ecdffa --fixed-ip ip-address=192.168.200.15 test-FHW-port

neutron port-create --fixed-ip subnet=deneil_subnet-2,ip-address=192.168.77.15 --name test-barbican fca993fc-fc6f-42b5-82a6-35220a3e6715
neutron port-create --fixed-ip subnet=deneil_subnet-2,ip-address=192.168.77.15 --name test-barbican fca993fc-fc6f-42b5-82a6-35220a3e6715


openstack port create --network 764abfc0-05ee-4a6e-8b2b-5e0b81af9bf2 --fixed-ip ip-address=192.168.77.250 test-net-port



### 將port加到VM上
openstack server add port <server> <port>
openstack server add port deneil-control-node test-FHW-port
openstack server add port f322eabf-500c-4357-8477-b9a5103be71c 6ae64caf-050f-4397-a4a9-f482c03a5378

openstack server add port deneil-test-us-net deneil_centOS_port

openstack server remove port <server> <port>
openstack server remove port deneil-test-us-net deneil_centOS_port

openstack server add port deneil-test-us-net test-net-port
openstack server remove port deneil-test-us-net test-net-port


route add -net 192.168.77.0/24 dev eth0
route del -net 192.168.77.0/24 dev eth0

route add -net 192.168.77.0 netmask 255.255.255.0 gw 172.19.0.124 dev eth0
route del -net 192.168.77.0 netmask 255.255.255.0 gw 172.19.0.124 dev eth0


## 192.168.77.18
ded41dd2-961d-4c33-bcbc-809e73fe847a



## 因為已有public network (FHW)
## 所以只需要建立新的floating ip或是將以建立的floating ip 拉到instance 上面即可?


#### -----------  openstack   ------------- ####
## 在 network 上面建立新的floating ip
openstack ip floating create

## 將已創造的floating ip 拉到 instance 上面
openstack ip floating add


#### -----------  neutron   ------------- ####
## 在 network 上面建立新的floating ip
neutron floatingip-create 
```bash
neutron floatingip-create \
--floating-ip-address 10.62.164.150 \
FHW          
```
neutron floatingip-create \
--floating-ip-address 10.67.46.128 \
FHW 

openstack floating ip create \
--floating-ip-address 172.19.0.141 \
--description 'test us-net to tanent' \
--project admin \
--subnet 2dedad4a-a94b-4795-a794-7fd31f51a10c \
us_network


``` bash
[root@dct-liberty-ctldb-001 ~]# neutron floatingip-create \
> --floating-ip-address 10.62.164.150 \
> FHW
Created a new floatingip:
+---------------------+--------------------------------------+
| Field               | Value                                |
+---------------------+--------------------------------------+
| fixed_ip_address    |                                      |
| floating_ip_address | 10.62.164.150                        |
| floating_network_id | d7f78406-484b-4cf7-97ae-0e27229db132 |
| id                  | 921982f8-4cc5-4539-bcec-f90a5e2dda62 |
| port_id             |                                      |
| router_id           |                                      |
| status              | DOWN                                 |
| tenant_id           | b2afa04057b94e79a7526b834c65e903     |
+---------------------+--------------------------------------+
```
## Findings
- 所有的floating ip都是需要手動建立的，但是需要先看看





## 將已創造的floating ip 拉到 instance 上面
neutron floatingip-associate 


neutron floatingip-associate 10.62.164.150 465980b1-b915-462a-9be6-f6de8196e19d

```bash
[root@dct-liberty-ctldb-001 ~]# neutron floatingip-associate 10.62.164.150 465980b1-b915-462a-9be6-f6de8196e19d
Floating IP 10.62.164.150 could not be found
```


## 要先將 subnet 家道router上面
neutron router-interface-add AMG-router-FHW-API deneil_subnet
``` bash
[root@dct-liberty-ctldb-001 ~]# neutron router-interface-add AMG-router-FHW-API deneil_subnet
Added interface c012e7fc-975a-4935-b76e-9c6dec6e9529 to router AMG-router-FHW-API.
```

``` bash
[root@dct-liberty-ctldb-001 ~]# neutron floatingip-associate 10.62.164.150 465980b1-b915-462a-9be6-f6de8196e19d
Floating IP 10.62.164.150 could not be found
```



neutron floatingip-associate 921982f8-4cc5-4539-bcec-f90a5e2dda62 465980b1-b915-462a-9be6-f6de8196e19d

```bash
[root@dct-liberty-ctldb-001 ~]# neutron floatingip-associate 921982f8-4cc5-4539-bcec-f90a5e2dda62 465980b1-b915-462a-9be6-f6de8196e19d
Port 465980b1-b915-462a-9be6-f6de8196e19d could not be found
[root@dct-liberty-ctldb-001 ~]# 
```



```bash 
[root@dct-liberty-ctldb-001 ~]# nova show 465980b1-b915-462a-9be6-f6de8196e19d
+--------------------------------------+----------------------------------------------------------+
| Property                             | Value                                                    |
+--------------------------------------+----------------------------------------------------------+
| OS-DCF:diskConfig                    | MANUAL                                                   |
| OS-EXT-AZ:availability_zone          | nova-com002                                              |
| OS-EXT-SRV-ATTR:host                 | dct-liberty-com-002                                      |
| OS-EXT-SRV-ATTR:hypervisor_hostname  | dct-liberty-com-002                                      |
| OS-EXT-SRV-ATTR:instance_name        | instance-000006e9                                        |
| OS-EXT-STS:power_state               | 1                                                        |
| OS-EXT-STS:task_state                | -                                                        |
| OS-EXT-STS:vm_state                  | active                                                   |
| OS-SRV-USG:launched_at               | 2022-10-24T08:59:47.000000                               |
| OS-SRV-USG:terminated_at             | -                                                        |
| accessIPv4                           |                                                          |
| accessIPv6                           |                                                          |
| config_drive                         |                                                          |
| created                              | 2022-10-24T08:59:25Z                                     |
| deneil-private-subnet network        | 192.168.66.4                                             |
| flavor                               | m1.medium (3)                                            |
| hostId                               | d5a2bb294dc59c9806c5b8c63416d2abe2863795421bd9de97c86d43 |
| id                                   | 465980b1-b915-462a-9be6-f6de8196e19d                     |
| image                                | FICO-Ubuntu-16.04 (954409e2-f8a2-4672-8271-478b9235eb6d) |
| key_name                             | deneil_key                                               |
| metadata                             | {}                                                       |
| name                                 | deneil_test_instance                                     |
| os-extended-volumes:volumes_attached | []                                                       |
| progress                             | 0                                                        |
| security_groups                      | default                                                  |
| status                               | ACTIVE                                                   |
| tenant_id                            | b2afa04057b94e79a7526b834c65e903                         |
| updated                              | 2022-10-24T08:59:47Z                                     |
| user_id                              | ba967cc372164c998e0ca363ce048d17                         |
+--------------------------------------+----------------------------------------------------------+
```



```bash
[root@dct-liberty-ctldb-001 ~]# neutron port-list | grep "192.168.66.4"
| 950f1477-634d-4046-ad47-beb87da35b4f |                                                   | fa:16:3e:93:95:09 | {"subnet_id": "27792da6-5ad1-4c00-8c53-9c234efbf6a1", "ip_address": "192.168.66.4"}    |
```


## 綁定float ip 到 port id 上
neutron floatingip-associate 921982f8-4cc5-4539-bcec-f90a5e2dda62 950f1477-634d-4046-ad47-beb87da35b4f
```bash
[root@dct-liberty-ctldb-001 ~]# neutron floatingip-associate 921982f8-4cc5-4539-bcec-f90a5e2dda62 950f1477-634d-4046-ad47-beb87da35b4f
Associated floating IP 921982f8-4cc5-4539-bcec-f90a5e2dda62
```


## 綁定後 測試是否啟用
```bash
hudeneil@DESKTOP-HAPBHJ8:~$ ping 10.62.164.150
PING 10.62.164.150 (10.62.164.150) 56(84) bytes of data.
64 bytes from 10.62.164.150: icmp_seq=1 ttl=57 time=5.95 ms
64 bytes from 10.62.164.150: icmp_seq=2 ttl=57 time=0.911 ms
64 bytes from 10.62.164.150: icmp_seq=3 ttl=57 time=0.925 ms
^C
--- 10.62.164.150 ping statistics ---
3 packets transmitted, 3 received, 0% packet loss, time 2002ms
rtt min/avg/max/mdev = 0.911/2.593/5.945/2.369 ms
```

## 使用key login
```bash
hudeneil@DESKTOP-HAPBHJ8:~$ ls keyTest/
Ubuntu20_key.pem  Ubuntu20_key.pub  foxconn-openstack_key.pem
hudeneil@DESKTOP-HAPBHJ8:~$ ssh -i keyTest/Ubuntu20_key.pem ubuntu@10.62.164.150
The authenticity of host '10.62.164.150 (10.62.164.150)' can't be established.
ECDSA key fingerprint is SHA256:WVWpDV4o7qcukUr23pquDp0Q3hIm6FrvKqHXw7AVV4w.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added '10.62.164.150' (ECDSA) to the list of known hosts.
Welcome to Ubuntu 16.04.2 LTS (GNU/Linux 4.4.0-77-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

  Get cloud support with Ubuntu Advantage Cloud Guest:
    http://www.ubuntu.com/business/services/cloud

0 packages can be updated.
0 updates are security updates.


Last login: Tue Jul  4 07:25:09 2017 from 10.57.185.23
```

## 登入成功但是 沒有WAN連線 (連不到google)
```bash
ubuntu@deneil-test-instance:~$ ping 8.8.8.8
PING 8.8.8.8 (8.8.8.8) 56(84) bytes of data.
^C
--- 8.8.8.8 ping statistics ---
11 packets transmitted, 0 received, 100% packet loss, time 10080ms

```

- 推測是需要另外加到210.203.22.112/28網段才可以連線
- 不然現在無法裝php


neutron router-interface-add router-API deneil_subnet
```bash
[root@dct-liberty-ctldb-001 ~]# neutron router-interface-add router-API deneil_subnet
Unable to complete operation for network fca993fc-fc6f-42b5-82a6-35220a3e6715. The IP address 192.168.66.1 is in use.
```
### 剛剛已經把gateway 用來 做 AMG-router-FHW-API 的router:gateway 因此會失敗，需要創新的interface

## 建立新的port
neutron net-gateway-create 

## 在subnet上面建立新的ip port，要用來連接另一個router
neutron port-create \
fca993fc-fc6f-42b5-82a6-35220a3e6715

```bash
[root@dct-liberty-ctldb-001 ~]# neutron port-create fca993fc-fc6f-42b5-82a6-35220a3e6715
Created a new port:
+-----------------------+--------------------------------------------------------------------------------------------------------------+
| Field                 | Value                                                                                                        |
+-----------------------+--------------------------------------------------------------------------------------------------------------+
| admin_state_up        | True                                                                                                         |
| allowed_address_pairs |                                                                                                              |
| binding:host_id       |                                                                                                              |
| binding:profile       | {}                                                                                                           |
| binding:vif_details   | {}                                                                                                           |
| binding:vif_type      | unbound                                                                                                      |
| binding:vnic_type     | normal                                                                                                       |
| device_id             |                                                                                                              |
| device_owner          |                                                                                                              |
| dns_assignment        | {"hostname": "host-192-168-66-5", "ip_address": "192.168.66.5", "fqdn": "host-192-168-66-5.openstacklocal."} |
| dns_name              |                                                                                                              |
| fixed_ips             | {"subnet_id": "27792da6-5ad1-4c00-8c53-9c234efbf6a1", "ip_address": "192.168.66.5"}                          |
| id                    | e8ff8f24-9a8b-4496-bb35-4e4c743e2c83                                                                         |
| mac_address           | fa:16:3e:1a:77:0c                                                                                            |
| name                  |                                                                                                              |
| network_id            | fca993fc-fc6f-42b5-82a6-35220a3e6715                                                                         |
| port_security_enabled | True                                                                                                         |
| qos_policy_id         |                                                                                                              |
| security_groups       | 012c63c0-e18e-4fe3-a8fd-7854a64af617                                                                         |
| status                | DOWN                                                                                                         |
| tenant_id             | b2afa04057b94e79a7526b834c65e903                                                                             |
+-----------------------+--------------------------------------------------------------------------------------------------------------+
[root@dct-liberty-ctldb-001 ~]# neutron port-list | grep 192.168.66.5                   
| e8ff8f24-9a8b-4496-bb35-4e4c743e2c83 |                                                   | fa:16:3e:1a:77:0c | {"subnet_id": "27792da6-5ad1-4c00-8c53-9c234efbf6a1", "ip_address": "192.168.66.5"}    |
```


neutron router-interface-add router-API e8ff8f24-9a8b-4496-bb35-4e4c743e2c83



## 拔掉router 但是因為有設定floating ip 拔不掉
```bash
[root@dct-liberty-ctldb-001 ~]# neutron router-interface-delete AMG-router-FHW-API deneil_subnet
Router interface for subnet 27792da6-5ad1-4c00-8c53-9c234efbf6a1 on router b883794b-319c-4598-84a8-0e6f1018478e cannot be deleted, as it is required by one or more floating IPs.
```



## 指定port 連接 API-router 成功
```bash
[root@dct-liberty-ctldb-001 ~]# neutron router-interface-add router-API port=e8ff8f24-9a8b-4496-bb35-4e4c743e2c83
Added interface e8ff8f24-9a8b-4496-bb35-4e4c743e2c83 to router router-API.
```

## 但是仍然無法對外連線
```bash
ubuntu@deneil-test-instance:~$ ping 8.8.8.8
PING 8.8.8.8 (8.8.8.8) 56(84) bytes of data.
^C
--- 8.8.8.8 ping statistics ---
97 packets transmitted, 0 received, 100% packet loss, time 96766ms
```

## 如果需要將 VM  變成對外連線到wan :
- 210.203.22.112/28 (External-210) 是 WAN 嗎?
- 是否是因為需要再另外開float ip 到210.203.22.112/28








```bash
[root@dct-liberty-ctldb-001 ~]# nova secgroup-list     
+--------------------------------------+-----------------------------------------------+---------------------------------------------------------+
| Id                                   | Name                                          | Description                                             |
+--------------------------------------+-----------------------------------------------+---------------------------------------------------------+
| 99d85248-371e-4206-bb1f-da294d6babc7 | AMG-https-SG                                  |                                                         |
| 0ab897af-fc96-47f9-a3ba-83ca653518fc | SecGroup_102b5790-29b1-4ab5-a1e3-f926b3a971ea | Security Group for 102b5790-29b1-4ab5-a1e3-f926b3a971ea |
| dba2b94c-00a3-4e89-9343-c76fd21d6638 | SecGroup_ca61e6a2-3400-40a0-b5ad-95408bed53e6 | Security Group for ca61e6a2-3400-40a0-b5ad-95408bed53e6 |
| 012c63c0-e18e-4fe3-a8fd-7854a64af617 | default                                       | Default security group                                  |
+--------------------------------------+-----------------------------------------------+---------------------------------------------------------+
```

```bash
[root@dct-liberty-ctldb-001 ~]# nova list | grep deneil
| 465980b1-b915-462a-9be6-f6de8196e19d | deneil_test_instance          | ACTIVE  | -          | Running     | deneil-private-subnet=192.168.66.4, 10.62.164.150 |
```

nova add-secgroup 465980b1-b915-462a-9be6-f6de8196e19d 012c63c0-e18e-4fe3-a8fd-7854a64af617


openstack server ssh



- Unshelve an instance - Restores the instance.
```bash
# nova unshelve SERVERNAME
```
- Remove a shelved instance - Removes the instance from the server; data and resource associations are deleted. If an instance is no longer needed, you can move the instance off the hypervisor in order to minimize resource usage.
```bash
# nova shelve-offload SERVERNAME
```
 nova unshelve 465980b1-b915-462a-9be6-f6de8196e19d


## 掛float ip
neutron floatingip-associate 921982f8-4cc5-4539-bcec-f90a5e2dda62 950f1477-634d-4046-ad47-beb87da35b4f
# 解掉floating ip
neutron floatingip-disassociate 921982f8-4cc5-4539-bcec-f90a5e2dda62

openstack server pause 465980b1-b915-462a-9be6-f6de8196e19d
openstack server unpause 465980b1-b915-462a-9be6-f6de8196e19d





neutron floatingip-associate 921982f8-4cc5-4539-bcec-f90a5e2dda62 37263530-b797-4855-a802-05858181ae1a



## 試試解掉API-router

- 先解掉floating ip
neutron floatingip-disassociate 921982f8-4cc5-4539-bcec-f90a5e2dda62

- 拔掉連結 router (AMG-router-FHW-API) 到 subnet (deneil_subnet) 的port
neutron router-interface-delete AMG-router-FHW-API deneil_subnet

- 拔掉連結 router (router-API) 到 subnet (deneil_subnet) 的port
neutron router-interface-delete router-API deneil_subnet


- subnet (deneil_subnet) 的 default gateway port 接到  router (AMG-router-FHW-API) 
neutron router-interface-add AMG-router-FHW-API deneil_subnet

## router-API 接到 192.168.66.3
neutron router-interface-add router-API port=e8ff8f24-9a8b-4496-bb35-4e4c743e2c83

## router-API 接到 192.168.66.8
neutron router-interface-add router-API port=77ddc947-5684-4584-9e54-7c119f26245e




## 10.62.164.150 floating to 192.168.66.9
neutron floatingip-associate 921982f8-4cc5-4539-bcec-f90a5e2dda62 f6b0ef52-477a-40ba-8e0a-8eac14d659dc

## 10.62.164.160 floating to 192.168.66.7
neutron floatingip-associate a33bf086-244c-4678-b92b-93da77f06c0b 37263530-b797-4855-a802-05858181ae1a


## 解掉 210.203.22.114 
neutron floatingip-disassociate 0a54e01d-1c7c-4a9b-b91d-e3573ea782c1

## 解掉 10.62.164.150
neutron floatingip-disassociate 921982f8-4cc5-4539-bcec-f90a5e2dda62

## 解掉 10.62.164.160
neutron floatingip-disassociate a33bf086-244c-4678-b92b-93da77f06c0b


- 拔掉連結 router (router-API) 到 subnet (deneil_subnet) 的port
neutron router-interface-delete router-API deneil_subnet

## 建立新的interface
neutron port-create fca993fc-fc6f-42b5-82a6-35220a3e6715

```bash
[root@dct-liberty-ctldb-001 ~]# neutron port-create fca993fc-fc6f-42b5-82a6-35220a3e6715
Created a new port:
+-----------------------+-----------------------------------------------------------------------------------------------------------------+
| Field                 | Value                                                                                                           |
+-----------------------+-----------------------------------------------------------------------------------------------------------------+
| admin_state_up        | True                                                                                                            |
| allowed_address_pairs |                                                                                                                 |
| binding:host_id       |                                                                                                                 |
| binding:profile       | {}                                                                                                              |
| binding:vif_details   | {}                                                                                                              |
| binding:vif_type      | unbound                                                                                                         |
| binding:vnic_type     | normal                                                                                                          |
| device_id             |                                                                                                                 |
| device_owner          |                                                                                                                 |
| dns_assignment        | {"hostname": "host-192-168-66-10", "ip_address": "192.168.66.10", "fqdn": "host-192-168-66-10.openstacklocal."} |
| dns_name              |                                                                                                                 |
| fixed_ips             | {"subnet_id": "27792da6-5ad1-4c00-8c53-9c234efbf6a1", "ip_address": "192.168.66.10"}                            |
| id                    | 32a4a820-a384-4e2c-84ee-06d25a31f7ec                                                                            |
| mac_address           | fa:16:3e:d2:55:8a                                                                                               |
| name                  |                                                                                                                 |
| network_id            | fca993fc-fc6f-42b5-82a6-35220a3e6715                                                                            |
| port_security_enabled | True                                                                                                            |
| qos_policy_id         |                                                                                                                 |
| security_groups       | 012c63c0-e18e-4fe3-a8fd-7854a64af617                                                                            |
| status                | DOWN                                                                                                            |
| tenant_id             | b2afa04057b94e79a7526b834c65e903                                                                                |
+-----------------------+-----------------------------------------------------------------------------------------------------------------+
```


## 32a4a820-a384-4e2c-84ee-06d25a31f7ec 192.168.66.10

## ea93e4ff-4a89-4f67-823a-b52c6309198e | External-210-subnet

## aec46520-5ad5-469a-acbd-dfec83852fd1 | internet_22_subnet | 210.203.22.128/27

## 將internet_22_subnet 對接 deneil_subnet 192.168.66.10
neutron router-interface-add router-API port=32a4a820-a384-4e2c-84ee-06d25a31f7ec



## 210.203.22.114 floating to 192.168.66.7
neutron floatingip-associate 0a54e01d-1c7c-4a9b-b91d-e3573ea782c1 37263530-b797-4855-a802-05858181ae1a

## 解掉 210.203.22.114 
neutron floatingip-disassociate 0a54e01d-1c7c-4a9b-b91d-e3573ea782c1

## 將 Router_210 對接 deneil_subnet 192.168.66.10
neutron router-interface-add Router_210 port=2c955bb2-4243-48cf-bc8a-2b9fd71126c7


neutron router-interface-delete AMG-router-FHW-API deneil_subnet
neutron router-interface-delete Router_210 deneil_subnet
neutron floatingip-disassociate 0a54e01d-1c7c-4a9b-b91d-e3573ea782c1


## 將 Router_210 對接 deneil_subnet 192.168.66.1 (gateway)
neutron router-interface-add Router_210 deneil_subnet

## 210.203.22.114 floating to 192.168.66.7
neutron floatingip-associate 0a54e01d-1c7c-4a9b-b91d-e3573ea782c1 37263530-b797-4855-a802-05858181ae1a


## ############################
##   接上 AMG-router-FHW-API
## ############################

## 創新port 
neutron port-create fca993fc-fc6f-42b5-82a6-35220a3e6715

## 找port id
neutron port-list | grep 192.168.66

## AMG-router-FHW-API 接上 
neutron router-interface-add AMG-router-FHW-API port=7d5f62d3-8f61-4d87-822b-7259b6bc74b5

## 10.62.164.160 floating to 192.168.66.7
neutron floatingip-associate a33bf086-244c-4678-b92b-93da77f06c0b 37263530-b797-4855-a802-05858181ae1a

>> 無法ssh 連線至 10.62.164.160

## 10.62.164.150 floating to 192.168.66.9
neutron floatingip-associate 921982f8-4cc5-4539-bcec-f90a5e2dda62 f6b0ef52-477a-40ba-8e0a-8eac14d659dc

>> 無法ssh 連線至 10.62.164.150


neutron floatingip-disassociate a33bf086-244c-4678-b92b-93da77f06c0b
neutron floatingip-disassociate 921982f8-4cc5-4539-bcec-f90a5e2dda62
neutron router-interface-delete AMG-router-FHW-API deneil_subnet



## 210.203.22.114 floating to 192.168.66.7
neutron floatingip-associate 0a54e01d-1c7c-4a9b-b91d-e3573ea782c1 37263530-b797-4855-a802-05858181ae1a


## 210.203.22.114 floating to 192.168.66.9
neutron floatingip-associate 0a54e01d-1c7c-4a9b-b91d-e3573ea782c1 f6b0ef52-477a-40ba-8e0a-8eac14d659dc


neutron floatingip-disassociate 0a54e01d-1c7c-4a9b-b91d-e3573ea782c1 











```bash
[root@dct-liberty-ctldb-001 ~]# neutron port-list | grep 192.168.66
| 37263530-b797-4855-a802-05858181ae1a |                                                   | fa:16:3e:d7:3a:f6 | {"subnet_id": "27792da6-5ad1-4c00-8c53-9c234efbf6a1", "ip_address": "192.168.66.7"}    |
| 3ea92cfc-2cbf-4bcd-bdb4-6e7b991fedd6 |                                                   | fa:16:3e:33:d7:c2 | {"subnet_id": "27792da6-5ad1-4c00-8c53-9c234efbf6a1", "ip_address": "192.168.66.2"}    |
| 6d96e852-a9f9-49a4-ba5e-4cd6853e0ec3 |                                                   | fa:16:3e:c1:8a:b1 | {"subnet_id": "27792da6-5ad1-4c00-8c53-9c234efbf6a1", "ip_address": "192.168.66.1"}    |
| 8efa570f-564f-4209-ad06-4fde6740340f |                                                   | fa:16:3e:fc:ca:00 | {"subnet_id": "27792da6-5ad1-4c00-8c53-9c234efbf6a1", "ip_address": "192.168.66.3"}    |
```


























## 10.62.164.150 floating to 192.168.66.4
neutron floatingip-associate 921982f8-4cc5-4539-bcec-f90a5e2dda62 37263530-b797-4855-a802-05858181ae1a

## 210.203.22.114 floating to 192.168.66.4
neutron floatingip-associate 0a54e01d-1c7c-4a9b-b91d-e3573ea782c1 37263530-b797-4855-a802-05858181ae1a







You have mail in /var/spool/mail/root



[root@dct-queens-ctl-001 ~]# neutron router-port-list 92922ae5-a30e-4fb1-a405-f41ec6059c62
neutron CLI is deprecated and will be removed in the future. Use openstack CLI instead.
+--------------------------------------+------+-------------------+---------------------------------------------------------------------------------------+
| id                                   | name | mac_address       | fixed_ips                                                                             |
+--------------------------------------+------+-------------------+---------------------------------------------------------------------------------------+
| 3d253555-db9f-4f8c-9ba6-83f6e5d6604e |      | fa:16:3e:84:8c:79 | {"subnet_id": "257830af-f3fd-4d8d-9ca8-d3baf77854ef", "ip_address": "192.168.66.254"} |
+--------------------------------------+------+-------------------+---------------------------------------------------------------------------------------+



[root@dct-queens-ctl-001 ~]# neutron subnet-show ddb04228-1ad8-4979-b7af-481f5418413a
neutron CLI is deprecated and will be removed in the future. Use openstack CLI instead.
+-------------------+------------------------------------------------------+
| Field             | Value                                                |
+-------------------+------------------------------------------------------+
| allocation_pools  | {"start": "210.203.22.117", "end": "210.203.22.125"} |
| cidr              | 210.203.22.112/28                                    |
| created_at        | 2021-04-17T05:13:46Z                                 |
| description       |                                                      |
| dns_nameservers   |                                                      |
| enable_dhcp       | False                                                |
| gateway_ip        | 210.203.22.126                                       |
| host_routes       |                                                      |
| id                | ddb04228-1ad8-4979-b7af-481f5418413a                 |
| ip_version        | 4                                                    |
| ipv6_address_mode |                                                      |
| ipv6_ra_mode      |                                                      |
| name              | Internet-210-subnet                                  |
| network_id        | cef9f3d1-cbac-4667-8402-64ce3dff55b2                 |
| project_id        | d034846b0c0f4df4b0ef6cae1bd9b306                     |
| revision_number   | 1                                                    |
| service_types     |                                                      |
| subnetpool_id     |                                                      |
| tags              |                                                      |
| tenant_id         | d034846b0c0f4df4b0ef6cae1bd9b306                     |
| updated_at        | 2022-02-14T02:04:23Z                                 |
+-------------------+------------------------------------------------------+



[root@dct-queens-ctl-001 ~]# neutron subnet-list
neutron CLI is deprecated and will be removed in the future. Use openstack CLI instead.
+--------------------------------------+-----------------------+-------------------+--------------------------------------------------------+
| id                                   | name                  | cidr              | allocation_pools                                       |
+--------------------------------------+-----------------------+-------------------+--------------------------------------------------------+
| 257830af-f3fd-4d8d-9ca8-d3baf77854ef | isubnet1              | 192.168.66.0/24   | {"start": "192.168.66.2", "end": "192.168.66.254"}     |
| 2dedad4a-a94b-4795-a794-7fd31f51a10c | us_subnet             | 172.19.0.0/20     | {"start": "172.19.0.20", "end": "172.19.14.249"}       |
| 411fadc6-fd89-41bb-8388-ef1f99de1672 | api_subnet            | 192.168.140.0/24  | {"start": "192.168.140.2", "end": "192.168.140.254"}   |
| 539351d3-7e75-4440-a2d2-37300a688094 | isubnet1              | 192.168.170.0/24  | {"start": "192.168.170.100", "end": "192.168.170.254"} |
| 86b65de4-992d-4a02-a92c-8555def758bf | Internet-210-2-subnet | 210.203.22.128/27 | {"start": "210.203.22.129", "end": "210.203.22.157"}   |
| be3dc9a4-f45a-4f38-bc57-cafb401f0d19 | FHW_subnet            | 10.62.164.192/26  | {"start": "10.62.164.224", "end": "10.62.164.252"}     |
|                                      |                       |                   | {"start": "10.62.164.221", "end": "10.62.164.221"}     |
|                                      |                       |                   | {"start": "10.62.164.212", "end": "10.62.164.218"}     |
|                                      |                       |                   | {"start": "10.62.164.197", "end": "10.62.164.204"}     |
|                                      |                       |                   | {"start": "10.62.164.207", "end": "10.62.164.210"}     |
| d2d5d482-1c7a-40f4-b8bf-c4a0e1c21f95 | Octavia_manage_subnet | 172.29.0.0/20     | {"start": "172.29.0.10", "end": "172.29.15.254"}       |
| ddb04228-1ad8-4979-b7af-481f5418413a | Internet-210-subnet   | 210.203.22.112/28 | {"start": "210.203.22.117", "end": "210.203.22.125"}   |
+--------------------------------------+-----------------------+-------------------+--------------------------------------------------------+







router-deneil-private : 92922ae5-a30e-4fb1-a405-f41ec6059c62


Internet-210-subnet : ddb04228-1ad8-4979-b7af-481f5418413a


```bash
[root@dct-queens-ctl-001 ~]# neutron router-list
neutron CLI is deprecated and will be removed in the future. Use openstack CLI instead.
+--------------------------------------+-----------------------+-----------------------+
| id                                   | name                  | external_gateway_info |
+--------------------------------------+-----------------------+-----------------------+
| 92922ae5-a30e-4fb1-a405-f41ec6059c62 | router-deneil-private | null                  |
+--------------------------------------+-----------------------+-----------------------+

[root@dct-queens-ctl-001 ~]# neutron router-port-list 92922ae5-a30e-4fb1-a405-f41ec6059c62
neutron CLI is deprecated and will be removed in the future. Use openstack CLI instead.
+--------------------------------------+------+-------------------+---------------------------------------------------------------------------------------+
| id                                   | name | mac_address       | fixed_ips                                                                             |
+--------------------------------------+------+-------------------+---------------------------------------------------------------------------------------+
| 3d253555-db9f-4f8c-9ba6-83f6e5d6604e |      | fa:16:3e:84:8c:79 | {"subnet_id": "257830af-f3fd-4d8d-9ca8-d3baf77854ef", "ip_address": "192.168.66.254"} |
+--------------------------------------+------+-------------------+---------------------------------------------------------------------------------------+
```


`neutron router-interface-add ROUTER SUBNET`

<!-- neutron router-interface-add router-deneil-private Internet-210-subnet -->


### 將router 街上WAN
neutron router-gateway-set router-deneil-private cef9f3d1-cbac-4667-8402-64ce3dff55b2


## 拔掉router & subnet id
neutron router-interface-delete router-deneil-private 257830af-f3fd-4d8d-9ca8-d3baf77854ef
neutron router-interface-add router-deneil-private 257830af-f3fd-4d8d-9ca8-d3baf77854ef

## subnet 接到 router
neutron router-interface-add router-private-Internet-210--:cef9f3d1-cbac-4667-8402-64ce3dff55b2 257830af-f3fd-4d8d-9ca8-d3baf77854ef



neutron router-interface-delete usRouter-af05bb82-6310-425b-83eb-c4a12194c9f0-us_router-vhqstenppgys 257830af-f3fd-4d8d-9ca8-d3baf77854ef


router-deneil-private
```bash

[root@dct-queens-ctl-001 ~]# neutron router-list | grep "router-private-Internet-210--"
neutron CLI is deprecated and will be removed in the future. Use openstack CLI instead.
| 683a7a4f-bec6-4183-bfc4-8f5d18f7af8d | router-private-Internet-210--:cef9f3d1-cbac-4667-8402-64ce3dff55b2             | 02ada69b45c143daa1c094f2ed6b8b59 | {"network_id": "cef9f3d1-cbac-4667-8402-64ce3dff55b2", "enable_snat": true, "external_fixed_ips": [{"subnet_id": "ddb04228-1ad8-4979-b7af-481f5418413a", "ip_address": "210.203.22.121"}]} | False       | True |


```







```bash
[root@dct-queens-ctl-001 ~]# openstack ip availability list
+--------------------------------------+----------------------------------------------------+-----------+----------+
| Network ID                           | Network Name                                       | Total IPs | Used IPs |
+--------------------------------------+----------------------------------------------------+-----------+----------+
| 6a58cac2-a6ea-4a64-bee5-83f85b877391 | private-FHW-sherry-37-2                            |       253 |        4 |
| 1ef047cc-21d1-4737-9323-29cf9a7392a7 | private-vincent-125                                |       253 |        4 |
| ce8c51f6-83fa-4854-a9d9-31b2550c6a11 | test-no-us-router                                  |       253 |        5 |
| 53374f08-cb29-43ed-8ded-469c1bc40df6 | private-FHW-amg                                    |       253 |      254 |
| 2f3a2435-a1c4-48a1-81ea-2868dfc97e58 | subnet-pool-test-0                                 |         4 |        4 |
| 42991a3d-1e00-403f-a83d-2570d4054306 | HA network tenant b78f51254e394d8da67131c7143214da |     16382 |        3 |
| ff807026-9481-454c-9ead-ca468c6df2f0 | private-net130                                     |       253 |        5 |
| 0e0cd390-c205-4720-9fe6-5b112d4f2cea | FHW-111                                            |       253 |       12 |
| e4992939-64eb-4762-9bb2-7f5d9ae17d57 | private-FHW-188                                    |       253 |        4 |
| 8f313d84-e89f-48d5-9926-3f22dfa8e927 | fixo_vpc                                           |       253 |        4 |
| 96570458-a29a-4bd6-9aec-c193af1ad44f | HA network tenant cce932cdec764b3a80b282fc01bd6a20 |     16382 |        3 |
| 13cf08ad-35a8-4afd-86ff-765a7801c8f7 | private-FHW-160                                    |       253 |        2 |
| 29c50cfb-8518-4116-a4ef-ec26bbcab002 | aaa-200                                            |       253 |        4 |
| 913949a5-e2fb-4c55-a515-24061a4f704d | private-Internet-210                               |       253 |        6 |
| 3e88b788-3181-499e-8047-4683e349e991 | HA network tenant 4a101387451845a68f071f6aae292fd8 |     16382 |        6 |
| 083fd247-11a8-4830-86f2-9d93c78da647 | private-FHW                                        |       253 |       26 |
| 063777c2-490c-4f65-9b7b-90bc3205af4b | hcs-vlan566                                        |         1 |        1 |
| 76659d87-c36a-4b05-94ff-3ad38fe38cec | private-FHW                                        |       253 |        7 |
| bf5fceb5-61d8-470c-9aa5-fb0a7b813108 | HA network tenant 63eb664715934e999c0886a629b48864 |     16382 |        9 |
| 80386f54-0e81-4c7e-ad63-3e004e60665c | private-FHW                                        |       253 |        5 |
| 74241834-308e-4539-869e-d24a2af01802 | HA network tenant 117c8e1d35974646a152cc91b96989cb |     16382 |       12 |
| ab50f76f-48d0-4af0-8ba9-e2ef2deeb322 | private-FHW-Dean                                   |       253 |       13 |
| 74e28aa3-63ca-4da5-9611-7408fabd8a08 | HA network tenant 7d40cadc74b74c409118d0fb95df9dec |     16382 |        6 |
| 9010b302-f019-4390-af61-3d091a0a4b0e | private-Internet-110                               |       253 |       11 |
| d88fb83f-2f5a-494a-a321-eac0c03a768b | private-FHW-sherry-37                              |       253 |        5 |
| 1c2a0e2d-4891-45ef-81b0-a1725274c419 | private-FHW-170                                    |       155 |       35 |
| f4cf855b-a480-4b9b-8e30-ef017d818394 | private-FHW-180                                    |       253 |        4 |
| 2a9bceb3-4410-4d31-a4c8-0e2b56b58b40 | Dean-network                                       |       253 |        4 |
| 1165cc50-92d4-4c6a-b400-b84c5f31f5f6 | API_net                                            |        98 |       67 |
| 62e662b2-9e02-492b-83ec-ebd39e144d3c | HA network tenant d034846b0c0f4df4b0ef6cae1bd9b306 |     16382 |       27 |
| ef3bdf4d-59f7-4ce3-aeaa-0f7b64cf9c08 | HA network tenant b598e33be0f940d397215aa6cba9c273 |     16382 |        3 |
| 82354586-5cdf-420d-be4b-b7d23e625f88 | test-network                                       |       253 |        4 |
| b252febf-42fd-400b-8ccc-fc92a148bbcd | private-FHW-140                                    |       253 |        8 |
| 9a7cbc21-6373-4581-a2e1-cb7954a12a4f | private-FHW                                        |       253 |       16 |
| 31b1a3e1-bcda-45ee-92d5-ee7a4c974d26 | private-foxconn_office_net                         |       250 |        5 |
| edf39f1b-8a4a-4e78-92cd-720475521fed | HA network tenant 44d742b1543f407f9efa27d71b4b0889 |     16382 |        3 |
| 58cbb955-a7b2-4cbd-b180-93f36949968a | private-FHW                                        |       253 |        5 |
| 702cdb52-372b-4a6b-8af6-9bc59abd589b | HA network tenant d3415b5ee0ef40f1a1d3a3a3ab428bdd |     16382 |        6 |
| 74e5ae79-e872-4641-9832-de1759945270 | private-FHW-120                                    |       253 |       10 |
| ebbbbaa9-54f6-46c9-902d-d75f23b6fceb | HA network tenant 7ca321becacb45478c060516ff3cffa6 |     16382 |        3 |
| cb807b61-8351-41fa-a635-add24dc7612f | deneil-private                                     |       253 |        4 |
| 13a6ade1-0ec7-4dd8-856f-043080893ce3 | FHW                                                |        49 |       60 |
| 6c06d2b1-a2db-4c54-8392-6ee6a4d92a3e | HA network tenant 4819bcd81d6f435fb07240eae1c9406a |     16382 |        3 |
| ef6908b3-e9ee-44c3-95dc-b62fdf8a6af9 | private-FHW                                        |       253 |        5 |
| 73274e55-b6b0-4487-8c58-f9a0b9f25708 | HA network tenant 3ecda1836a6044179ca67db2ed106de8 |     16382 |        6 |
| 035e3f3d-7eea-4f2b-be7c-7a14f05657d8 | HA network tenant f8141fafc9b24e29bbaa78eca37a958f |     16382 |        3 |
| 767cbc69-c574-4534-a57b-137af7c01885 | private-FHW-peer-connection-10                     |       253 |        6 |
| e7dcf24c-9eb8-45b2-80fa-a66938416abf | HA network tenant c0f0db9467bb4a09b5d88cb98264a0de |     16382 |        3 |
| 9c68fbfe-8519-4472-bf1b-1419322db0f9 | private-FHW-190                                    |       253 |       56 |
| f39643a9-1492-4744-9927-e3526046daa3 | as123                                              |       253 |        0 |
| 449a4232-d4bb-4850-8311-0d0ed3a6cf8b | aaa-210                                            |       253 |        5 |
| 2066d6e6-5202-4f73-8cc7-363ae5f4cae3 | api_test_networks@!#!@$#$@#$                       |       253 |        5 |
| 976b5ced-bd8c-44ec-ad42-51a58f91001a | private-vincent-185                                |       253 |        4 |
| 650c4fbe-b102-4766-a262-71baad129f43 | private-FHW190                                     |       253 |        4 |
| c658ee00-ccdb-4c5c-a98a-32263032ff84 | private-FHW-130                                    |       253 |       22 |
| b12c9da3-c1ce-4ec0-8dfd-0fe1472d40b7 | private-Internet-210-2-100                         |       253 |        9 |
| eaf451f5-d9a8-4d1a-8e04-c9006882da39 | us_network2                                        |      4093 |        6 |
| a621f08d-0eed-45ca-a4c3-d2ec87bc3a2c | private-Internet-210-2                             |       253 |        4 |
| cef9f3d1-cbac-4667-8402-64ce3dff55b2 | Internet-210                                       |         9 |        8 |
| 4fad0e0a-9661-4a3d-a777-1843177e936e | private-vincent-115                                |       253 |        4 |
| 3bb2b45c-ec64-4ef5-8f05-1414fed047b1 | Internet-210-2                                     |        29 |       29 |
| 5c87f938-7b85-4704-955b-cecc91f6362e | test-private1                                      |       253 |        6 |
| a3f3efaa-8710-4968-84d5-c4360a1c6993 | HA network tenant 8ec08ecc9c984fcbaa01783d35f1c2a1 |     16382 |      189 |
| b538d3f4-2d53-4c97-a449-77e7b189ef48 | private-FHW                                        |       253 |       25 |
| d7f530d0-15ea-4657-8012-3a315be7ce16 | HA network tenant ff5beb4f21754af6883028ae1db316be |     16382 |       24 |
| d942d67a-806f-49f1-a50b-1a026f84de91 | elvis                                              |       253 |        6 |
| 77728013-6f09-44be-aada-5fc50a6ee990 | HA network tenant 2621c1e799264bda92fc7bb0820e46b7 |     16382 |        3 |
| 20e0f5eb-1b56-4872-8853-e2961eade0d0 | private-Internet-210-2-digo-test                   |       253 |       12 |
| 8f0d11c7-c85f-427b-a1d8-d608c5c3ceaa | private_net_api                                    |       253 |        4 |
| 53234f7e-6a75-4b43-abf6-e05b7dbd286c | private-tester-viewer-network                      |       253 |        3 |
| e0b259a5-cdbe-4f86-bb47-a80a81b19256 | private-FHW                                        |       253 |        5 |
| efab8cd4-541e-4cab-baa6-af48966d5286 | aws_vpc                                            |       253 |        3 |
| c56ff50a-9c95-47d0-8614-a2aad1c5540e | private-Internet-210-2                             |       253 |       18 |
| 04388a46-52c2-499c-ba7d-55f2930cdb99 | HA network tenant 02ada69b45c143daa1c094f2ed6b8b59 |     16382 |        9 |
| 3523f34b-b912-4c6e-b65f-d750e1c6779e | private-FHW                                        |       253 |        8 |
| f0460a4e-a3a0-4fe4-af24-72cb1b5df861 | private-210-2                                      |       253 |        6 |
| 3f2020bc-eec3-4cb4-8e58-d228eab22e58 | cit-bryant-test                                    |        99 |        5 |
| 68cab3c0-3867-4089-a859-506ece4191bb | private-FHW                                        |       253 |        8 |
| be0b601d-3916-46fa-8a22-586a7ddb967c | HA network tenant dacf6f981aa04a6f9d4c8754da562c01 |     16382 |        3 |
| d1fc67e7-efcb-4ef1-8cf1-88443a107306 | private-112-210-2                                  |       253 |        6 |
| f68f31dd-e329-4a62-9e0e-0ad23ee7c94e | HA network tenant cbae0f5332c34ddab61d06fff56a449f |     16382 |       45 |
| e569ba20-aea2-4ef1-a45a-cd02540cdf5b | HA network tenant 4f94636e4f1e4232ae9a185e7181334a |     16382 |        3 |
| 9d945694-fb5e-450a-b14e-e91b250565f5 | HA network tenant 2b493acdacbe4e21a34cb96e073e56f3 |     16382 |        3 |
| 8c5c84e7-bd11-4899-97d9-684c7fb3365e | joseph-private-net                                 |       253 |        4 |
| 0b41344d-8631-4e52-be65-5eea08b55d4f | Octavia_manage_network                             |      4085 |       17 |
| 37e070d2-3c78-4a04-9043-e4ec2ae0a713 | HA network tenant 5243bf08350d462796cad18a25b43f50 |     16382 |        3 |
| f47e4456-2434-4a68-9989-0fa834d3ebfa | HA network tenant 7b71fec3032d4170862f77cdf0b0936c |     16382 |        3 |
| 4a5814b6-214a-4e1b-afca-55b205b2a5ed | private-Internet-fhw-150                           |       253 |        6 |
| 61a2621a-9084-49f5-b9fb-475e2a940138 | HA network tenant eb25bdbf69e549fd9ff4661909c7c326 |     16382 |        3 |
| 746b0741-1627-42b9-a417-d4597e556a33 | private_network                                    |       253 |        7 |
| 2b65849d-ad88-4783-82d3-2bdb8a38bcee | private-Internet-210-2                             |       253 |        6 |
| 817c49b0-32c6-4984-82bc-3b8e027a1dcf | cit_dean_vlan                                      |       101 |        5 |
| ecc4f1ef-29a3-4a09-b112-559eea1b7c9e | private-vincent-180                                |       253 |        5 |
| a639924e-b285-4262-9abb-1e24aab622c5 | private-Internet-210                               |       253 |        7 |
| 9497e394-4013-4fac-a2e8-4e25359d2518 | rbac-dline-network                                 |       253 |       20 |
| 73670089-81ea-48db-aa06-0a51df687094 | private-FHW                                        |       253 |        5 |
| fe69f479-7dbe-4764-98fa-7272972e07fc | aaa-200                                            |       253 |       16 |
| da27bd5b-583b-4164-b8b5-a4b35b96070a | HA network tenant cfdc857f42274e2ea6b30dd844e23ca5 |     16382 |        3 |
| b7593df6-3650-4715-92c3-2f4d17c184d6 | HA network tenant 179aab1a0b474546a5e748d2b69c567b |     16382 |        6 |
| 398e06a1-2adb-4980-8b86-1337589df381 | manila_service_network                             |       243 |       93 |
| ecf3c0a5-af28-49b8-89b3-a5633b8601d3 | private-FHW-130                                    |       253 |        6 |
| 87d92b16-51bb-4bee-9dd7-3ee2c47ce159 | aabbc12c                                           |         1 |        0 |
| de2d427d-02d6-4097-993d-0f5d38bd63fd | vlan552                                            |         1 |        0 |
| adb82edb-b693-4860-a506-44a890f02c04 | test-no-us-router                                  |       253 |        4 |
| b1086729-7071-4e49-b0ae-8cf9771501e9 | private-FHW                                        |       253 |        6 |
| 1b329193-3aae-4793-aa8e-e9e44909c12b | private-FHW                                        |       253 |        7 |
| 2e4248d0-eaed-4c03-b592-d826cff26c13 | private-network-140                                |       253 |        5 |
| 9ec1e11c-0059-4418-8550-c651bf3700dc | private-166                                        |       253 |        6 |
| 98d4c18d-3ec3-4e7b-a686-dcbe89e27d8c | aws_direct_connect                                 |         1 |        2 |
| 2807b749-b2f1-4fd4-a81e-a2c20d4b122d | FHW-dedicated-564                                  |       251 |       18 |
| 7ec16aa4-fc69-4e5c-8e71-046a9ee1f5ae | private-FHW                                        |       253 |        6 |
| 99e1b2e3-1578-43ad-b2a0-565091a3ac26 | private-Internet-210-2                             |       253 |        5 |
| 71420c71-2e0e-4295-a55f-b2154faf7ff4 | private-FHW                                        |       253 |       10 |
| d28ce19e-4b36-488f-b010-209c47dc2c76 | HA network tenant 4cf0e9a45b3e47f3b343add7c813af89 |     16382 |       30 |
| af1682c1-bdbe-4e65-91cc-d19c223e6d9b | HA network tenant 0492888a597f4c26ac161d106abf28d4 |     16382 |       33 |
| ddd27859-2746-4f2d-bf27-4b2f73298257 | us_network                                         |      3814 |      121 |
| 5d46b936-4d53-4d58-8407-28bbde5a3c0e | Internet-563                                       |       252 |        3 |
| eb891896-f2ad-4c21-beb3-1e638bb901d5 | HA network tenant 11ea477c4eb44f22b989b43349ee3c3a |     16382 |        3 |
+--------------------------------------+----------------------------------------------------+-----------+----------+


[root@dct-queens-ctl-001 ~]# openstack ip availability show cef9f3d1-cbac-4667-8402-64ce3dff55b2
+------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Field                  | Value                                                                                                                                                      |
+------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------+
| id                     | cef9f3d1-cbac-4667-8402-64ce3dff55b2                                                                                                                       |
| name                   | None                                                                                                                                                       |
| network_id             | cef9f3d1-cbac-4667-8402-64ce3dff55b2                                                                                                                       |
| network_name           | Internet-210                                                                                                                                               |
| project_id             | d034846b0c0f4df4b0ef6cae1bd9b306                                                                                                                           |
| subnet_ip_availability | cidr='210.203.22.112/28', ip_version='4', subnet_id='ddb04228-1ad8-4979-b7af-481f5418413a', subnet_name='Internet-210-subnet', total_ips='9', used_ips='8' |
| total_ips              | 9                                                                                                                                                          |
| used_ips               | 8                                                                                                                                                          |
+------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------+

```
