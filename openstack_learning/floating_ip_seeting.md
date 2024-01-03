neutron router-create deneil-router




#### VM 連接兩個subnet
## 在 Internet-210 連接的subnet上VM 


## 建立subnet上指定port方法
```bash
openstack port create --fixed-ip subnet=<subnet>,ip-address=<ip-address>
neutron port-create --fixed-ip subnet=<subnet>,ip-address=<ip-address>
```
| ID                                   | Name                      | Subnets                              |
+--------------------------------------+---------------------------+--------------------------------------+
| 8a12e763-2639-412f-9597-065fca5ae6c9 | private-FHW-deneil-test-2 | b755546e-ff4d-418d-9f28-59a389478a14 |
192.168.120.5
ac10f80d-355b-42c8-a2d6-6a7f65e721d3

## 在FHW-private_network上建立192.168.200.15 port
openstack port create --network 8a12e763-2639-412f-9597-065fca5ae6c9 deneil-admin
openstack server add port deneil-test-VM deneil-test-port


neutron port-create --fixed-ip subnet=deneil_subnet-2,ip-address=192.168.77.15 --name test-barbican fca993fc-fc6f-42b5-82a6-35220a3e6715
neutron port-create --fixed-ip subnet=deneil_subnet-2,ip-address=192.168.77.15 --name test-barbican fca993fc-fc6f-42b5-82a6-35220a3e6715


openstack port create --network a3b3ce16-c210-4c5c-837a-0d9a9b6513a9 --fixed-ip ip-address=192.168.150.12 FHW-566-horizon
# 192.168.150.12 935d91be-68e3-44c6-ba99-b72b115e2281
## deneil-horizon-test add 192.168.150.12 
openstack server add port afb44ded-046c-40f6-898a-d423fd7e6475 935d91be-68e3-44c6-ba99-b72b115e2281




openstack port create --network 764abfc0-05ee-4a6e-8b2b-5e0b81af9bf2 --fixed-ip ip-address=192.168.77.250 test-net-port

# 
openstack port create --network 74c70a16-8cb6-427e-bc28-80d8a6ecdffa --fixed-ip ip-address=192.168.200.50 test-admin-port-1
# 1682409c-d992-46a8-bb6e-07b5bdf1bf59 | test-admin-port-1 | ip_address='192.168.200.50', subnet_id='5ada664c-6b24-4208-acb1-cd8c5133fd61'



neutron port-create fca993fc-fc6f-42b5-82a6-35220a3e6715

### 將port加到VM上
openstack server add port <server> <port>
openstack server add port deneil-control-node test-FHW-port
openstack server add port f322eabf-500c-4357-8477-b9a5103be71c 6ae64caf-050f-4397-a4a9-f482c03a5378

openstack server add port 8a12e763-2639-412f-9597-065fca5ae6c9 987ba1d2-bcdc-4b3e-aebb-d780c452973c

# deneil_test add 192.168.200.50
openstack server add port ffbb718c-e88e-4b28-931b-d7e293d60172 1682409c-d992-46a8-bb6e-07b5bdf1bf59

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
```bash

openstack port create --fixed-ip subnet=<subnet>,ip-address=<ip-address>
openstack port create --fixed-ip subnet=ad29c0a8-aa14-47e7-83ec-dd36b992987b,ip-address=192.168.77.20

openstack port create \
--network 764abfc0-05ee-4a6e-8b2b-5e0b81af9bf2 \
--fixed-ip subnet=ad29c0a8-aa14-47e7-83ec-dd36b992987b,ip-address=192.168.77.20 \
testing-port


[root@dct-queens-ctl-001 ~]# openstack port list | grep 192.168.77.20
| 5d563fe5-5094-4848-b649-2471225e9fe0 | testing-port
                                   | fa:16:3e:22:27:02 | ip_address='192.168.77.20', subnet_id='ad29c0a8-aa14-47e7-83ec-dd36b992987b'   | DOWN   |
```

```bash

[root@dct-queens-ctl-001 ~]# openstack server list | grep deneil
| ffbb718c-e88e-4b28-931b-d7e293d60172 | deneil_test_key_rotation    | ACTIVE | API_net=192.168.60.164     | FICO-Centos-7.9     | FiCo-v2m4-Q10|
| eb246e45-d37e-414c-944b-e63e4f8fb7d1 | deneil-test-us-net          | ACTIVE | us_network=172.19.0.160    |                     | FiCo-v2m4-Q10|
| 6f1d9df2-5a5f-47e1-ba19-761dbf137146 | deneil-test-network         | ACTIVE | API_net=192.168.60.186     |                     | FiCo-v2m4-Q10|

```



openstack server add port <server> <port>
## 
openstack server add port ffbb718c-e88e-4b28-931b-d7e293d60172 5d563fe5-5094-4848-b649-2471225e9fe0


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


openstack floating ip create \
--port 192.168.200.
--floating-ip-address 10.62.164.244 \
--fixed-ip-address
--description 'test deneil' \
--project deneil.yz.huang@foxconn.com_20221109 \
--subnet ca85ca51-0324-494a-9046-bf5876654516 \
API_net



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


## 要先將 subnet 家道router上面
neutron router-interface-add AMG-router-FHW-API deneil_subnet
``` bash
[root@dct-liberty-ctldb-001 ~]# neutron router-interface-add AMG-router-FHW-API deneil_subnet
Added interface c012e7fc-975a-4935-b76e-9c6dec6e9529 to router AMG-router-FHW-API.
```


neutron floatingip-associate 921982f8-4cc5-4539-bcec-f90a5e2dda62 465980b1-b915-462a-9be6-f6de8196e19d


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
...
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
...
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
...
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

