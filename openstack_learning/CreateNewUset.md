
## projects, users, and roles 


# create new project
openstack project create --description 'project created  by deneil' deneil_test_project --domain default

```bash
[root@dct-liberty-ctldb-001 ~]# openstack project create --description 'project created  by deneil' deneil_test_project --domain default
+-------------+----------------------------------+
| Field       | Value                            |
+-------------+----------------------------------+
| description | project created  by deneil       |
| domain_id   | default                          |
| enabled     | True                             |
| id          | fb8b0121b8b34478b63584429e64ac91 |
| is_domain   | False                            |
| name        | deneil_test_project              |
| parent_id   | None                             |
+-------------+----------------------------------+
```


openstack project show fb8b0121b8b34478b63584429e64ac91


## create user
openstack user create --project deneil_test_project --password deneil_test_password deneil

```bash
+-------------+----------------------------------+
[root@dct-liberty-ctldb-001 ~]# openstack user create --project deneil_test_project --password deneil_test_password deneil
+--------------------+----------------------------------+
| Field              | Value                            |
+--------------------+----------------------------------+
| default_project_id | fb8b0121b8b34478b63584429e64ac91 |
| domain_id          | default                          |
| enabled            | True                             |
| id                 | e2fc7d0f50f94ab0b9490ce006ef033d |
| name               | deneil                           |
+--------------------+----------------------------------+
```


## create roles
openstack role create deneil-test
```bash
[root@dct-liberty-ctldb-001 ~]# openstack role create deneil-test
+-------+----------------------------------+
| Field | Value                            |
+-------+----------------------------------+
| id    | 29d124f1f7c547bca9bf96681459fb04 |
| name  | deneil-test                      |
+-------+----------------------------------+
```

openstack role add --user deneil --project deneil_test_project deneil-test
openstack role add --user deneil --project admin deneil-test

## Verify the role assignment:
openstack role assignment list --user deneil --project fb8b0121b8b34478b63584429e64ac91 

openstack role assignment list --user deneil \

```bash
[root@dct-liberty-ctldb-001 ~]# openstack role assignment list --user deneil
+----------------------------------+----------------------------------+-------+----------------------------------+--------+-----------+
| Role                             | User                             | Group | Project                          | Domain | Inherited |
+----------------------------------+----------------------------------+-------+----------------------------------+--------+-----------+
| 29d124f1f7c547bca9bf96681459fb04 | e2fc7d0f50f94ab0b9490ce006ef033d |       | b2afa04057b94e79a7526b834c65e903 |        | False     |
| 29d124f1f7c547bca9bf96681459fb04 | e2fc7d0f50f94ab0b9490ce006ef033d |       | fb8b0121b8b34478b63584429e64ac91 |        | False     |
+----------------------------------+----------------------------------+-------+----------------------------------+--------+-----------+





[root@dct-queens-ctl-001 deneil-dev]# openstack user list | grep "deneil"
| 1e4c99ca5b2a4fcd98d3663e8e10228a | deneil.yz.huang@foxconn.com_674e  


openstack role assignment list --user 1e4c99ca5b2a4fcd98d3663e8e10228a


openstack role add --user admin --project 767031bf35c949d2a168af493a66ebe0 admin
openstack role add --user user --project 767031bf35c949d2a168af493a66ebe0 creator




```


### testBed L user login file 
```bash
export OS_PROJECT_DOMAIN_ID=default
export OS_USER_DOMAIN_ID=default
export OS_PROJECT_NAME=deneil_test_project
export OS_USERNAME=deneil
export OS_PASSWORD=deneil_test_password
export OS_AUTH_URL=http://192.168.9.100:35357/v3
export OS_IDENTITY_API_VERSION=3
export OS_IMAGE_API_VERSION=2
export OS_AUTH_VERSION=3
export OS_REGION_NAME=RegionOne
```







```bash
[root@dct-liberty-ctldb-001 ~]#  openstack project list
+----------------------------------+------------------+
| ID                               | Name             |
+----------------------------------+------------------+
| 078fd50c5995448f9237f06b65fb6979 | swift@test.com   |
| 19cf7ed621084cb5ae9134188005a14c | john@test.com    |
| abba6fec773e402f91d2ebc102955874 | DCaS@test.com    |
| b2afa04057b94e79a7526b834c65e903 | admin            |
| d1dc44d083b643dfab25aff622a99716 | limit_test       |
| d3fbd1a4c1de4608b44bae75b133a6de | service          |
| d94a2c6421ef4eae8136ed2af8719d7c | storage@test.com |
+----------------------------------+------------------+
```

```bash
[root@dct-liberty-ctldb-001 ~]#  openstack role list
+----------------------------------+------------------+
| ID                               | Name             |
+----------------------------------+------------------+
| 08cc839252f54fdc890649a93d0d3320 | user             |
| 13f8b9c069d4454581ce8dfecb53089e | fico_manager     |
| 1d7a8da5c68340e28476632f49d93bf5 | rdsuser          |
| 211951d4ac4742ea810801dd0b68ea2e | project_manager  |
| 6ac098b7442e493d839ab7503c79acbb | lbsuser          |
| 84ce67ede770489db4afb698d935bddc | admin            |
| 885016cef7fb44d09752a224e176333e | Member           |
| 9fe2ff9ee4384b1894a90878d3e92bab | _member_         |
| a148a7663b3342bdb5022713084429ae | project_viewer   |
| ab5687c9b57544efba371adac3d69c95 | swiftuser        |
| c5acd174c7114f97ba95a9e2198dd182 | heat_stack_user  |
| df8c553a22ce422b9f1d25fa2a05bcb8 | heat_stack_owner |
+----------------------------------+------------------+
```









```bash
[root@dct-liberty-ctldb-001 hu.deneil-dev]# ifconfig
bond23: flags=5187<UP,BROADCAST,RUNNING,MASTER,MULTICAST>  mtu 1500
        inet6 fe80::5265:f3ff:fe6b:f9ef  prefixlen 64  scopeid 0x20<link>
        ether 50:65:f3:6b:f9:ef  txqueuelen 1000  (Ethernet)
        RX packets 91574714404  bytes 29744526308050 (27.0 TiB)
        RX errors 0  dropped 87  overruns 0  frame 0
        TX packets 90983871660  bytes 38732288481571 (35.2 TiB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

bond23.518: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 192.168.8.8  netmask 255.255.255.0  broadcast 192.168.8.255
        inet6 fe80::5265:f3ff:fe6b:f9ef  prefixlen 64  scopeid 0x20<link>
        ether 50:65:f3:6b:f9:ef  txqueuelen 1000  (Ethernet)
        RX packets 83982528  bytes 40926641941 (38.1 GiB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 13138141  bytes 29713536161 (27.6 GiB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

bond23.519: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet6 fe80::5265:f3ff:fe6b:f9ef  prefixlen 64  scopeid 0x20<link>
        ether 50:65:f3:6b:f9:ef  txqueuelen 1000  (Ethernet)
        RX packets 84206136352  bytes 28010154274592 (25.4 TiB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 78434332857  bytes 37875059082010 (34.4 TiB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

br_manage: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 172.16.16.24  netmask 255.255.255.0  broadcast 172.16.16.255
        inet6 fe80::50db:87ff:fe55:4246  prefixlen 64  scopeid 0x20<link>
        ether 50:65:f3:6b:f9:ee  txqueuelen 1000  (Ethernet)
        RX packets 535056417  bytes 140672792163 (131.0 GiB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 429421460  bytes 1446326304066 (1.3 TiB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

br_openstack: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 192.168.9.200  netmask 255.255.255.0  broadcast 192.168.9.255
        inet6 fe80::9c7c:ecff:fe13:3940  prefixlen 64  scopeid 0x20<link>
        ether 50:65:f3:6b:f9:ef  txqueuelen 1000  (Ethernet)
        RX packets 84205918773  bytes 28009887030831 (25.4 TiB)
        RX errors 0  dropped 58  overruns 0  frame 0
        TX packets 78434343367  bytes 37875059959554 (34.4 TiB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

eth10g1: flags=6211<UP,BROADCAST,RUNNING,SLAVE,MULTICAST>  mtu 1500
        ether 50:65:f3:6b:f9:ef  txqueuelen 1000  (Ethernet)
        RX packets 44044862177  bytes 14037446361640 (12.7 TiB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 44410739159  bytes 19389855394270 (17.6 TiB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

eth10g2: flags=6211<UP,BROADCAST,RUNNING,SLAVE,MULTICAST>  mtu 1500
        ether 50:65:f3:6b:f9:ef  txqueuelen 1000  (Ethernet)
        RX packets 47529852238  bytes 15707079950288 (14.2 TiB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 46573132511  bytes 19342433089417 (17.5 TiB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

eth1g2: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet6 fe80::5265:f3ff:fe6b:f9ee  prefixlen 64  scopeid 0x20<link>
        ether 50:65:f3:6b:f9:ee  txqueuelen 1000  (Ethernet)
        RX packets 574880322  bytes 151323481050 (140.9 GiB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 1313972256  bytes 1504576749091 (1.3 TiB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
        device memory 0xdfb00000-dfb1ffff

lo: flags=73<UP,LOOPBACK,RUNNING>  mtu 65536
        inet 127.0.0.1  netmask 255.0.0.0
        inet6 ::1  prefixlen 128  scopeid 0x10<host>
        loop  txqueuelen 1  (Local Loopback)
        RX packets 1752708234  bytes 1232653289535 (1.1 TiB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 1752708234  bytes 1232653289535 (1.1 TiB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
```









```bash
[root@dct-queens-ctl-001 ~]# openstack user show c5310ad3c3624f59ba8e46bdd3aeba44
+---------------------+----------------------------------+
| Field               | Value                            |
+---------------------+----------------------------------+
| domain_id           | default                          |
| email               | 833453                           |
| enabled             | True                             |
| id                  | c5310ad3c3624f59ba8e46bdd3aeba44 |
| name                | 833453_jaSa                      |
| options             | {}                               |
| password_expires_at | None                             |
| register_time       | 2022-11-07 10:27:47              |
+---------------------+----------------------------------+
```


```bash
[root@dct-queens-ctl-001 ~]# openstack role assignment list --user c5310ad3c3624f59ba8e46bdd3aeba44
+----------------------------------+----------------------------------+-------+----------------------------------+--------+-----------+
| Role                             | User                             | Group | Project                          | Domain | Inherited |
+----------------------------------+----------------------------------+-------+----------------------------------+--------+-----------+
| 15d7963fd7d544bbbff170eba112d538 | c5310ad3c3624f59ba8e46bdd3aeba44 |       | 73704f0794ea454ca53d8aea41b9473d |        | False     |
| 26f9f58d98b74eac83b32dfd7435d847 | c5310ad3c3624f59ba8e46bdd3aeba44 |       | 73704f0794ea454ca53d8aea41b9473d |        | False     |
| 4333dc8ab839436698993ffdd6b03c8d | c5310ad3c3624f59ba8e46bdd3aeba44 |       | 73704f0794ea454ca53d8aea41b9473d |        | False     |
| 4980dbcc585b4438b02cf5ffccc35021 | c5310ad3c3624f59ba8e46bdd3aeba44 |       | 73704f0794ea454ca53d8aea41b9473d |        | False     |
| 53da837c0d5848cb94311aa27ab48912 | c5310ad3c3624f59ba8e46bdd3aeba44 |       | 73704f0794ea454ca53d8aea41b9473d |        | False     |
| 547fadd044474c2081d28d8a24b453be | c5310ad3c3624f59ba8e46bdd3aeba44 |       | 73704f0794ea454ca53d8aea41b9473d |        | False     |
| 58778f868a8448748ab90ba248ef08dd | c5310ad3c3624f59ba8e46bdd3aeba44 |       | 73704f0794ea454ca53d8aea41b9473d |        | False     |
| 76c477fd0f8f489488cd2b594298c332 | c5310ad3c3624f59ba8e46bdd3aeba44 |       | 73704f0794ea454ca53d8aea41b9473d |        | False     |
| 875c505c3c8041c4bef080fb7f6a78e9 | c5310ad3c3624f59ba8e46bdd3aeba44 |       | 73704f0794ea454ca53d8aea41b9473d |        | False     |
| 9896f7f4d77a40d7a3d7b75227a0452a | c5310ad3c3624f59ba8e46bdd3aeba44 |       | 73704f0794ea454ca53d8aea41b9473d |        | False     |
| 9defbe9723d04383b21af05cd4f1e7ff | c5310ad3c3624f59ba8e46bdd3aeba44 |       | 73704f0794ea454ca53d8aea41b9473d |        | False     |
| 9fe2ff9ee4384b1894a90878d3e92bab | c5310ad3c3624f59ba8e46bdd3aeba44 |       | 73704f0794ea454ca53d8aea41b9473d |        | False     |
| bf3aeab63cab4659b9eb4fb685073866 | c5310ad3c3624f59ba8e46bdd3aeba44 |       | 73704f0794ea454ca53d8aea41b9473d |        | False     |
| c7b60ef39eee4f849a4c20e384b69b80 | c5310ad3c3624f59ba8e46bdd3aeba44 |       | 73704f0794ea454ca53d8aea41b9473d |        | False     |
| d76a45216d5b4b3ca7e055633f743768 | c5310ad3c3624f59ba8e46bdd3aeba44 |       | 73704f0794ea454ca53d8aea41b9473d |        | False     |
| e1d09e097aea4e47800a4dc9cf5b7031 | c5310ad3c3624f59ba8e46bdd3aeba44 |       | 73704f0794ea454ca53d8aea41b9473d |        | False     |
+----------------------------------+----------------------------------+-------+----------------------------------+--------+-----------+
```


```bash
[root@dct-queens-ctl-001 ~]# openstack project show 73704f0794ea454ca53d8aea41b9473d
+-------------+----------------------------------+
| Field       | Value                            |
+-------------+----------------------------------+
| category    | tenant                           |
| description | jaSauhOUPFs                      |
| domain_id   | default                          |
| enabled     | True                             |
| id          | 73704f0794ea454ca53d8aea41b9473d |
| is_domain   | False                            |
| name        | 833453_20221107                  |
| parent_id   | default                          |
| ssoid       | jaSauhOUPFs                      |
| ssotype     | dcas-entry                       |
| tags        | [u'dcas-entry']                  |
+-------------+----------------------------------+
```


```bash
[root@dct-queens-ctl-001 ~]# cat admin-openrc.sh
export OS_PROJECT_DOMAIN_ID=default
export OS_USER_DOMAIN_ID=default
export OS_PROJECT_NAME=833453_20221107
export OS_USERNAME=833453_jaSa
export OS_PASSWORD=admin_foxconn
export OS_AUTH_URL=http://192.168.60.200:35357/v3
export OS_IDENTITY_API_VERSION=3
export OS_IMAGE_API_VERSION=2
export OS_AUTH_VERSION=3
export OS_AUTH_TYPE=password
export OS_REGION_NAME=RegionOne
```



```bash
[root@dct-queens-ctl-001 ~]# cat admin-openrc.sh
export OS_PROJECT_DOMAIN_ID=default
export OS_USER_DOMAIN_ID=default
export OS_PROJECT_NAME=admin
export OS_USERNAME=admin
export OS_PASSWORD=admin_foxconn
export OS_AUTH_URL=http://192.168.60.200:35357/v3
export OS_IDENTITY_API_VERSION=3
export OS_IMAGE_API_VERSION=2
export OS_AUTH_VERSION=3
export OS_AUTH_TYPE=password
export OS_REGION_NAME=RegionOne
```
