# neutron
```bash
  lbaas-agent-hosting-loadbalancer   Get lbaas v2 agent hosting a loadbalancer.
  lbaas-healthmonitor-create         LBaaS v2 Create a healthmonitor.
  lbaas-healthmonitor-delete         LBaaS v2 Delete a given healthmonitor.
  lbaas-healthmonitor-list           LBaaS v2 List healthmonitors that belong to a given tenant.
  lbaas-healthmonitor-show           LBaaS v2 Show information of a given healthmonitor.
  lbaas-healthmonitor-update         LBaaS v2 Update a given healthmonitor.
  lbaas-l7policy-create              LBaaS v2 Create L7 policy.
  lbaas-l7policy-delete              LBaaS v2 Delete a given L7 policy.
  lbaas-l7policy-list                LBaaS v2 List L7 policies that belong to a given listener.
  lbaas-l7policy-show                LBaaS v2 Show information of a given L7 policy.
  lbaas-l7policy-update              LBaaS v2 Update a given L7 policy.
  lbaas-l7rule-create                LBaaS v2 Create L7 rule.
  lbaas-l7rule-delete                LBaaS v2 Delete a given L7 rule.
  lbaas-l7rule-list                  LBaaS v2 List L7 rules that belong to a given L7 policy.
  lbaas-l7rule-show                  LBaaS v2 Show information of a given rule.
  lbaas-l7rule-update                LBaaS v2 Update a given L7 rule.
  lbaas-listener-create              LBaaS v2 Create a listener.
  lbaas-listener-delete              LBaaS v2 Delete a given listener.
  lbaas-listener-list                LBaaS v2 List listeners that belong to a given tenant.
  lbaas-listener-show                LBaaS v2 Show information of a given listener.
  lbaas-listener-update              LBaaS v2 Update a given listener.
  lbaas-loadbalancer-create          LBaaS v2 Create a loadbalancer.
  lbaas-loadbalancer-delete          LBaaS v2 Delete a given loadbalancer.
  lbaas-loadbalancer-list            LBaaS v2 List loadbalancers that belong to a given tenant.
  lbaas-loadbalancer-list-on-agent   List the loadbalancers on a loadbalancer v2 agent.
  lbaas-loadbalancer-show            LBaaS v2 Show information of a given loadbalancer.
  lbaas-loadbalancer-stats           Retrieve stats for a given loadbalancer.
  lbaas-loadbalancer-status          Retrieve status for a given loadbalancer.
  lbaas-loadbalancer-update          LBaaS v2 Update a given loadbalancer.
  lbaas-member-create                LBaaS v2 Create a member.
  lbaas-member-delete                LBaaS v2 Delete a given member.
  lbaas-member-list                  LBaaS v2 List members that belong to a given pool.
  lbaas-member-show                  LBaaS v2 Show information of a given member.
  lbaas-member-update                LBaaS v2 Update a given member.
  lbaas-pool-create                  LBaaS v2 Create a pool.
  lbaas-pool-delete                  LBaaS v2 Delete a given pool.
  lbaas-pool-list                    LBaaS v2 List pools that belong to a given tenant.
  lbaas-pool-show                    LBaaS v2 Show information of a given pool.
  lbaas-pool-update                  LBaaS v2 Update a given pool.
```

neutron help lbaas-listener-create
neutron lbaas-listener-create \
--name api-dev \
--protocol TCP \
--protocol-port 10022

neutron lbaas-member-create \
--weight 1 \
--subnet 5ada664c-6b24-4208-acb1-cd8c5133fd61 \
--address 192.168.200.50 \
--protocol-port 10022 \
60904c78-a6bc-436f-b1b8-e7a8a5584078


neutron help lbaas-member-create
neutron lbaas-member-create \
--weight 1 \
--subnet 5ada664c-6b24-4208-acb1-cd8c5133fd61 \
--address 192.168.200.12 \
--protocol-port 80 \
1ff791ce-2dd0-4554-ae1a-65f63e3cf9c0


neutron lbaas-member-list 1ff791ce-2dd0-4554-ae1a-65f63e3cf9c0

neutron lbaas-member-show c47e0ac4-769f-4b1e-bfe8-fb188821577d 1ff791ce-2dd0-4554-ae1a-65f63e3cf9c0


neutron lbaas-member-delete c47e0ac4-769f-4b1e-bfe8-fb188821577d 1ff791ce-2dd0-4554-ae1a-65f63e3cf9c0

neutron lbaas-member-update \
--name 
--weight 
MEMBER \
POOL


```bash
neutron lbaas-member-list {pool id}

curl -g -i -X GET http://osapi-fixo-6-lh.fixo.cloud:9696/v2.0/lbaas/pools/32601733-6b1e-4c1c-9c69-4668f9bd2405/members?pool_id=32601733-6b1e-4c1c-9c69-4668f9bd2405 \
curl -g -i -X GET http://osapi-fixo-6-lh.fixo.cloud:9696/v2.0/lbaas/pools/32601733-6b1e-4c1c-9c69-4668f9bd2405/members \
-H "User-Agent: python-neutronclient" \
-H "Accept: application/json" \
-H "X-Auth-Token: $token"

```


## neutron lbaas-healthmonitor-list

```bash
token=`openstack token issue | grep " id " | awk '{print $4}'`

## neutron lbaas-healthmonitor-list
curl -X GET \
192.168.60.200:9696/v2.0/lbaas/healthmonitors \
-H "User-Agent: python-neutronclient" \
-H "Accept: application/json" \
-H "X-Auth-Token: $token" | python -m json.tool
```

## neutron lbaas-loadbalancer-list 

```bash
## neutron lbaas-loadbalancer-list 
curl -X GET http://osapi.dct-tb.mtjade.cloud:9696/v2.0/lbaas/loadbalancers \
-H "User-Agent: python-neutronclient" \
-H "Accept: application/json" \
-H "X-Auth-Token: $token"
```

## neutron lbaas-pool-list  

```bash
## neutron lbaas-pool-list  
curl -X GET http://osapi.dct-tb.mtjade.cloud:9696/v2.0/lbaas/pools \
-H "User-Agent: python-neutronclient" \
-H "Accept: application/json" \
-H "X-Auth-Token: $token"

```

## neutron lbaas-listener-list

```bash
## neutron lbaas-listener-list
curl -X GET http://osapi.dct-tb.mtjade.cloud:9696/v2.0/lbaas/listeners \
-H "User-Agent: python-neutronclient" \
-H "Accept: application/json" \
-H "X-Auth-Token: $token"

```


neutron lbaas-listener-show

neutron lbaas-member-create \
--name NAME \
--weight 1 \
--subnet 5ada664c-6b24-4208-acb1-cd8c5133fd61 \
--address 192.168.200.101 \
--protocol-port 22 \
56b6687b-d982-4e96-9809-1767dcb44ec9


neutron lbaas-member-list caf7aea0-2129-40ab-86b1-d315d69a7f28
neutron lbaas-member-list 1ff791ce-2dd0-4554-ae1a-65f63e3cf9c0



```bash
neutron lbaas-pool-list
[root@dct-queens-ctl-001 ~]# neutron lbaas-pool-list
+--------------------------------------+--------------------+--------------+----------+----------------+
| id                                   | name               | lb_algorithm | protocol | admin_state_up |
+--------------------------------------+--------------------+--------------+----------+----------------+
| 1e655f44-ba49-4045-a471-6df393a36d4a | deneil-to-API-test | ROUND_ROBIN  | TCP      | True           |
| 1ff791ce-2dd0-4554-ae1a-65f63e3cf9c0 | test-horizon       | ROUND_ROBIN  | TCP      | True           |
| 4c07cb16-8cde-4dec-a107-37d297e58596 | testHTTP-crt       | ROUND_ROBIN  | HTTP     | True           |
| 7f69a506-0473-4f54-ac28-3a7771b7b808 | mirror-ftp         | ROUND_ROBIN  | HTTP     | True           |
| 8786762f-5381-4f04-a800-72e95b230c99 | mirror-ftp         | ROUND_ROBIN  | TCP      | True           |
| caf7aea0-2129-40ab-86b1-d315d69a7f28 | Pool               | ROUND_ROBIN  | TCP      | True           |
+--------------------------------------+--------------------+--------------+----------+----------------+

[root@dct-queens-ctl-001 ~]# neutron lbaas-listener-list
+--------------------------------------+--------------------------------------+------------------------+------------------+---------------+----------------+
| id                                   | default_pool_id                      | name                   | protocol         | protocol_port | admin_state_up |
+--------------------------------------+--------------------------------------+------------------------+------------------+---------------+----------------+
| 21fef3fb-f238-4fa8-b08d-cb565bb49747 | 8786762f-5381-4f04-a800-72e95b230c99 | mirror-ftp             | TCP              |          8080 | True           |
| 44fc4a51-8ca1-4965-a487-65c56bcedc4e | caf7aea0-2129-40ab-86b1-d315d69a7f28 | openstack-control-node | TCP              |            22 | True           |
| 53b65dcf-f820-405f-95b5-912c08943d50 | 4c07cb16-8cde-4dec-a107-37d297e58596 | testHTTP-crt           | TERMINATED_HTTPS |          8087 | True           |
| 789214db-daab-44c9-8665-5a7ff3b9979e | 1e655f44-ba49-4045-a471-6df393a36d4a | deneil-to-API-test     | TCP              |          8787 | True           |
| fda9d58e-6cda-4bfa-b14c-0e7edf6d1fcb | 1ff791ce-2dd0-4554-ae1a-65f63e3cf9c0 | test-horizon           | TCP              |            80 | True           |
+--------------------------------------+--------------------------------------+------------------------+------------------+---------------+----------------+
[root@dct-queens-ctl-001 ~]# 

# neutron lbaas-member-delete {member} {pool}
neutron lbaas-member-delete 40a002fd-0bbc-4281-bb00-0e488a256392 1ff791ce-2dd0-4554-ae1a-65f63e3cf9c0

## healthmonitor 需要從 neutron lbaas-pool-show <uuid> 查
neutron lbaas-healthmonitor-delete fbdbf127-6377-4fbb-ad18-a31422f681bb
neutron lbaas-pool-delete 1ff791ce-2dd0-4554-ae1a-65f63e3cf9c0
neutron lbaas-listener-delete fda9d58e-6cda-4bfa-b14c-0e7edf6d1fcb

# Load_Balancer_ID 137efcbf-3221-4aa6-a0a5-b4779656380c
# Listener_ID fda9d58e-6cda-4bfa-b14c-0e7edf6d1fcb
# Pool_ID 1ff791ce-2dd0-4554-ae1a-65f63e3cf9c0
# Health_Monitor_ID fbdbf127-6377-4fbb-ad18-a31422f681bb
# lbaas-member-ID 40a002fd-0bbc-4281-bb00-0e488a256392




# Pool_ID ad33167f-1102-4b00-baab-c16d5ccae2f1
neutron lbaas-pool-show ad33167f-1102-4b00-baab-c16d5ccae2f1



neutron lbaas-member-create \
--weight 1 \
--subnet 5ada664c-6b24-4208-acb1-cd8c5133fd61 \
--address 192.168.200.12 \
--protocol-port 80 \
ad33167f-1102-4b00-baab-c16d5ccae2f1


lbaas-listener-id 1d8b8768-4de1-4aca-a8c5-1b7d1a15db1d
default_pool_id ad33167f-1102-4b00-baab-c16d5ccae2f1

 32 frontend 1d8b8768-4de1-4aca-a8c5-1b7d1a15db1d
 33     option tcplog
 34     option forwardfor
 35     bind 192.168.200.100:80
 36     mode http
 37     default_backend ad33167f-1102-4b00-baab-c16d5ccae2f1
... 
 83 
 84 backend ad33167f-1102-4b00-baab-c16d5ccae2f1
 85     mode http
 86     balance roundrobin
 87     timeout check 5s
 88     server 9275870b-bb37-4c06-addc-c064205e1ef4 192.168.200.12:80 weight 1 check inter 5s fall 3
 89 


vim /etc/httpd/conf/httpd.conf


LogFormat "%h %l %u %t \"%r\" %>s %b \"%{Referer}i\" \"%{User-Agent}i\"" combined
LogFormat "%h %l %u %t \"%r\" %>s %b" common

LogFormat "%h %l %u %t \"%r\" %>s %b \"%{Referer}i\" \"%{User-Agent}i\" %I %O" combinedio

修改成以下字串

LogFormat "%{X-Forwarded-For}i %h %l %u %t \"%r\" %>s %b \"%{Referer}i\" \"%{User-Agent}i\"" combined
LogFormat "%{X-Forwarded-For}i %h %l %u %t \"%r\" %>s %b" common

LogFormat "%{X-Forwarded-For}i %h %l %u %t \"%r\" %>s %b \"%{Referer}i\" \"%{User-Agent}i\" %I %O" combinedio


<IfModule log_config_module>
    #
    # The following directives define some format nicknames for use with
    # a CustomLog directive (see below).
    #
    LogFormat "%h %l %u %t \"%r\" %>s %b \"%{Referer}i\" \"%{User-Agent}i\"" combined
    LogFormat "%h %l %u %t \"%r\" %>s %b" common

    <IfModule logio_module>
      # You need to enable mod_logio.c to use %I and %O
      LogFormat "%h %l %u %t \"%r\" %>s %b \"%{Referer}i\" \"%{User-Agent}i\" %I %O" combinedio
    </IfModule>



## 嘗試修改 pool 協定 from tcp to http
# neutron lbaas-pool-update -h
# neutron lbaas-pool-create -h
neutron lbaas-pool-update
結論 >>> 沒辦法修改protocol or tcp port


 32 frontend fda9d58e-6cda-4bfa-b14c-0e7edf6d1fcb
 33     option tcplog
 34     maxconn 2000
 35     bind 192.168.200.100:80
 36     mode tcp
 37     default_backend 1ff791ce-2dd0-4554-ae1a-65f63e3cf9c0


```


[root@dct-queens-ctl-001 ~]# neutron lbaas-loadbalancer-list
neutron CLI is deprecated and will be removed in the future. Use openstack CLI instead.
+--------------------------------------+---------------------+-----------------+---------------------+----------+---------+
| id                                   | name                | vip_address     | provisioning_status | provider | timeout |
+--------------------------------------+---------------------+-----------------+---------------------+----------+---------+
| 137efcbf-3221-4aa6-a0a5-b4779656380c | deneil-test-FHW-LBS | 192.168.200.100 | ACTIVE              | haproxy  | 3600000 |
+--------------------------------------+---------------------+-----------------+---------------------+----------+---------+



```bash

[root@dct-queens-ctl-001 deneil-dev]# neutron lbaas-loadbalancer-list 
neutron CLI is deprecated and will be removed in the future. Use openstack CLI instead.
+--------------------------------------+-----------------+---------------+---------------------+----------+---------+
| id                                   | name            | vip_address   | provisioning_status | provider | timeout |
+--------------------------------------+-----------------+---------------+---------------------+----------+---------+
| 8bc74f69-4865-41e9-ad26-a8a27ea8a575 | deneil-test-LBS | 192.168.77.13 | ACTIVE              | haproxy  |  300000 |
+--------------------------------------+-----------------+---------------+---------------------+----------+---------+

[root@dct-queens-ctl-001 deneil-dev]# neutron lbaas-listener-list
neutron CLI is deprecated and will be removed in the future. Use openstack CLI instead.
+--------------------------------------+--------------------------------------+-------------------+----------+---------------+----------------+
| id                                   | default_pool_id                      | name              | protocol | protocol_port | admin_state_up |
+--------------------------------------+--------------------------------------+-------------------+----------+---------------+----------------+
| 3fda39d2-b57d-40cd-8353-4b629be3a628 | 595589dd-10c5-4170-9202-fccada384ee6 | ssh-test-listener | TCP      |          8787 | True           |
+--------------------------------------+--------------------------------------+-------------------+----------+---------------+----------------+



```

```bash
neutron lbaas-pool-list

[root@dct-queens-ctl-001 deneil-dev]# neutron lbaas-pool-list
neutron CLI is deprecated and will be removed in the future. Use openstack CLI instead.
+--------------------------------------+--------+-------------------+----------+----------------+
| id                                   | name   | lb_algorithm      | protocol | admin_state_up |
+--------------------------------------+--------+-------------------+----------+----------------+
| 90ba46fe-24ce-400e-9702-fc0c395c5bdc | Pool 1 | LEAST_CONNECTIONS | TCP      | True           |
+--------------------------------------+--------+-------------------+----------+----------------+

[root@dct-queens-ctl-001 deneil-dev]# neutron lbaas-pool-show 90ba46fe-24ce-400e-9702-fc0c395c5bdc
neutron CLI is deprecated and will be removed in the future. Use openstack CLI instead.
+---------------------+------------------------------------------------+
| Field               | Value                                          |
+---------------------+------------------------------------------------+
| admin_state_up      | True                                           |
| description         |                                                |
| healthmonitor_id    | 25d3e38e-3cc6-46fe-8555-78bf3a057346           |
| id                  | 90ba46fe-24ce-400e-9702-fc0c395c5bdc           |
| lb_algorithm        | LEAST_CONNECTIONS                              |
| listeners           | {"id": "a3792481-2b42-4bc9-a8ea-e1203c63ba9c"} |
| loadbalancers       | {"id": "8bc74f69-4865-41e9-ad26-a8a27ea8a575"} |
| members             | f7e936ff-1c0a-44ba-afd8-28552ecb23bf           |
|                     | ec735e26-86be-4c1a-93b2-2c223afe9614           |
| name                | Pool 1                                         |
| protocol            | TCP                                            |
| session_persistence |                                                |
| tenant_id           | cfdc857f42274e2ea6b30dd844e23ca5               |
+---------------------+------------------------------------------------+


```



neutron lbaas-pool-show 90ba46fe-24ce-400e-9702-fc0c395c5bdc


```bash
token=`openstack token issue | grep " id " | awk '{print $4}'`
neutron lbaas-loadbalancer-list
curl -g -i -X GET http://osapi-fixo-6-lh.fixo.cloud:9696/v2.0/lbaas/loadbalancers \
-H "User-Agent: python-neutronclient" \
-H "Accept: application/json" \
-H "X-Auth-Token: $token"


[root@lh-testbed-control-001 ~]# neutron lbaas-loadbalancer-list
+--------------------------------------+--------------------------------------------------------------------------------+-----------------+---------------------+----------+
| id                                   | name                                                                           | vip_address     | provisioning_status | provider |
+--------------------------------------+--------------------------------------------------------------------------------+-----------------+---------------------+----------+
| 02088364-9435-4502-a7db-e843801da5dd | deneilpsdsingle0627-docqkpus7yv2-api_lb-irus4mqpnthv-loadbalancer-prbu2ssvgxdb | 192.168.120.19  | ACTIVE              | haproxy  |
| 2c8fb980-a205-4cdc-9893-7202abb676a9 | deneilk8s062702-wkwa4miuuwn5-api_lb-stsazgdsu4gh-loadbalancer-7tsa4l46xr2v     | 192.168.120.12  | ACTIVE              | haproxy  |
| 63c48b94-a029-426f-a1eb-2758cd03ef62 | deneiltestpsd2-puegynmug6qk-api_lb-uk7kp5ielwzm-loadbalancer-v43qo2eni76f      | 192.168.120.25  | ACTIVE              | haproxy  |
| 6c5c62ad-d92e-4541-9f67-4545d0c3101e | deneilpsdha0627-lvnrbx3eqi5f-api_lb-m53esas3drou-loadbalancer-erlrj44j5s75     | 192.168.120.4   | ACTIVE              | haproxy  |
| 8073d2bf-fce6-4613-bdeb-cc9a2c5f4abf | deneilk8s062702-wkwa4miuuwn5-etcd_lb-o3ob7uqa67by-loadbalancer-e5zc3wn4yomb    | 192.168.120.10  | ACTIVE              | haproxy  |
| 87238259-6a0b-44c0-9550-5fdb010fbb7c | deneil-test-LBS                                                                | 192.168.120.200 | ACTIVE              | haproxy  |
+--------------------------------------+--------------------------------------------------------------------------------+-----------------+---------------------+----------+



## http://osapi-fixo-6-lh.fixo.cloud:9696/v2.0/lbaas/listeners
neutron lbaas-listener-list

curl -g -i -X GET http://osapi-fixo-6-lh.fixo.cloud:9696/v2.0/lbaas/listeners \
-H "User-Agent: python-neutronclient" \
-H "Accept: application/json" \
-H "X-Auth-Token: $token"

[root@lh-testbed-control-001 ~]# neutron lbaas-listener-list
+--------------------------------------+--------------------------------------+----------------------------------------------------------------------------+----------+---------------+----------------+
| id                                   | default_pool_id                      | name                                                                       | protocol | protocol_port | admin_state_up |
+--------------------------------------+--------------------------------------+----------------------------------------------------------------------------+----------+---------------+----------------+
| 1a2b0edc-1253-445b-8352-8ca3c4f1c355 | 068cf78a-613a-4c75-9e22-b56fb5cd615b | deneiltestpsd2-puegynmug6qk-api_lb-uk7kp5ielwzm-listener-qlfpy6fqsddg      | TCP      |           443 | True           |
| 32c3eac3-7110-47fe-bb91-608b83c35f89 | 20aa7166-2afd-452e-9c33-9e7263058b88 | deneilk8s062702-wkwa4miuuwn5-etcd_lb-o3ob7uqa67by-listener-3wke7fps2mgd    | TCP      |          2379 | True           |
| 3a63362a-9ace-4676-8a8b-63560f71d127 | 5d3fc355-b152-4f35-a90d-ffd306db3e65 | test-k8s-dashboard                                                         | TCP      |            80 | True           |
| 9470afcc-1b31-42f8-af34-c91624f8170e | 19975dd0-2ae2-466b-9333-5ca807b7759c | deneilpsdha0627-lvnrbx3eqi5f-api_lb-m53esas3drou-listener-2fkcdp3dnthc     | TCP      |           443 | True           |
| 9d1733f7-c9da-450a-bcb0-03978dc1cf02 | 9a5346f4-5885-436f-b1ed-a2392b326b46 | deneilk8s062702-wkwa4miuuwn5-api_lb-stsazgdsu4gh-listener-b36zyhvrrbwe     | TCP      |          6443 | True           |
| a409b77f-3a2e-4673-898a-39c80ef0d49e | 48f10e10-9086-4688-a1de-bd663fa7b688 | ssh-test-listener                                                          | TCP      |            22 | True           |
| be096d7a-0f98-40bf-99a7-2d0cde72b34f | f3865152-4258-4b33-8d33-542c8ecf3492 | deneilpsdsingle0627-docqkpus7yv2-api_lb-irus4mqpnthv-listener-smdynp6wan2z | TCP      |           443 | True           |
+--------------------------------------+--------------------------------------+----------------------------------------------------------------------------+----------+---------------+----------------+


neutron lbaas-member-list {pool}

neutron lbaas-member-list 19975dd0-2ae2-466b-9333-5ca807b7759c

token=`openstack token issue | grep " id " | awk '{print $4}'`

curl -g -i -X GET http://osapi-fixo-6-lh.fixo.cloud:9696/v2.0/lbaas/pools/19975dd0-2ae2-466b-9333-5ca807b7759c/members \
-H "User-Agent: python-neutronclient" \
-H "Accept: application/json" \
-H "X-Auth-Token: $token"


[root@lh-testbed-control-001 ~]# neutron lbaas-member-list f3865152-4258-4b33-8d33-542c8ecf3492
+--------------------------------------+--------------------------------------------------------------------------------------------------------+----------------+---------------+--------+--------------------------------------+----------------+
| id                                   | name                                                                                                   | address        | protocol_port | weight | subnet_id                            | admin_state_up |
+--------------------------------------+--------------------------------------------------------------------------------------------------------+----------------+---------------+--------+--------------------------------------+----------------+
| 65200899-76fa-4c3b-bb2b-0eed6a853a3f | deneilpsdsingle0627-docqkpus7yv2-kube_masters-heigd25td3yb-0-2dkuc4mpc6kq-api_pool_member-pdzwvojbhrbz | 192.168.120.16 |         30443 |      1 | b755546e-ff4d-418d-9f28-59a389478a14 | True           |
+--------------------------------------+--------------------------------------------------------------------------------------------------------+----------------+---------------+--------+--------------------------------------+----------------+

neutron lbaas-member-delete {member} {pool}
neutron --debug lbaas-member-delete 65200899-76fa-4c3b-bb2b-0eed6a853a3f f3865152-4258-4b33-8d33-542c8ecf3492


# 9696/v2.0/lbaas/pools/{pool_id}/members/{member_id}
curl -g -i -X DELETE http://osapi-fixo-6-lh.fixo.cloud:9696/v2.0/lbaas/pools/f3865152-4258-4b33-8d33-542c8ecf3492/members/65200899-76fa-4c3b-bb2b-0eed6a853a3f \
-H "User-Agent: python-neutronclient" \
-H "Accept: application/json" \
-H "X-Auth-Token: $token"



### delete pool
neutron --debug lbaas-pool-delete f3865152-4258-4b33-8d33-542c8ecf3492

token=`openstack token issue | grep " id " | awk '{print $4}'`

curl -g -i -X DELETE http://osapi-fixo-6-lh.fixo.cloud:9696/v2.0/lbaas/pools/f3865152-4258-4b33-8d33-542c8ecf3492 \
-H "User-Agent: python-neutronclient" \
-H "Accept: application/json" \
-H "X-Auth-Token: $token"
{"NeutronError": {"message": "healthmonitor 40dc9b88-f959-42fb-bf7e-de9e7e185c6d is using this pool", "type": "EntityInUse", "detail": ""}}


neutron lbaas-healthmonitor-list

neutron --debug lbaas-healthmonitor-delete 40dc9b88-f959-42fb-bf7e-de9e7e185c6d
curl -g -i -X DELETE http://osapi-fixo-6-lh.fixo.cloud:9696/v2.0/lbaas/healthmonitors/40dc9b88-f959-42fb-bf7e-de9e7e185c6d \
-H "User-Agent: python-neutronclient" \
-H "Accept: application/json" \
-H "X-Auth-Token: $token"


neutron --debug lbaas-listener-delete be096d7a-0f98-40bf-99a7-2d0cde72b34f
curl -g -i -X DELETE http://osapi-fixo-6-lh.fixo.cloud:9696/v2.0/lbaas/listeners/be096d7a-0f98-40bf-99a7-2d0cde72b34f \
-H "User-Agent: python-neutronclient" \
-H "Accept: application/json" \
-H "X-Auth-Token: $token"


neutron lbaas-loadbalancer-list

neutron --debug lbaas-loadbalancer-delete 02088364-9435-4502-a7db-e843801da5dd
curl -g -i -X DELETE http://osapi-fixo-6-lh.fixo.cloud:9696/v2.0/lbaas/loadbalancers/02088364-9435-4502-a7db-e843801da5dd \
-H "User-Agent: python-neutronclient" \
-H "Accept: application/json" \
-H "X-Auth-Token: $token"




  lbaas-agent-hosting-loadbalancer   Get lbaas v2 agent hosting a loadbalancer.
  lbaas-healthmonitor-create         LBaaS v2 Create a healthmonitor.
  lbaas-healthmonitor-delete         LBaaS v2 Delete a given healthmonitor.
  lbaas-healthmonitor-list           LBaaS v2 List healthmonitors that belong to a given tenant.
  lbaas-healthmonitor-show           LBaaS v2 Show information of a given healthmonitor.
  lbaas-healthmonitor-update         LBaaS v2 Update a given healthmonitor.
  lbaas-l7policy-create              LBaaS v2 Create L7 policy.
  lbaas-l7policy-delete              LBaaS v2 Delete a given L7 policy.
  lbaas-l7policy-list                LBaaS v2 List L7 policies that belong to a given listener.
  lbaas-l7policy-show                LBaaS v2 Show information of a given L7 policy.
  lbaas-l7policy-update              LBaaS v2 Update a given L7 policy.
  lbaas-l7rule-create                LBaaS v2 Create L7 rule.
  lbaas-l7rule-delete                LBaaS v2 Delete a given L7 rule.
  lbaas-l7rule-list                  LBaaS v2 List L7 rules that belong to a given L7 policy.
  lbaas-l7rule-show                  LBaaS v2 Show information of a given rule.
  lbaas-l7rule-update                LBaaS v2 Update a given L7 rule.
  lbaas-listener-create              LBaaS v2 Create a listener.
  lbaas-listener-delete              LBaaS v2 Delete a given listener.
  lbaas-listener-list                LBaaS v2 List listeners that belong to a given tenant.
  lbaas-listener-show                LBaaS v2 Show information of a given listener.
  lbaas-listener-update              LBaaS v2 Update a given listener.
  lbaas-loadbalancer-create          LBaaS v2 Create a loadbalancer.
  lbaas-loadbalancer-delete          LBaaS v2 Delete a given loadbalancer.
  lbaas-loadbalancer-list            LBaaS v2 List loadbalancers that belong to a given tenant.
  lbaas-loadbalancer-list-on-agent   List the loadbalancers on a loadbalancer v2 agent.
  lbaas-loadbalancer-show            LBaaS v2 Show information of a given loadbalancer.
  lbaas-loadbalancer-stats           Retrieve stats for a given loadbalancer.
  lbaas-loadbalancer-status          Retrieve status for a given loadbalancer.
  lbaas-loadbalancer-update          LBaaS v2 Update a given loadbalancer.
  lbaas-member-create                LBaaS v2 Create a member.
  lbaas-member-delete                LBaaS v2 Delete a given member.
  lbaas-member-list                  LBaaS v2 List members that belong to a given pool.
  lbaas-member-show                  LBaaS v2 Show information of a given member.
  lbaas-member-update                LBaaS v2 Update a given member.
  lbaas-pool-create                  LBaaS v2 Create a pool.
  lbaas-pool-delete                  LBaaS v2 Delete a given pool.
  lbaas-pool-list                    LBaaS v2 List pools that belong to a given tenant.
  lbaas-pool-show                    LBaaS v2 Show information of a given pool.
  lbaas-pool-update                  LBaaS v2 Update a given pool.




```







