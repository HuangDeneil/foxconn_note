
## test

```bash

[root@dct-queens-ctl-001 ~]# openstack project list | grep deneil-test-purge-20230531
| 5a54b3853491478ead28060213c857c4 | deneil-test-purge-20230531                                       |

[root@dct-queens-ctl-001 ~]#  openstack project purge --dry-run --project 5a54b3853491478ead28060213c857c4
Deleting server : e0c72865-af29-40c8-b734-dcb240893603
Deleting server : 1040452b-2249-4352-81a5-5c947359438f
Deleting volume : 0036479c-a9d6-4c6c-97f1-71c4a90c9674
Deleting volume : f7128a43-87c3-4492-a1dd-4b85868abca4
Deleting volume : 4c0f31a0-b2ea-4ae1-bdc3-d590c2727f52
Deleting volume : 7b3bf8b6-1254-4626-a9ef-6fe8eed79923
Deleting volume : 3c775287-bd88-4024-a442-9335d61ad56f
Deleting project: 5a54b3853491478ead28060213c857c4
[root@dct-queens-ctl-001 ~]#
[root@dct-queens-ctl-001 ~]# openstack project list | grep deneil-test-purge-20230531
| 5a54b3853491478ead28060213c857c4 | deneil-test-purge-20230531


openstack project purge --project 5a54b3853491478ead28060213c857c4

## Step1: 列出項目的資源 
openstack project purge --dry-run --project 5a54b3853491478ead28060213c857c4

## Step2: 使用清理項目資源，但不刪除項目指令，依然 Failed to delete volume
openstack project purge --keep-project --project 5a54b3853491478ead28060213c857c4

## Step3: 確認目前項目的資源: server已被清除
openstack project purge --dry-run --project 5a54b3853491478ead28060213c857c4

## Step4: 再次使用清理指令，可成功清理 volume
openstack project purge --keep-project --project 5a54b3853491478ead28060213c857c4

## Step5: 確認目前項目的資源
openstack project purge --dry-run --project 5a54b3853491478ead28060213c857c4

```

## `openstack project purge --dry-run --project 5a54b3853491478ead28060213c857c4 --debug` 追蹤 api workflow

```bash
token=`openstack token issue | grep "| id" | awk '{print $4}'`

## keystone
curl -g -i -X GET http://192.168.60.200:35357/v3 -H "Accept: application/json" -H "User-Agent: osc-lib/1.9.0 keystoneauth1/3.4.1 python-requests/2.14.2 CPython/2.7.5"
curl -g -i -X GET http://192.168.60.200:35357/v3/projects/5a54b3853491478ead28060213c857c4 -H "User-Agent: python-keystoneclient" -H "Accept: application/json" -H "X-Auth-Token: $token"

## nova
curl -g -i -X GET http://osapi.dct-tb.mtjade.cloud:8774/v2.1/servers/detail?all_tenants=True&tenant_id=5a54b3853491478ead28060213c857c4 \
-H "User-Agent: python-novaclient" \
-H "Accept: application/json" \
-H "X-Auth-Token: $token"

## glance images
curl -g -i -X GET http://osapi.dct-tb.mtjade.cloud:9292/v2/images?owner=5a54b3853491478ead28060213c857c4&limit=20 \
-H 'Accept-Encoding: gzip, deflate' \
-H 'Accept: */*' -H 'User-Agent: python-glanceclient' \
-H 'Connection: keep-alive' \
-H 'X-Auth-Token: $token' \
-H 'Content-Type: application/octet-stream' 

## cinder snapshots
curl -g -i -X GET http://osapi.dct-tb.mtjade.cloud:8776/v2/d034846b0c0f4df4b0ef6cae1bd9b306/snapshots/detail?all_tenants=True&project_id=5a54b3853491478ead28060213c857c4 \
-H "User-Agent: python-cinderclient" \
-H "Accept: application/json" \
-H "X-Auth-Token: $token"

## cinder backups
curl -g -i -X GET http://osapi.dct-tb.mtjade.cloud:8776/v2/d034846b0c0f4df4b0ef6cae1bd9b306/backups/detail?all_tenants=True&project_id=5a54b3853491478ead28060213c857c4 \
-H "User-Agent: python-cinderclient" -H "X-OpenStack-Request-ID: req-b64a62b2-2c5b-4db9-91ce-4cc6912055cc" \
-H "Accept: application/json" \
-H "X-Auth-Token: $token"

## cinder volumes
curl -g -i -X GET http://osapi.dct-tb.mtjade.cloud:8776/v2/d034846b0c0f4df4b0ef6cae1bd9b306/volumes/detail?all_tenants=True&project_id=5a54b3853491478ead28060213c857c4 \
-H "User-Agent: python-cinderclient" \
-H "X-OpenStack-Request-ID: req-b64a62b2-2c5b-4db9-91ce-4cc6912055cc" \
-H "Accept: application/json" \
-H "X-Auth-Token: $token"

```

## `openstack project purge --keep-project --project 5a54b3853491478ead28060213c857c4` 
```bash
[root@dct-queens-ctl-001 ~]# openstack project purge --keep-project --project 5a54b3853491478ead28060213c857c4
Deleting server : e0c72865-af29-40c8-b734-dcb240893603
Deleting server : 1040452b-2249-4352-81a5-5c947359438f
Deleting volume : 0036479c-a9d6-4c6c-97f1-71c4a90c9674
Failed to delete volume with ID '0036479c-a9d6-4c6c-97f1-71c4a90c9674': Invalid volume: Volume  must not be migrating, attached, belong to a group, have snapshots or be disassociated from snapshots after volume transfer. (HTTP 400) (Request-ID: req-9f91f994-d728-4bd7-a851-20c8e5b7cf51)
Deleting volume : f7128a43-87c3-4492-a1dd-4b85868abca4
Failed to delete volume with ID 'f7128a43-87c3-4492-a1dd-4b85868abca4': Invalid volume: Volume  must not be migrating, attached, belong to a group, have snapshots or be disassociated from snapshots after volume transfer. (HTTP 400) (Request-ID: req-827079ce-f9d6-4f2b-81e7-175ce2c9916e)
Deleting volume : 4c0f31a0-b2ea-4ae1-bdc3-d590c2727f52
Deleting volume : 7b3bf8b6-1254-4626-a9ef-6fe8eed79923
Deleting volume : 3c775287-bd88-4024-a442-9335d61ad56f
2 of 5 volumes failed to delete.



[rocky@deneil-control-node ~]$ cat openstack_project_purge-deletion_resource.log | grep "GET"


token=`openstack token issue | grep "| id" | awk '{print $4}'`

## keystone
curl -g -i -X GET http://192.168.60.200:35357/v3 -H "Accept: application/json" -H "User-Agent: osc-lib/1.9.0 keystoneauth1/3.4.1 python-requests/2.14.2 CPython/2.7.5"
curl -g -i -X GET http://192.168.60.200:35357/v3/projects/5a54b3853491478ead28060213c857c4 -H "User-Agent: python-keystoneclient" -H "Accept: application/json" -H "X-Auth-Token: $token"

## nova 
curl -g -i -X GET http://osapi.dct-tb.mtjade.cloud:8774/v2.1/servers/detail?all_tenants=True&tenant_id=5a54b3853491478ead28060213c857c4 \
-H "User-Agent: python-novaclient" \
-H "Accept: application/json" \
-H "X-Auth-Token: $token"

curl -g -i -X DELETE http://osapi.dct-tb.mtjade.cloud:8774/v2.1/servers/8ed9ade2-387e-420f-8f64-195cbe507286 \
-H "User-Agent: python-novaclient" \
-H "Accept: application/json" \
-H "X-Auth-Token: {SHA1}04a9fdae8dc42f4cd71dd0cb9f3fedc4bc2e481f"



## glance  
curl -g -i -X GET http://osapi.dct-tb.mtjade.cloud:9292/v2/images?owner=5a54b3853491478ead28060213c857c4&limit=20 \
-H 'Accept-Encoding: gzip, deflate' \
-H 'Accept: */*' \
-H 'User-Agent: python-glanceclient' \
-H 'Connection: keep-alive' \
-H "X-Auth-Token: $token" \
-H 'Content-Type: application/octet-stream'


## cinder snapshots
curl -g -i -X GET http://osapi.dct-tb.mtjade.cloud:8776/v2/d034846b0c0f4df4b0ef6cae1bd9b306/snapshots/detail?all_tenants=True&project_id=5a54b3853491478ead28060213c857c4 \
-H "User-Agent: python-cinderclient" \
-H "Accept: application/json" \
-H "X-Auth-Token: $token"


## cinder backups
curl -g -i -X GET http://osapi.dct-tb.mtjade.cloud:8776/v2/d034846b0c0f4df4b0ef6cae1bd9b306/backups/detail?all_tenants=True&project_id=5a54b3853491478ead28060213c857c4 \
-H "User-Agent: python-cinderclient" \
-H "X-OpenStack-Request-ID: req-c257557a-c585-4f01-8516-2259756c52b2" \
-H "Accept: application/json" \
-H "X-Auth-Token: $token"

## cinder volumes
curl -g -i -X GET http://osapi.dct-tb.mtjade.cloud:8776/v2/d034846b0c0f4df4b0ef6cae1bd9b306/volumes/detail?all_tenants=True&project_id=5a54b3853491478ead28060213c857c4 \
-H "User-Agent: python-cinderclient" \
-H "X-OpenStack-Request-ID: req-c257557a-c585-4f01-8516-2259756c52b2" \
-H "Accept: application/json" \
-H "X-Auth-Token: $token"


## fail 1
GET call to volumev2 for http://osapi.dct-tb.mtjade.cloud:8776/v2/d034846b0c0f4df4b0ef6cae1bd9b306/volumes/detail?all_tenants=True&project_id=5a54b3853491478ead28060213c857c4 used request id req-abb4ca26-2e8c-47a4-b44c-ae1ff55fe40c
Deleting volume : 8bc97c40-77db-4c24-b3c4-f47e1bc60a24
REQ: curl -g -i -X POST http://osapi.dct-tb.mtjade.cloud:8776/v2/d034846b0c0f4df4b0ef6cae1bd9b306/volumes/8bc97c40-77db-4c24-b3c4-f47e1bc60a24/action -H "User-Agent: python-cinderclient" -H "Content-Type: application/json" -H "X-OpenStack-Request-ID: req-c257557a-c585-4f01-8516-2259756c52b2" -H "Accept: application/json" -H "X-Auth-Token: {SHA1}04a9fdae8dc42f4cd71dd0cb9f3fedc4bc2e481f" -d '{"os-force_delete": null}'
http://osapi.dct-tb.mtjade.cloud:8776 "POST /v2/d034846b0c0f4df4b0ef6cae1bd9b306/volumes/8bc97c40-77db-4c24-b3c4-f47e1bc60a24/action HTTP/1.1" 400 192
RESP: [400] Content-Length: 192 Content-Type: application/json X-Compute-Request-Id: req-8abe8b36-8546-4a0b-aa5a-5111c5fe1c38 X-Openstack-Request-Id: req-8abe8b36-8546-4a0b-aa5a-5111c5fe1c38 Date: Thu, 01 Jun 2023 03:21:05 GMT Connection: keep-alive 
RESP BODY: {"badRequest": {"message": "Invalid volume: Volume  must not be migrating, attached, belong to a group, have snapshots or be disassociated from snapshots after volume transfer.", "code": 400}}


## fail 2
POST call to volumev2 for http://osapi.dct-tb.mtjade.cloud:8776/v2/d034846b0c0f4df4b0ef6cae1bd9b306/volumes/8bc97c40-77db-4c24-b3c4-f47e1bc60a24/action used request id req-8abe8b36-8546-4a0b-aa5a-5111c5fe1c38
Failed to delete volume with ID '8bc97c40-77db-4c24-b3c4-f47e1bc60a24': Invalid volume: Volume  must not be migrating, attached, belong to a group, have snapshots or be disassociated from snapshots after volume transfer. (HTTP 400) (Request-ID: req-8abe8b36-8546-4a0b-aa5a-5111c5fe1c38)
Deleting volume : f5b3d3ac-a30a-4249-a652-cd3e1dc33e5f
REQ: curl -g -i -X POST http://osapi.dct-tb.mtjade.cloud:8776/v2/d034846b0c0f4df4b0ef6cae1bd9b306/volumes/f5b3d3ac-a30a-4249-a652-cd3e1dc33e5f/action -H "User-Agent: python-cinderclient" -H "Content-Type: application/json" -H "X-OpenStack-Request-ID: req-c257557a-c585-4f01-8516-2259756c52b2" -H "Accept: application/json" -H "X-Auth-Token: {SHA1}04a9fdae8dc42f4cd71dd0cb9f3fedc4bc2e481f" -d '{"os-force_delete": null}'
http://osapi.dct-tb.mtjade.cloud:8776 "POST /v2/d034846b0c0f4df4b0ef6cae1bd9b306/volumes/f5b3d3ac-a30a-4249-a652-cd3e1dc33e5f/action HTTP/1.1" 400 192
RESP: [400] Content-Length: 192 Content-Type: application/json X-Compute-Request-Id: req-4b980614-ecdd-467e-b176-f30b60621b5a X-Openstack-Request-Id: req-4b980614-ecdd-467e-b176-f30b60621b5a Date: Thu, 01 Jun 2023 03:21:05 GMT Connection: keep-alive 
RESP BODY: {"badRequest": {"message": "Invalid volume: Volume  must not be migrating, attached, belong to a group, have snapshots or be disassociated from snapshots after volume transfer.", "code": 400}}
POST call to volumev2 for http://osapi.dct-tb.mtjade.cloud:8776/v2/d034846b0c0f4df4b0ef6cae1bd9b306/volumes/f5b3d3ac-a30a-4249-a652-cd3e1dc33e5f/action used request id req-4b980614-ecdd-467e-b176-f30b60621b5a
Failed to delete volume with ID 'f5b3d3ac-a30a-4249-a652-cd3e1dc33e5f': Invalid volume: Volume  must not be migrating, attached, belong to a group, have snapshots or be disassociated from snapshots after volume 

## success 1
transfer. (HTTP 400) (Request-ID: req-4b980614-ecdd-467e-b176-f30b60621b5a)
Deleting volume : 0036479c-a9d6-4c6c-97f1-71c4a90c9674
REQ: curl -g -i -X POST http://osapi.dct-tb.mtjade.cloud:8776/v2/d034846b0c0f4df4b0ef6cae1bd9b306/volumes/0036479c-a9d6-4c6c-97f1-71c4a90c9674/action -H "User-Agent: python-cinderclient" -H "Content-Type: application/json" -H "X-OpenStack-Request-ID: req-c257557a-c585-4f01-8516-2259756c52b2" -H "Accept: application/json" -H "X-Auth-Token: {SHA1}04a9fdae8dc42f4cd71dd0cb9f3fedc4bc2e481f" -d '{"os-force_delete": null}'
http://osapi.dct-tb.mtjade.cloud:8776 "POST /v2/d034846b0c0f4df4b0ef6cae1bd9b306/volumes/0036479c-a9d6-4c6c-97f1-71c4a90c9674/action HTTP/1.1" 202 0
RESP: [202] Content-Length: 0 X-Compute-Request-Id: req-bcc81b1a-93fd-4055-88e7-289d4e66818a Content-Type: application/json X-Openstack-Request-Id: req-bcc81b1a-93fd-4055-88e7-289d4e66818a Date: Thu, 01 Jun 2023 03:21:05 GMT Connection: keep-alive
POST call to volumev2 for http://osapi.dct-tb.mtjade.cloud:8776/v2/d034846b0c0f4df4b0ef6cae1bd9b306/volumes/0036479c-a9d6-4c6c-97f1-71c4a90c9674/action used request id req-bcc81b1a-93fd-4055-88e7-289d4e66818a

## success 2
Deleting volume : f7128a43-87c3-4492-a1dd-4b85868abca4
REQ: curl -g -i -X POST http://osapi.dct-tb.mtjade.cloud:8776/v2/d034846b0c0f4df4b0ef6cae1bd9b306/volumes/f7128a43-87c3-4492-a1dd-4b85868abca4/action -H "User-Agent: python-cinderclient" -H "Content-Type: application/json" -H "X-OpenStack-Request-ID: req-c257557a-c585-4f01-8516-2259756c52b2" -H "Accept: application/json" -H "X-Auth-Token: {SHA1}04a9fdae8dc42f4cd71dd0cb9f3fedc4bc2e481f" -d '{"os-force_delete": null}'
http://osapi.dct-tb.mtjade.cloud:8776 "POST /v2/d034846b0c0f4df4b0ef6cae1bd9b306/volumes/f7128a43-87c3-4492-a1dd-4b85868abca4/action HTTP/1.1" 202 0
RESP: [202] Content-Length: 0 X-Compute-Request-Id: req-213b30ca-e594-4128-8dbb-4fa7039f3f59 Content-Type: application/json X-Openstack-Request-Id: req-213b30ca-e594-4128-8dbb-4fa7039f3f59 Date: Thu, 01 Jun 2023 03:21:05 GMT Connection: keep-alive
POST call to volumev2 for http://osapi.dct-tb.mtjade.cloud:8776/v2/d034846b0c0f4df4b0ef6cae1bd9b306/volumes/f7128a43-87c3-4492-a1dd-4b85868abca4/action used request id req-213b30ca-e594-4128-8dbb-4fa7039f3f59


2 of 4 volumes failed to delete.

```


```bash


token=`curl -si "http://192.168.60.200:35357/v3/auth/tokens" -H "Content-Type: application/json" -d ' { "auth": {"identity": { "methods": ["password"], "password": { "user": { "name": "admin", "domain": { "id": "default" }, "password": "admin_foxconn" } } }, "scope": { "project": { "name": "admin", "domain": { "id": "default" } } } } }' | awk '/X-Subject-Token/ {print $2}'`


[root@dct-queens-ctl-001 FiXo-web]# openstack project list | grep deneil-test-purge-20230531
| 5a54b3853491478ead28060213c857c4 | deneil-test-purge-20230531     
## openstack project list | grep deneil-test-purge-20230531
curl -X GET http://192.168.60.200:35357/v3/projects?name=deneil-test-purge-20230531 -H "User-Agent: python-keystoneclient" -H "Accept: application/json" -H "X-Auth-Token: $token"


{
    "links": 
    {
        "self": "http://192.168.60.200:35357/v3/projects?name=deneil-test-purge-20230531", 
        "previous": null, 
        "next": null}, 
        "projects": 
        [
            {
                "category": "tenant", 
                "is_domain": false, 
                "description": "", 
                "links": 
                {
                    "self": "http://192.168.60.200:35357/v3/projects/5a54b3853491478ead28060213c857c4"
                }, 
                "tags": [], 
                "enabled": true, 
                "id": "5a54b3853491478ead28060213c857c4", 
                "parent_id": "default", 
                "domain_id": "default", 
                "name": "deneil-test-purge-20230531"
            }
        ]
}




token=`openstack token issue | grep "| id" | awk '{print $4}'`
curl -X GET 192.168.60.200:8774/v2.1/servers/detail?all_tenants=True&tenant_id=5a54b3853491478ead28060213c857c4 \
-H "User-Agent: python-novaclient" \
-H "Accept: application/json" \
-H "X-Auth-Token: $token"


curl -X GET 192.168.60.200:8774/v2.1/servers -H "X-Auth-Token: $token" 
-H "User-Agent: python-novaclient" \
-H "Accept: application/json" \



REQ=`curl -X GET 192.168.60.200:8774/v2.1/servers/detail?project_id=5a54b3853491478ead28060213c857c4 \
-H "X-Auth-Token : $token" \
-H "Accept: application/json" \
-H "Content-Type: application/json"`


curl -X GET 192.168.60.200:8774/v2.1/servers/detail -H "X-Auth-Token: $token" -H "Accept: application/json" -H "Content-Type: application/json"
curl -X GET 192.168.60.200:8774/v2.1/servers/detail?all_tenants=True -H "X-Auth-Token: $token" -H "Accept: application/json" -H "Content-Type: application/json"

curl -X GET 192.168.60.200:8774/v2.1/servers/detail -H "X-Auth-Token: $token" -H "Accept: application/json" -H "Content-Type: application/json" -d '{"all_tenants": True}'
curl -X GET 192.168.60.200:8774/v2.1/servers/detail -H "X-Auth-Token: $token" -H "Accept: application/json" -H "Content-Type: application/json" -d '{"all_tenants": True, "tenant_id": "5a54b3853491478ead28060213c857c4" }'

curl -X GET 192.168.60.200:8774/v2.1/servers/detail?tenant_id=5a54b3853491478ead28060213c857c4 -H "X-Auth-Token: $token"
curl -X GET 192.168.60.200:8774/v2.1/servers/detail?all_tenants=True&tenant_id=5a54b3853491478ead28060213c857c4 -H "X-Auth-Token: $token"


curl -X GET 192.168.60.200:8774/v2.1/servers/detail -H "X-Auth-Token: $token"





```

## neutron lbaas-loadbalancer-list 

```bash
## neutron lbaas-loadbalancer-list 
token=`openstack token issue | grep "| id" | awk '{print $4}'`
curl -X GET \
http://192.168.9.200:9696/v2.0/lbaas/loadbalancers \
-H "User-Agent: python-neutronclient" \
-H "Accept: application/json" \
-H "X-Auth-Token: $token" | python -m json.tool
```

```json
{
    "loadbalancers": [
        {
            "admin_state_up": true,
            "created_at": "2023-06-20 14:55:06",
            "description": "lbs",
            "id": "5b9c07cf-d5a2-4048-9dac-bfceb5e847b3",
            "listeners": [
                {
                    "id": "2a9ed952-3a1c-4900-a371-15a71ec2f335"
                },
                {
                    "id": "5423e2b5-e3b2-47a0-9181-7ae3af7b496d"
                }
            ],
            "name": "deneil-test-LBS-2",
            "operating_status": "ONLINE",
            "pools": [
                {
                    "id": "32601733-6b1e-4c1c-9c69-4668f9bd2405"
                },
                {
                    "id": "86e6384f-8acf-4b39-ae1c-56528567f59a"
                }
            ],
            "provider": "haproxy",
            "provisioning_status": "ACTIVE",
            "tenant_id": "ad0f82e97b9e4bfb9c2b43c390320654",
            "timeout": 1800000,
            "updated_at": "2023-06-20 14:57:59",
            "vip_address": "192.168.120.8",
            "vip_port_id": "0327515b-78c9-435a-b724-346f16f71067",
            "vip_subnet_id": "b755546e-ff4d-418d-9f28-59a389478a14"
        },
        {
            "admin_state_up": true,
            "created_at": "2023-06-20 11:10:37",
            "description": "Kubernetes etcd_lb",
            "id": "6e32003a-0a90-490a-90d5-86fd95da34e1",
            "listeners": [
                {
                    "id": "f2473f1b-6279-43de-9be9-bd1af2d9202a"
                }
            ],
            "name": "deneiltestk8s-d5p7ktdjgouj-etcd_lb-ggovlbkkw6jm-loadbalancer-leuyhfwzcwbo",
            "operating_status": "ONLINE",
            "pools": [
                {
                    "id": "0880204e-30e3-417e-bdb5-b47a40efb019"
                }
            ],
            "provider": "haproxy",
            "provisioning_status": "ACTIVE",
            "tenant_id": "ad0f82e97b9e4bfb9c2b43c390320654",
            "timeout": 50000,
            "updated_at": "2023-06-20 11:11:01",
            "vip_address": "192.168.120.4",
            "vip_port_id": "e62a8bd2-ed8d-4ba1-a8f6-c92d4868a956",
            "vip_subnet_id": "b755546e-ff4d-418d-9f28-59a389478a14"
        },
        {
            "admin_state_up": true,
            "created_at": "2023-06-17 11:19:27",
            "description": "lbs",
            "id": "87238259-6a0b-44c0-9550-5fdb010fbb7c",
            "listeners": [
                {
                    "id": "a409b77f-3a2e-4673-898a-39c80ef0d49e"
                }
            ],
            "name": "deneil-test-LBS",
            "operating_status": "ONLINE",
            "pools": [
                {
                    "id": "48f10e10-9086-4688-a1de-bd663fa7b688"
                }
            ],
            "provider": "haproxy",
            "provisioning_status": "ACTIVE",
            "tenant_id": "ad0f82e97b9e4bfb9c2b43c390320654",
            "timeout": 1800000,
            "updated_at": "2023-06-17 11:20:27",
            "vip_address": "192.168.120.200",
            "vip_port_id": "20a9520f-22a5-4c34-bfea-609a1cba380f",
            "vip_subnet_id": "b755546e-ff4d-418d-9f28-59a389478a14"
        },
        {
            "admin_state_up": true,
            "created_at": "2023-06-20 11:10:37",
            "description": "Kubernetes api_lb",
            "id": "9f48f77b-b9fd-4e31-85dd-10e92316a89e",
            "listeners": [
                {
                    "id": "ed9f98d2-2f74-41e0-8252-bd9a60940891"
                }
            ],
            "name": "deneiltestk8s-d5p7ktdjgouj-api_lb-w3q2i5gttmi4-loadbalancer-hr7eoshxvhwb",
            "operating_status": "ONLINE",
            "pools": [
                {
                    "id": "ebd5ef8d-0de0-481b-80c9-96d1092b14bd"
                }
            ],
            "provider": "haproxy",
            "provisioning_status": "ACTIVE",
            "tenant_id": "ad0f82e97b9e4bfb9c2b43c390320654",
            "timeout": 50000,
            "updated_at": "2023-06-20 11:11:01",
            "vip_address": "192.168.120.22",
            "vip_port_id": "fb2a596e-af3d-4801-84c1-0e41be452635",
            "vip_subnet_id": "b755546e-ff4d-418d-9f28-59a389478a14"
        }
    ]
}

```

## neutron lbaas-pool-list  

```bash
[root@lh-testbed-control-001 ~]# neutron lbaas-pool-list  
neutron CLI is deprecated and will be removed in the future. Use openstack CLI instead.
+--------------------------------------+-------------------------------------------------------------------+--------------+----------+----------------+
| id                                   | name                                                              | lb_algorithm | protocol | admin_state_up |
+--------------------------------------+-------------------------------------------------------------------+--------------+----------+----------------+
| 0880204e-30e3-417e-bdb5-b47a40efb019 | deneiltestk8s-d5p7ktdjgouj-etcd_lb-ggovlbkkw6jm-pool-4srr7b3ib3va | ROUND_ROBIN  | TCP      | True           |
| 32601733-6b1e-4c1c-9c69-4668f9bd2405 | ssh-test-listener                                                 | ROUND_ROBIN  | TCP      | True           |
| 48f10e10-9086-4688-a1de-bd663fa7b688 | ssh-test-listener                                                 | ROUND_ROBIN  | TCP      | True           |
| 86e6384f-8acf-4b39-ae1c-56528567f59a | ssh-test-listener-to-VM                                           | ROUND_ROBIN  | TCP      | True           |
| ebd5ef8d-0de0-481b-80c9-96d1092b14bd | deneiltestk8s-d5p7ktdjgouj-api_lb-w3q2i5gttmi4-pool-4vxvmdeeth3g  | ROUND_ROBIN  | TCP      | True           |
+--------------------------------------+-------------------------------------------------------------------+--------------+----------+----------------+

## neutron lbaas-pool-list
curl -X GET \
http://192.168.9.200:9696/v2.0/lbaas/pools \
-H "User-Agent: python-neutronclient" \
-H "Accept: application/json" \
-H "X-Auth-Token: $token" | python -m json.tool

```

```json

{
    "pools": [
        {
            "admin_state_up": true,
            "description": "",
            "healthmonitor_id": "a64cdaf5-7e31-41b1-9481-9c1ba7115969",
            "id": "0880204e-30e3-417e-bdb5-b47a40efb019",
            "lb_algorithm": "ROUND_ROBIN",
            "listeners": [
                {
                    "id": "f2473f1b-6279-43de-9be9-bd1af2d9202a"
                }
            ],
            "loadbalancers": [
                {
                    "id": "6e32003a-0a90-490a-90d5-86fd95da34e1"
                }
            ],
            "members": [
                {
                    "id": "83643b2c-63a1-4377-8142-edb11b5d6b72"
                },
                {
                    "id": "57498b8d-42c9-4360-bca3-65e8611c487d"
                },
                {
                    "id": "94021846-131f-4d50-8654-54924b57200f"
                }
            ],
            "name": "deneiltestk8s-d5p7ktdjgouj-etcd_lb-ggovlbkkw6jm-pool-4srr7b3ib3va",
            "protocol": "TCP",
            "session_persistence": null,
            "tenant_id": "ad0f82e97b9e4bfb9c2b43c390320654"
        },
        {
            "admin_state_up": true,
            "description": "SEND_PROXY_OFF",
            "healthmonitor_id": "ec7eeb22-1f3a-4a99-a31c-403b285d829a",
            "id": "32601733-6b1e-4c1c-9c69-4668f9bd2405",
            "lb_algorithm": "ROUND_ROBIN",
            "listeners": [
                {
                    "id": "2a9ed952-3a1c-4900-a371-15a71ec2f335"
                }
            ],
            "loadbalancers": [
                {
                    "id": "5b9c07cf-d5a2-4048-9dac-bfceb5e847b3"
                }
            ],
            "members": [
                {
                    "id": "fff2ba1e-6dae-4970-98b7-9746a9d11d92"
                },
                {
                    "id": "944fda0e-ac20-40cc-acb8-1f17b79463d3"
                },
                {
                    "id": "29eb59aa-75bd-43d0-9062-63867a507add"
                }
            ],
            "name": "ssh-test-listener",
            "protocol": "TCP",
            "session_persistence": null,
            "tenant_id": "ad0f82e97b9e4bfb9c2b43c390320654"
        },
        {
            "admin_state_up": true,
            "description": "SEND_PROXY_OFF",
            "healthmonitor_id": "6ad3633e-246a-4b3f-8b8c-96132ed20040",
            "id": "48f10e10-9086-4688-a1de-bd663fa7b688",
            "lb_algorithm": "ROUND_ROBIN",
            "listeners": [
                {
                    "id": "a409b77f-3a2e-4673-898a-39c80ef0d49e"
                }
            ],
            "loadbalancers": [
                {
                    "id": "87238259-6a0b-44c0-9550-5fdb010fbb7c"
                }
            ],
            "members": [
                {
                    "id": "342e2840-88ae-4370-a50c-3b26dc20bbf7"
                }
            ],
            "name": "ssh-test-listener",
            "protocol": "TCP",
            "session_persistence": null,
            "tenant_id": "ad0f82e97b9e4bfb9c2b43c390320654"
        },
        {
            "admin_state_up": true,
            "description": "SEND_PROXY_OFF",
            "healthmonitor_id": "c061a0d2-602f-42aa-ae67-c92693f11dd0",
            "id": "86e6384f-8acf-4b39-ae1c-56528567f59a",
            "lb_algorithm": "ROUND_ROBIN",
            "listeners": [
                {
                    "id": "5423e2b5-e3b2-47a0-9181-7ae3af7b496d"
                }
            ],
            "loadbalancers": [
                {
                    "id": "5b9c07cf-d5a2-4048-9dac-bfceb5e847b3"
                }
            ],
            "members": [
                {
                    "id": "325434ae-0d07-41d0-9f03-30a963a4cc9e"
                }
            ],
            "name": "ssh-test-listener-to-VM",
            "protocol": "TCP",
            "session_persistence": null,
            "tenant_id": "ad0f82e97b9e4bfb9c2b43c390320654"
        },
        {
            "admin_state_up": true,
            "description": "",
            "healthmonitor_id": "f9f04f47-47ae-46be-a42b-d8530d0371fc",
            "id": "ebd5ef8d-0de0-481b-80c9-96d1092b14bd",
            "lb_algorithm": "ROUND_ROBIN",
            "listeners": [
                {
                    "id": "ed9f98d2-2f74-41e0-8252-bd9a60940891"
                }
            ],
            "loadbalancers": [
                {
                    "id": "9f48f77b-b9fd-4e31-85dd-10e92316a89e"
                }
            ],
            "members": [
                {
                    "id": "8ef2d8e6-46d4-4840-bf14-2184405a43b0"
                },
                {
                    "id": "12b86f01-4792-4ea2-b477-4e5567dea5e9"
                },
                {
                    "id": "8eda583e-3b7c-466a-9d0f-d5016fe43dd4"
                }
            ],
            "name": "deneiltestk8s-d5p7ktdjgouj-api_lb-w3q2i5gttmi4-pool-4vxvmdeeth3g",
            "protocol": "TCP",
            "session_persistence": null,
            "tenant_id": "ad0f82e97b9e4bfb9c2b43c390320654"
        }
    ]
}
```

## neutron lbaas-listener-list

```bash
## neutron lbaas-listener-list
curl -X GET \
http://192.168.9.200:9696/v2.0/lbaas/listeners \
-H "User-Agent: python-neutronclient" \
-H "Accept: application/json" \
-H "X-Auth-Token: $token" | python -m json.tool
```

```json
{
    "listeners": [
        {
            "admin_state_up": true,
            "connection_limit": 2000,
            "default_pool_id": "48f10e10-9086-4688-a1de-bd663fa7b688",
            "default_tls_container_ref": null,
            "description": "",
            "id": "a409b77f-3a2e-4673-898a-39c80ef0d49e",
            "loadbalancers": [
                {
                    "id": "87238259-6a0b-44c0-9550-5fdb010fbb7c"
                }
            ],
            "name": "ssh-test-listener",
            "protocol": "TCP",
            "protocol_port": 22,
            "sni_container_refs": [],
            "tenant_id": "ad0f82e97b9e4bfb9c2b43c390320654"
        },
        {
            "admin_state_up": true,
            "connection_limit": -1,
            "default_pool_id": "ebd5ef8d-0de0-481b-80c9-96d1092b14bd",
            "default_tls_container_ref": null,
            "description": "",
            "id": "ed9f98d2-2f74-41e0-8252-bd9a60940891",
            "loadbalancers": [
                {
                    "id": "9f48f77b-b9fd-4e31-85dd-10e92316a89e"
                }
            ],
            "name": "deneiltestk8s-d5p7ktdjgouj-api_lb-w3q2i5gttmi4-listener-bsr5gx6plrme",
            "protocol": "TCP",
            "protocol_port": 6443,
            "sni_container_refs": [],
            "tenant_id": "ad0f82e97b9e4bfb9c2b43c390320654"
        },
        {
            "admin_state_up": true,
            "connection_limit": -1,
            "default_pool_id": "0880204e-30e3-417e-bdb5-b47a40efb019",
            "default_tls_container_ref": null,
            "description": "",
            "id": "f2473f1b-6279-43de-9be9-bd1af2d9202a",
            "loadbalancers": [
                {
                    "id": "6e32003a-0a90-490a-90d5-86fd95da34e1"
                }
            ],
            "name": "deneiltestk8s-d5p7ktdjgouj-etcd_lb-ggovlbkkw6jm-listener-hragxhg33uod",
            "protocol": "TCP",
            "protocol_port": 2379,
            "sni_container_refs": [],
            "tenant_id": "ad0f82e97b9e4bfb9c2b43c390320654"
        }
    ]
}
```






```bash
token=`openstack token issue | grep "| id" | awk '{print $4}'`

[root@lh-testbed-control-001 ~]# openstack -h | grep magnum | grep list
  coe cluster list  List clusters (python-magnumclient)
  coe cluster template list  List Cluster Templates. (python-magnumclient)
  coe quotas list  Print a list of available quotas. (python-magnumclient)
  coe service list  Print a list of Magnum services. (python-magnumclient)
  coe stats list  Show stats for the given project_id (python-magnumclient)

# openstack coe cluster list --debug
curl -X GET http://osapi-fixo-6-lh.fixo.cloud:9511/clusters \
-H "X-Auth-Token: $token" \
-H "Content-Type: application/json" \
-H "Accept: application/json" \
-H "User-Agent: None"

{
    "clusters": [
        {
            "cluster_template_id": "df526dd4-8a0e-4d45-9908-ff04b88473db",
            "create_timeout": 30,
            "docker_volume_size": 120,
            "flavor_id": "CIS-K8SWORKER-v4m8-Q1",
            "keypair": null,
            "labels": {
                "boot_volume_size": "64",
                "boot_volume_type": "SSD-600",
                "calico_ipv4pool": "172.20.0.0/16",
                "cgroup_driver": "systemd",
                "cloud_provider_tag": "v1.15.2",
                "container_infra_prefix": "chart.fixo.cloud/rke118xx/",
                "containerd_tarball_sha256": "a4a4af4776316833cad5996c66d59f8b4a2af4da716b7902b7a2d5f5ac362dcc",
                "containerd_tarball_url": "http://fibo-fixo-6-lh.fixo.cloud:80/swift/v1/cis-support-component/cri-containerd-cni-1.4.11-linux-amd64.tar.gz",
                "docker_volume_type": "Standard-SSD",
                "fcos_python_package_container_image": "chart.fixo.cloud/rke118xx/python-cis:3.8.12",
                "fimo_agent_tarball_url": "http://fibo-fixo-6-lh.fixo.cloud:80/swift/v1/cis-support-component/fimo_agent.tar",
                "gpu_enabled": "false",
                "heat_container_agent_tag": "wallaby-stable-1",
                "helm_chart_repo_url": "http://chart.fixo.cloud/chartrepo/charts",
                "helm_client_url": "http://fibo-fixo-6-lh.fixo.cloud:80/swift/v1/cis-support-component/helm-client.tar.gz",
                "ingress_controller": "null",
                "kube_dashboard_enabled": "false",
                "kube_prometheus_stack_script_url": "http://fibo-fixo-6-lh.fixo.cloud:80/swift/v1/cis-support-component/kube-prometheus-stack/kube-prometheus-stack-gpu.yaml",
                "kube_tag": "v1.20.14-rancher1",
                "podman_tarball_url": "http://fibo-fixo-6-lh.fixo.cloud:80/swift/v1/cis-support-component/podman.gz",
                "poseidon_cluster_uuid": "",
                "poseidon_endpoint": "",
                "poseidon_token": "",
                "prometheus_operator_crd_url": "http://fibo-fixo-6-lh.fixo.cloud:80/swift/v1/cis-support-component/kube-prometheus-stack/prometheus-operator-0.53.1.tar.gz",
                "selinux_mode": "permissive"
            },
            "links": [
                {
                    "href": "http://osapi-fixo-6-lh.fixo.cloud:9511/v1/clusters/84210b61-1686-4480-b760-c3e60bcd743b",
                    "rel": "self"
                },
                {
                    "href": "http://osapi-fixo-6-lh.fixo.cloud:9511/clusters/84210b61-1686-4480-b760-c3e60bcd743b",
                    "rel": "bookmark"
                }
            ],
            "master_count": 3,
            "master_flavor_id": "CIS-K8SMASTER-v2m4-Q10",
            "name": "deneiltestk8s",
            "node_count": 2,
            "stack_id": "83631e81-0014-4f03-ab6f-6d6c570f07d9",
            "status": "CREATE_COMPLETE",
            "uuid": "84210b61-1686-4480-b760-c3e60bcd743b"
        }
    ]
}



# openstack coe cluster template list  --debug
curl -X GET http://osapi-fixo-6-lh.fixo.cloud:9511/clustertemplates \
-H "X-Auth-Token: $token" \
-H "Content-Type: application/json" \
-H "Accept: application/json" \
-H "User-Agent: None"

 openstack coe cluster delete  
 openstack coe cluster template delete  





```



