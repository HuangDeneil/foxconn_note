
[Notion](https://easy-broker-f36.notion.site/No-auth-barbican-803a1c740d584d23b995aa59712049d6)

```bash
token=`openstack  token issue | grep "| id" | awk '{print $4}'`
curl \
-X GET "http://127.0.0.1:9311/v1/orders?limit=40&offset=0" \
-H "Accept: application/json" \
-H "X-Auth-Token: $token"


token=`openstack token issue | grep "| id" | awk '{print $4}'`
## 增加requst上限
REQ=`curl -X GET "http://127.0.0.1:9311/v1/containers?limit=40&offset=0" \
-H "Accept: application/json" \
-H "X-Auth-Token: $token"`
## 計算顯示上限
echo  $REQ |  python -m json.tool | grep "created" | wc -l

token=`openstack token issue | grep "| id" | awk '{print $4}'`
REQ=`curl -X GET "http://192.168.9.200:9311/v1/containers?limit=1000" \
-H "Accept: application/json" \
-H "X-Auth-Token: $token"`
echo  $REQ |  python -m json.tool | grep "created" | wc -l



# 10.67.46.15
REQ=`curl -X GET \
"http://10.67.46.15:9311/v1/containers" \
-H "Accept: application/json" \
-H "X-Auth-Token: $token"`

172.16.16.22

token="gAAAAABkEVvh1yJ-X3WQnYJfH99jCjRDVX2i7Jztc1qYvXgBlDVxSbDbad5QyQRBRChJvloFo-CWKabJR_MBAJCsgTCA_IH7HnR0UtGLG4b33bcMejsBV_DE2mRKYyxs-k_ZGs4bt49bSd2UENHPr5t_4MjMQh2mHkHtflxCTdp0GIVomT59puU"

REQ=`curl -X GET "http://10.67.46.15:9311/v1/secrets/0004227c-6ba8-426e-bf84-44030bf7a0e0/payload" \
-H "Accept: application/json" \
-H "X-Auth-Token: $token"`

curl \
-X GET http://192.168.9.200:9311/v1/secrets/026b4d7f-6d6f-466a-8beb-c44d96129354/payload \
-H "Accept: application/json" \
-H "X-Auth-Token: $token"

curl -X GET http://osapi-fixo-1-tj.fixo.cloud:9311/v1/secrets/026b4d7f-6d6f-466a-8beb-c44d96129354/payload -H "Accept: text/plain" -H "X-Auth-Token: $token"

curl -g -i -X GET http://osapi-fixo-1-tj.fixo.cloud:9311/v1/secrets/026b4d7f-6d6f-466a-8beb-c44d96129354/payload -H "User-Agent: osc-lib/1.9.0 keystoneauth1/3.4.1 python-requests/2.14.2 CPython/2.7.5" -H "Accept: text/plain" -H "X-Auth-Token: $token"

curl -X GET \
"http://10.67.46.15:9311/v1/secrets/01f49253-1a78-4166-bd87-12a5988dd7e7" \
-H "Accept: application/json" \
-H "X-Auth-Token: $token"

curl -X GET \
"http://10.67.46.15:9311/v1/secrets/01f49253-1a78-4166-bd87-12a5988dd7e7/payload" \
-H "Accept: text/plain" -H "X-Auth-Token: $token"


curl -X GET \
"http://10.67.46.15:9311/v1/secrets" \
-H "Accept: application/json" \
-H "X-Auth-Token: $token"

curl -X GET http://10.67.46.15:8774/v2.1/flavors/detail -H "User-Agent: python-novaclient" -H "Accept: application/json" -H "X-Auth-Token: $token"

curl -X GET \
http://10.67.46.15:9311/v1/secrets \
-H "Accept: application/json" \
-H "X-Auth-Token: $token"


{
    "auth": {
        "identity": {
            "methods": [
                "password"
            ],
            "password": {
                "user": {
                    "id": "cca05729470b4c52ba5971ec8c91521d",
                    "password":"29c34dc888aeaccc88ce935eef5fa4b0d3f10c86cc58b0337d66aee7d809cc41712d138b28f65165393cc451b7b00d6f3053d65fc6146cf47eb8eafb77d6da3a"
                }
            }
        },
        "scope": {
            "project": {
                "domain": {
                    "id": "default"
                },
                "name": "xing-huang.chen@foxconn.com_20230224"
            }
        }
    }
}
{
"user": {
                    "id": "cca05729470b4c52ba5971ec8c91521d",
                    "name" : "xing-huang.chen@foxconn.com_8e01",
                    "password":"29c34dc888aeaccc88ce935eef5fa4b0d3f10c86cc58b0337d66aee7d809cc41712d138b28f65165393cc451b7b00d6f3053d65fc6146cf47eb8eafb77d6da3a"
                },
"project": {
                "domain": {
                    "id": "default"
                },
                "name": "xing-huang.chen@foxconn.com_20230224"
            }
        }
}

token=`openstack token issue | grep "| id" | awk '{print $4}'`
echo $token
token="gAAAAABkEmgLLxWb9G_AFG2vm4_LCduAenfwrA8lN_AOYs7Ubb2eadhkv5LkNY6aYrnJZuc-IvbvCBgiegERESZWcpLarAHMR_4jjeAx5PSZ9GvVsyP733IMeJAhurcad0BSr-r5KBK5wkD0nXRZq12v-CJuDoRB0IrZecJ8l_Xj202BA23eHIc"
curl \
-X GET http://192.168.9.200:9311/v1/secrets/76459408-f58b-4e7e-a548-2839a07b874a/payload \
-H "Accept: application/json" \
-H "X-Auth-Token: $token"

endpoint="192.168.9.200"
endpoint="10.67.46.15"

curl -X GET http://$endpoint:9311/v1/secrets/76459408-f58b-4e7e-a548-2839a07b874a/payload -H "Accept: text/plain" -H "X-Auth-Token:  $token"

curl \
-X GET http://10.67.46.15:9311/v1/secrets/76459408-f58b-4e7e-a548-2839a07b874a/payload \
-H "Accept: text/plain" \
-H "X-Auth-Token: $token"

curl -X GET \
http://osapi-fixo-1-tj.fixo.cloud:9311/v1/secrets/76459408-f58b-4e7e-a548-2839a07b874a/payload \
-H "text/plain" \
-H "X-Auth-Token: $token"



curl -X GET \
http://osapi-fixo-1-tj.fixo.cloud:9311/v1/secrets/76459408-f58b-4e7e-a548-2839a07b874a/payload \
-H "Accept: application/json" \
-H "X-Auth-Token: $token"


9311/v1/secrets/76459408-f58b-4e7e-a548-2839a07b874a/payload


# 設定 firewall port


# 9311

# 1. 建立Rule
openstack firewall group rule create \
--protocol tcp \
--destination-port 9311 \
--destination-ip-address 192.168.9.200 \
--action allow \
--name opsk-barbican-rule

+------------------------+--------------------------------------+
| Field                  | Value                                |
+------------------------+--------------------------------------+
| Action                 | allow                                |
| Description            |                                      |
| Destination IP Address | 192.168.9.200                        |
| Destination Port       | 9311                                 |
| Enabled                | True                                 |
| ID                     | 2e77ab9c-48fb-4dca-8ed8-dbc9ebee1819 |
| IP Version             | 4                                    |
| Name                   | opsk-barbican-rule                   |
| Project                | 71e93aa11b6b40b9abf39a5a619f1f9d     |
| Protocol               | tcp                                  |
| Shared                 | False                                |
| Source IP Address      | None                                 |
| Source Port            | None                                 |
| firewall_policy_id     | None                                 |
| project_id             | 71e93aa11b6b40b9abf39a5a619f1f9d     |
+------------------------+--------------------------------------+


# 2. 使用建立的Rule創建 Policy group
## Ingress
openstack firewall group policy add rule \
<firewall-policy> <firewall-rule>
openstack firewall group policy add rule \
FHW-ingress-policy opsk-barbican-rule 


openstack firewall group policy create \
--firewall-rule opsk-barbican-rule \
FHW-barbican-ingress-policy

## Egress
openstack firewall group policy create --firewall-rule FreeAll FHW-barbican-egress-policy

# 3. 將剛建立的 Policy Group 建立 firewall group 綁在ex-router qr 介面上
# 用指令將防火牆 policy 綁在 API_net <--> FHW 的 Router 中的 qr 介面 


openstack firewall group create \
--ingress-firewall-policy FHW-ingress-policy \
--egress-firewall-policy  FHW-egress-policy \
--port DCT-External-Route-FHW-Gw \
--name FHW-fw-group








[root@tj-testbed-control-001 ~]# openstack firewall group rule list | grep -B 2 -A 1 192.168.9.200
| 0fd2634d-e73d-4600-9d4a-4daece1786cf | gpu-api-rule                    | True    | TCP,                                           |
|                                      |                                 |         |  source(port): none specified(none specified), |
|                                      |                                 |         |  dest(port): 192.168.9.200(555),               |
|                                      |                                 |         |  allow                                         |
--
| 156dd05b-a9bc-4613-946b-e0b35579144b | rss-fixohdd-rule                | True    | TCP,                                           |
|                                      |                                 |         |  source(port): none specified(none specified), |
|                                      |                                 |         |  dest(port): 192.168.9.200(7488),              |
|                                      |                                 |         |  allow                                         |
--
| 1629c028-8eef-488a-8aab-d3b5dffcc34a | gpu-api-rule                    | True    | TCP,                                           |
|                                      |                                 |         |  source(port): none specified(none specified), |
|                                      |                                 |         |  dest(port): 192.168.9.200(555),               |
|                                      |                                 |         |  allow                                         |
--
| 256fae1e-9c05-4ce1-8b15-978200e38813 | rss-novacomputeapi-rule         | True    | TCP,                                           |
|                                      |                                 |         |  source(port): none specified(none specified), |
|                                      |                                 |         |  dest(port): 192.168.9.200(8774),              |
|                                      |                                 |         |  allow                                         |
--
| 5dc4da2d-7611-43a6-bf81-8bab6d26c653 | rss-fixossd-rule                | True    | TCP,                                           |
|                                      |                                 |         |  source(port): none specified(none specified), |
|                                      |                                 |         |  dest(port): 192.168.9.200(7489),              |
|                                      |                                 |         |  allow                                         |
--
| 7ee7bb1c-27d6-4c80-a053-a62866b23661 | rss-opsk-neutron-rule           | True    | TCP,                                           |
|                                      |                                 |         |  source(port): none specified(none specified), |
|                                      |                                 |         |  dest(port): 192.168.9.200(9696),              |
|                                      |                                 |         |  allow                                         |
--
| 9324b940-f5e7-40e0-9df0-c3361d8693f7 | rss-hddbackup-rule              | True    | TCP,                                           |
|                                      |                                 |         |  source(port): none specified(none specified), |
|                                      |                                 |         |  dest(port): 192.168.9.200(7688),              |
|                                      |                                 |         |  allow                                         |
--
| b8117044-82cf-470f-9c63-b94e4d2010de | admin-token-auth-rule           | True    | TCP,                                           |
|                                      |                                 |         |  source(port): none specified(none specified), |
|                                      |                                 |         |  dest(port): 192.168.9.200(35357),             |
|                                      |                                 |         |  allow                                         |
--
| c830dd1e-f1bb-4ae9-b625-f7120fde4638 | fiwogw-rule                     | True    | TCP,                                           |
|                                      |                                 |         |  source(port): none specified(none specified), |
|                                      |                                 |         |  dest(port): 192.168.9.200(3128),              |
|                                      |                                 |         |  allow                                         |
--
| db0ce8ad-59de-4e6b-9312-e36196bd7dc3 | token-auth-rule                 | True    | TCP,                                           |
|                                      |                                 |         |  source(port): none specified(none specified), |
|                                      |                                 |         |  dest(port): 192.168.9.200(5000),              |
|                                      |                                 |         |  allow                                         |
--
| de43e272-c24f-4655-b4bc-93bcadcd7359 | osweb-http-rule                 | True    | TCP,                                           |
|                                      |                                 |         |  source(port): none specified(none specified), |
|                                      |                                 |         |  dest(port): 192.168.9.200(80),                |
|                                      |                                 |         |  allow                                         |
--
| fbec91ea-a2df-46fe-86b8-c61924952c4c | rss-cinderapi-rule              | True    | TCP,                                           |
|                                      |                                 |         |  source(port): none specified(none specified), |
|                                      |                                 |         |  dest(port): 192.168.9.200(8776),              |
|                                      |                                 |         |  allow                                         |






 






[root@deneil-test-network rocky]# echo  $REQ |  python -m json.tool | grep "created" | wc -l
100

barbican的部屬是這份嗎 我發現這個好像是GPU api的 

curl \
-X GET "http://127.0.0.01:9311/v1/orders?limit=10&offset=0" \
-H "Accept: application/json" \
-H "X-Auth-Token: $token"


curl \
-X GET "http://127.0.0.01:9311/v1/secrets?limit=10&name=key2-1" \
-H "Accept: application/json" \
-H "X-Auth-Token: $token"



```

## desc 印出
```bash
token=`openstack  token issue | grep "| id" | awk '{print $4}'`

curl -X GET \
http://127.0.0.1:9311/v1/secrets?sort=created:desc \
-H "Accept: application/json" \
-H "X-Auth-Token: $token"

[rocky@deneil-barbican-test-non-keystone ~]$ curl -X GET \
http://127.0.0.1:9311/v1/secrets?sort=created:desc \
-H "Accept: application/json" \
-H "X-Auth-Token: $token"

HTTP/1.1 200 OK
Server: gunicorn
Date: Thu, 05 Jan 2023 05:50:09 GMT
Connection: close
Content-Length: 848
Content-Type: application/json
openstack-api-version: key-manager 1.0
vary: openstack-api-version
x-openstack-request-id: req-2aa2db04-5ede-4847-882c-2d33088edc88

{"secrets": [{"created": "2023-01-05T05:43:43", "updated": "2023-01-05T05:43:43", "status": "ACTIVE", "name": "secret-asy-2024", "secret_type": "private", "expiration": null, "algorithm": "rsa", "bit_length": 2048, "mode": null, "creator_id": "75695eb19680436e80d0a60df519ff34", "content_types": {"default": "application/octet-stream"}, "secret_ref": "http://localhost:9311/v1/secrets/f4006dde-78b5-45e4-9f9e-68260955576c"}, {"created": "2023-01-05T05:43:43", "updated": "2023-01-05T05:43:43", "status": "ACTIVE", "name": "secret-asy-2024", "secret_type": "public", "expiration": null, "algorithm": "rsa", "bit_length": 2048, "mode": null, "creator_id": "75695eb19680436e80d0a60df519ff34", "content_types": {"default": "application/octet-stream"}, "secret_ref": "http://localhost:9311/v1/secrets/de4b3aba-8229-4bc8-a1f9-b77bf9b75774"}], "total": 2}
```




```bash

token=`openstack token issue | grep "| id" | awk '{print $4}'`
curl -g -i -X GET http://localhost:9311/v1/secrets/5ff1ebca-9a9f-4dc9-8f8a-2f0c69cb1deb/metadata -H "Accept: application/json" -H "X-Auth-Token: $token"



token=`openstack token issue | grep "| id" | awk '{print $4}'`
curl -X GET \
http://127.0.0.1:9311/v1/secrets/f4006dde-78b5-45e4-9f9e-68260955576c/metadata \
-H "Accept: application/json" \
-H "X-Auth-Token: $token"


curl -X POST \
http://127.0.0.1:9311/v1/secrets/f4006dde-78b5-45e4-9f9e-68260955576c/metadata \
-H "Content-Type: application/json" \
-H "X-Auth-Token: $token" \
-d '
{
    "metadata": 
    { 
        "description": "test info", 
        "geolocation": "12.3456, -98.7654" 
    } 
}
'


token=`openstack token issue | grep "| id" | awk '{print $4}'`

## 所有的secrets
curl \
-X GET http://127.0.0.1:9311/v1/secrets \
-H "Accept: application/json" \
-H "X-Auth-Token: $token"


curl \
-X GET http://127.0.0.1:9311/v1/secrets?name=test-api-upload-3&limit=10 \
-H "Accept: application/json" \
-H "X-Auth-Token: $token"





curl \
-X GET http://192.168.77.15:9311/v1/orders \
-H "Accept: application/json" \
-H "X-Auth-Token: $token"


curl \
-X GET http://127.0.0.1:9311/v1/secrets/de4b3aba-8229-4bc8-a1f9-b77bf9b75774 \
-H "Accept: application/json" \
-H "X-Auth-Token: $token"



curl \
-X GET http://192.168.77.15:9311/v1/secrets/78399617-df7e-4c17-a48c-7e5cc7fd8510/payload \
-H "Accept: application/json" \
-H "X-Auth-Token: $token"

## 所有的 containers
curl -X GET \
http://127.0.0.1:9311/v1/containers \
-H "Accept: application/json" \
-H "X-Auth-Token: $token"


token=`openstack token issue | grep "| id" | awk '{print $4}'`
curl -X GET \
http://192.168.60.200:9311/v1/containers?name=test-key-2 \
-H "Accept: application/json" \
-H "X-Auth-Token: $token"



## 所有的orders
curl -X GET \
http://127.0.0.1:9311/v1/orders \
-H "Accept: application/json" \
-H "X-Auth-Token: $token"

curl -X GET \
http://localhost:9311/v1/orders/99db6b8f-0b83-4173-9003-bb3b17323fa3 \
-H "Accept: application/json" \
-H "X-Auth-Token: $token"


## openstack secret get --payload 
token=`openstack token issue | grep "| id" | awk '{print $4}'`
curl -X GET \
http://127.0.0.1:9311/v1/secrets/f4006dde-78b5-45e4-9f9e-68260955576c/payload \
-H "Accept: text/plain" \
-H "X-Auth-Token: $token"


curl -X GET \
http://192.168.77.15:9311/v1/secrets/78399617-df7e-4c17-a48c-7e5cc7fd8510/payload \
-H "Accept: text/plain" \
-H "X-Auth-Token: $token"

openstack secret get http://192.168.77.15:9311/v1/secrets/78399617-df7e-4c17-a48c-7e5cc7fd8510 \
--file test_download.pem --debug

token=`openstack token issue | grep "| id" | awk '{print $4}'`
curl -X GET \
http://192.168.77.15:9311/v1/secrets/238ab6c6-61d1-4c73-81df-166836f5e010/payload \
-H "Accept: text/plain" \
-H "X-Auth-Token: $token"

http://192.168.77.15:9311/v1/secrets/238ab6c6-61d1-4c73-81df-166836f5e010
```

## openstack secre store
```bash
openstack secret store --name "test" --file test.pem --secret-type private --bit-length 2048 --algorithm rsa --debug


token=`openstack token issue | grep "| id" | awk '{print $4}'`

curl -X POST http://192.168.60.200:9311/v1/secrets/ \
-H "Content-Type: application/json" \
-H "X-Auth-Token: $token" \
-d '
{
    "name": "test-sql-change-uuid", 
    "algorithm": "rsa", 
    "mode": "cbc", 
    "bit_length": 256, 
    "secret_type": "symmetric", 
    "payload":"1WCV+fE1EeoJFhg8Nm/4mIj2bNCr6Va0d75QeYccGcU=", 
    "payload_content_type": "application/octet-stream", 
    "payload_content_encoding": "base64"
}'

## check 'test-sql-change-uuid' content
curl -X GET http://192.168.60.200:9311/v1/secrets/54022053-20aa-42e4-a9d6-0dd37384a1b0/payload -H "X-Auth-Token: $token" | base64





## 原始 uuid
origin_uuid="54022053-20aa-42e4-a9d6-0dd37384a1b0"

## 欲修改 uuid
target_uuid="454c4c00-20aa-42e4-a9d6-0dd37384a1b0"

## change uuid SQL CLI
sql_cmd="\

-- 檢查資料是否已經存在
IF EXISTS (SELECT * FROM myTable WHERE 欄位名稱='欄位值')
    UPDATE myTable SET (...) WHERE 欄位名稱='欄位值'
ELSE
    INSERT INTO myTable VALUES (...)

UPDATE barbican.container_secret SET secret_id='$target_uuid' WHERE secret_id='$origin_uuid'; \
UPDATE barbican.encrypted_data SET secret_id='$target_uuid' WHERE secret_id='$origin_uuid'; \
UPDATE barbican.secrets SET id='$target_uuid' WHERE id='$origin_uuid'; \
UPDATE barbican.secret_acls SET secret_id='$target_uuid' WHERE secret_id='$origin_uuid'; \
UPDATE barbican.secret_store_metadata SET secret_id='$target_uuid' WHERE secret_id='$origin_uuid'; \
UPDATE barbican.secret_user_metadata SET secret_id='$target_uuid' WHERE secret_id='$origin_uuid'; \
"

tables="\
encrypted_data \
secret_acls \
secret_store_metadata \
secret_user_metadata \
container_secret" 


for i in $tables
do
   echo "${i}"
   cmd=`echo "select id from barbican.${i} WHERE secret_id = '$origin_uuid' or id = '$origin_uuid'"`
   id=`mysql -h 192.168.60.22 -u root -pfoxconn -e "IF EXISTS ($cmd) ; $cmd" `

done


mysql -h 192.168.60.22 -u root -pfoxconn -e "UPDATE barbican.container_secret SET secret_id='$target_uuid' WHERE secret_id='$origin_uuid'"
mysql -h 192.168.60.22 -u root -pfoxconn -e "UPDATE barbican.secret_acls SET secret_id='$target_uuid' WHERE secret_id='$origin_uuid'"
mysql -h 192.168.60.22 -u root -pfoxconn -e "UPDATE barbican.secret_user_metadata SET secret_id='$target_uuid' WHERE secret_id='$origin_uuid'"







mysql -h 192.168.60.22 -u root -pfoxconn -e "UPDATE barbican.secrets SET id='$target_uuid' WHERE id='$origin_uuid'"




origin_id=`mysql -h 192.168.60.22 -u root -pfoxconn -e "select id from barbican.encrypted_data WHERE secret_id = '$origin_uuid' " | grep "[^( id )]"`
mysql -h 192.168.60.22 -u root -pfoxconn -e "UPDATE barbican.encrypted_data SET secret_id='$target_uuid' WHERE  id='$origin_id';"





"secrets \ "

mysql -h 192.168.60.22 -u root -pfoxconn -e ""

SELECT * FROM barbican.secrets WHERE id = '54022053-20aa-42e4-a9d6-0dd37384a1b0' 
SELECT * FROM barbican.secret_store_metadata WHERE secret_id='54022053-20aa-42e4-a9d6-0dd37384a1b0'


## 建立secret uuid 在 barbican.secrets
mysql -h 192.168.60.22 -u root -pfoxconn -e "INSERT INTO barbican.secrets (id, created_at, updated_at, deleted_at, deleted, status, name, expiration, algorithm, bit_length, mode, secret_type, creator_id, project_id) VALUES ('454c4c00-20aa-42e4-a9d6-0dd37384a1b0', NOW(), NOW(), NULL, 0, 'ACTIVE', 'add-empty-value-uuid', NULL, 'rsa', 256, 'cbc', 'symmetric', 'e9c8e161a8a44544b3bfd734eebb3ba1', '95112484-9b21-41b7-a6d8-96224f8a7002') "

## secret_store_metadata
mysql -h 192.168.60.22 -u root -pfoxconn -e "UPDATE barbican.secret_store_metadata SET secret_id='$target_uuid' WHERE secret_id='$origin_uuid'"

## encrypted_data
mysql -h 192.168.60.22 -u root -pfoxconn -e "UPDATE barbican.encrypted_data SET secret_id='$target_uuid' WHERE secret_id='$origin_uuid'"



sql_cmd=""



mysql -h 192.168.60.22 -u root -pfoxconn -e "$sql_cmd"





openstack secret order create key --name 'order-create-asy-test' --bit-length 256 --algorithm aes

token=`openstack token issue | grep "| id" | awk '{print $4}'`
curl -X GET http://192.168.60.200:9311/v1/secrets/0ec2100b-5d42-4e9c-bd5a-229db09021e0/payload -H "X-Auth-Token: $token" | base64 > order-create-asy-test.key

# openstack secret store
openstack secret store --name "test" --file test.pem --secret-type private --bit-length 2048 --algorithm rsa --debug

openstack secret store --name="upload-order-create" --payload="`cat order-create-asy-test.key `" --payload-content-type="application/octet-stream" --payload-content-encoding='base64'


token=`openstack token issue | grep "| id" | awk '{print $4}'`
curl -X GET http://192.168.60.200:9311/v1/secrets/0ec2100b-5d42-4e9c-bd5a-229db09021e0/payload -H "X-Auth-Token: $token" | base64

curl -X GET http://192.168.60.200:9311/v1/secrets/f354b597-0013-4eda-8828-f0d6da4be146/payload -H "X-Auth-Token: $token" | base64 


## symmetric
http://192.168.60.200:9311/v1/secrets/76115942-e287-4066-90f9-566b121bbf02

## rsa
http://192.168.60.200:9311/v1/secrets/e79ae1e8-1a63-401a-a5f7-a28581cb1623




UPDATE `barbican`.`encrypted_data` SET `secret_id`='76115942-e287-4066-90f9-566b121bbf02' WHERE  `id`='433e2e14-6eba-4c54-ae17-703320c0a2fd';

UPDATE `barbican`.`encrypted_data` SET `secret_id`='e79ae1e8-1a63-401a-a5f7-a28581cb1623' WHERE  `id`='9ff2f0fa-f6fa-49f6-8957-9ea09e02c2dd';


curl -X GET http://192.168.60.200:9311/v1/secrets/e79ae1e8-1a63-401a-a5f7-a28581cb1623/payload -H "X-Auth-Token: $token" | base64

curl -X GET http://192.168.60.200:9311/v1/secrets/76115942-e287-4066-90f9-566b121bbf02/payload -H "X-Auth-Token: $token" | base64



curl -X POST http://192.168.60.200:9311/v1/secrets/ \
-H "Content-Type: application/json" \
-H "X-Auth-Token: $token" \
-d '{"name": "test-sql-update", 
"algorithm": "rsa", 
"mode": "cbc", 
"bit_length": 2048, 
"secret_type": "symmetric", 
"payload": "LS0tLS1CRUdJTiBQUklWQVRFIEtFWS0tLS0tCk1JSUV2Z0lCQURBTkJna3Foa2lHOXcwQkFRRUZBQVNDQktnd2dnU2tBZ0VBQW9JQkFRQ29KOWFUYUVRQWZTWk4KSnpmOXpiVjY1WnUvbXhycndxUGtVVjFpeTF2dGZBOUZiSzl6T1F1RGpCalZUMjQ1TEdqaXNTbFpjV01qYzFkZQpGNXN3N3NML213SVhnOWFONEl4MU9QRjBjVllWV05QMnA3aUllN1Z4QXdTZWVxNFhvMzVMU0lYMzRHQUR2alFvCm1xa2tlZzBEVkFMdGFVTzJKMjZPMldVTFJCQnpCck1pOXdaRGsrZHRFeStEV2g4bWhDZi9DVWxUZGx4TlRYNTAKOTl1MU8rMmVXcHhQcFJQcjdLUE1OWlJVNFFZUERqM0NjeDBGMGlZUEs0bFViWTlLWmhma0ZWMUpTaisweVk0OApCeXhKVVlaNUdzd2NhRGx5YVhWUGgyTTdmRHFPanM2R2RCUFIrcXA4VVZNU293eFREeFgwbjM0bmdXZG9FaTByCmo2WUpWMUIzQWdNQkFBRUNnZ0VBT0JBZ01FRkErdEMrNWxZL0NyVjgzaDZUVU15THF6TFhwWldqQnY4NkJQR3AKdmNIQXRTKzlzUHdTZzN2YUNlSE9qbFgyclVWcWdqVkFXYlNSSHoxYmNoRGlINmpxN1o2Qjljc29aV1FzQ1MzMgpiWFA1eURkR2hRazJqd2ZqNXlteFA3Uk1SaHBlcUtEUGp3SVJob0hTdU50WHBvUEQrWVVvRFNSWjFlbTVlaitrCmU5eHJ0cXJXSk91RmMvcndjTCsyRk1xNHZ0WGpkMGNBOU94MldJQUhyNmppTVV4NjFESFJwZG1TWUx5N3FVL2sKd2cvVlVpcHp3L096WEZvT01iRnFDYTR3bmNBd0lzTFp1ZVczYXdmVFkzZThMNnBZWUFLOFdidUk1K1F2ZWJjaQpWYUNtZmxTOTJabHdWZ2NsRjIyN3k2a2l2ZmhDWmlhNGZNOTFndE1lVVFLQmdRRG1SeU41aE1nMU9BbmtVTzZlCnBvVjhTVCtSbFBHU3lRRndGY2FjdmdQY0hnSmV5ZUVCM0NXY1Q0dTBKNHg4MlhBS2U4ZFhOcFhHOTdlRzFnakEKb0l2K3R5MDFuRGZVakppWDYvaXYyRmtpRW5ZaC9WZWhiQzYycEdrL3ZmdXJ1RVI1cmVtaDBDYkM2KzNaMjYzRgpqTTQ5RW1zVm1MTm9EMld0NnpyV3lQVnBld0tCZ1FDNjhFdTNjekl1S3Z6WXdpeDJyM2VlbXY3R093NFRHc1pxCitsaUJBcmhQN2R5S3V2OGtjcitzWEtQMzBSdy9GNGt1TnhUWjZpT1VwMCsraWZQdE11L0d6Q0REc0xmT2MrbmMKdlRZd1V1Uk9QZm1FaE90dDczYW9UdStHSDlSb0pyUWE2V3lSUnl4b0xsVDRNNTBFUGl2UVhIenRZamx1WFY3aApsRnhmMzU5T05RS0JnUUNpM0VFY21tbzJLVkhscGM5OWFPd1RRSUt5NVpJTWJCaVdPdkJpdm9oZ1R1RUNST2piCnRlVHJyZDV5SlY1WWxqZUZVcEZpL3ZuaTVDTnFPMG1wWW1KZ1hSQ2VUOE8wa1ZNQ2J5Tk15a2dQcnRyWm95RXMKeXlRbWpCVGJ2Zk9XT1JaRXNGa0IxZ0x6N0lRbGhoWmFGd0Z0Yys5RU1PRUJnWkk1OUptQ2VsSUdyUUtCZ1FDTQpqamlnQ3FGa1RUWW4xSGVTRllTZllITEhvWWVIbmM0cWlXa2FOMjFWeThiVEdKN1dUT0VKTys2ZFdrRWV2eGVLCkJDaE5ZTnEzM3NUNndzY0JSaGM3SmloTWV3YjQxL2F5M2lGc1hDY0ZIVndLNDlZUXBzaFU3R1QwTitLQkhQaTIKYzJRS0o3V2Y3NVk3dUxNS2lhUnYyZHFrc2dIMGxZZk5uTHVINnAvaE1RS0JnRjl5dXJ5d29kMkhiOXVUR3pHUwpITEZaSTQ0UW5LcEpyL2tTUGh5aDkwby81MktUbGhuTjNDOG1KODF0TEpoQU9IMUw3YmVlRzJoaVl5eStnUUNVCi9SZWp5MkNwUWtreXljOUFFekZjeEh6bHVIMDN1d0R6eUxoRFlaN0p3ZVk3VjhOVlIwNzNRTSt3YmM5b28zSFUKR1VVVGlhc0YzS3RxSUYzcnBxQU0vbDBmCi0tLS0tRU5EIFBSSVZBVEUgS0VZLS0tLS0K", "payload_content_type": "application/octet-stream", 
"payload_content_encoding": "base64"}'




openstack secret store --name "test-2" --file test.pem --secret-type private --bit-length 2048 --algorithm rsa --payload-content-type "text/plain" --debug


token=`openstack  token issue | grep "| id" | awk '{print $4}'`
curl -X POST http://127.0.0.1:9311/v1/secrets/ \
-H "Content-Type: application/json" \
-H "User-Agent: openstacksdk/0.101.0 keystoneauth1/5.0.0 python-requests/2.25.1 CPython/3.9.14" \
-H "X-Auth-Token: $token" \
-d '{"name": "test-api-upload-3", 
"algorithm": "rsa", 
"mode": "", 
"bit_length": 2048, 
"secret_type": "private", 
"payload": "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQCoJ9aTaEQAfSZN\nJzf9zbV65Zu/mxrrwqPkUV1iy1vtfA9FbK9zOQuDjBjVT245LGjisSlZcWMjc1de\nF5sw7sL/mwIXg9aN4Ix1OPF0cVYVWNP2p7iIe7VxAwSeeq4Xo35LSIX34GADvjQo\nmqkkeg0DVALtaUO2J26O2WULRBBzBrMi9wZDk+dtEy+DWh8mhCf/CUlTdlxNTX50\n99u1O+2eWpxPpRPr7KPMNZRU4QYPDj3Ccx0F0iYPK4lUbY9KZhfkFV1JSj+0yY48\nByxJUYZ5GswcaDlyaXVPh2M7fDqOjs6GdBPR+qp8UVMSowxTDxX0n34ngWdoEi0r\nj6YJV1B3AgMBAAECggEAOBAgMEFA+tC+5lY/CrV83h6TUMyLqzLXpZWjBv86BPGp\nvcHAtS+9sPwSg3vaCeHOjlX2rUVqgjVAWbSRHz1bchDiH6jq7Z6B9csoZWQsCS32\nbXP5yDdGhQk2jwfj5ymxP7RMRhpeqKDPjwIRhoHSuNtXpoPD+YUoDSRZ1em5ej+k\ne9xrtqrWJOuFc/rwcL+2FMq4vtXjd0cA9Ox2WIAHr6jiMUx61DHRpdmSYLy7qU/k\nwg/VUipzw/OzXFoOMbFqCa4wncAwIsLZueW3awfTY3e8L6pYYAK8WbuI5+Qvebci\nVaCmflS92ZlwVgclF227y6kivfhCZia4fM91gtMeUQKBgQDmRyN5hMg1OAnkUO6e\npoV8ST+RlPGSyQFwFcacvgPcHgJeyeEB3CWcT4u0J4x82XAKe8dXNpXG97eG1gjA\noIv+ty01nDfUjJiX6/iv2FkiEnYh/VehbC62pGk/vfuruER5remh0CbC6+3Z263F\njM49EmsVmLNoD2Wt6zrWyPVpewKBgQC68Eu3czIuKvzYwix2r3eemv7GOw4TGsZq\n+liBArhP7dyKuv8kcr+sXKP30Rw/F4kuNxTZ6iOUp0++ifPtMu/GzCDDsLfOc+nc\nvTYwUuROPfmEhOtt73aoTu+GH9RoJrQa6WyRRyxoLlT4M50EPivQXHztYjluXV7h\nlFxf359ONQKBgQCi3EEcmmo2KVHlpc99aOwTQIKy5ZIMbBiWOvBivohgTuECROjb\nteTrrd5yJV5YljeFUpFi/vni5CNqO0mpYmJgXRCeT8O0kVMCbyNMykgPrtrZoyEs\nyyQmjBTbvfOWORZEsFkB1gLz7IQlhhZaFwFtc+9EMOEBgZI59JmCelIGrQKBgQCM\njjigCqFkTTYn1HeSFYSfYHLHoYeHnc4qiWkaN21Vy8bTGJ7WTOEJO+6dWkEevxeK\nBChNYNq33sT6wscBRhc7JihMewb41/ay3iFsXCcFHVwK49YQpshU7GT0N+KBHPi2\nc2QKJ7Wf75Y7uLMKiaRv2dqksgH0lYfNnLuH6p/hMQKBgF9yurywod2Hb9uTGzGS\nHLFZI44QnKpJr/kSPhyh90o/52KTlhnN3C8mJ81tLJhAOH1L7beeG2hiYyy+gQCU\n/Rejy2CpQkkyyc9AEzFcxHzluH03uwDzyLhDYZ7JweY7V8NVR073QM+wbc9oo3HU\nGUUTiasF3KtqIF3rpqAM/l0f\n-----END PRIVATE KEY-----\n", 
"payload_content_type": "text/plain" 
}'



```





## Container create
```bash

## upload key pair
### public key
openstack secret store --name "the_key" --file the_key.pub --secret-type public --bit-length 2048 --algorithm rsa 
# url : http://192.168.77.15:9311/v1/secrets/450d59de-1de1-4aea-a444-d1351baa5652

openstack secret store --name "upload-from-CLI-test" --payload `cat ./upload-test.cer` --secret-type certificate --bit-length 2048 --algorithm rsa 
openstack secret store --name "upload-from-CLI-test" --payload `cat ./upload-test.pem` --secret-type private --bit-length 2048 --algorithm rsa 

token=`openstack  token issue | grep "| id" | awk '{print $4}'`
curl -X POST \
"http://192.168.60.200:9311/v1/secrets" \
-H "Content-Type: application/json" \
-H "X-Auth-Token: $token" \
-d '{"name": "upload-from-API-test", 
"algorithm": "rsa", 
"mode": "", 
"bit_length": 2048, 
"secret_type": "certificate", 
"payload": "-----BEGIN CERTIFICATE-----\nMIIBozCCAQwCAQEwDQYJKoZIhvcNAQELBQAwGjEYMBYGA1UEAwwPY2EtaW50QGFj\nbWUuY29tMB4XDTE4MTExOTA4MDgyOFoXDTI4MTExNjA4MDgyOFowGjEYMBYGA1UE\nAwwPc2VydmVyQGFjbWUuY29tMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCR\nqXTMyx3FDDqKibQNt8zaTZ1ZUw/hkG4rZwfQrmjwJU+rQQg1i7jxJs8kwNrc1z5f\nD+7MxmnlruyY51se+u+JkHa3Xud7XIfzFJNo4atq+MfTghJVcQf/RV8HgOzd6ES6\n/lQQQoRSj2EFgOSj5YDUr/CXFw/JTyLJiFbgkwDZpQIDAQABMA0GCSqGSIb3DQEB\nCwUAA4GBABZ01kv1JdiIr3bYUaVbliXfF0K+uhPlOayDTW0mPc2sGSz4aQXKoy/W\nwmWGNG/Frv7soVIETZD2er0dePl+nhAP/yNgJt6p6FYQGcU3XDqduMjGVwrdtQ/8\nlzQPX/zqJqFWIV4qa0YgtIUs2v22Ef1qex1M+AsLkk7ZB0N53rB3\n-----END CERTIFICATE-----", 
"payload_content_type": "text/plain" 
}'
http://192.168.60.200:9311/v1/secrets/beff5d3a-7af5-4b40-9bf8-3cca21ab730c

curl -X POST \
"http://192.168.60.200:9311/v1/secrets" \
-H "Content-Type: application/json" \
-H "X-Auth-Token: $token" \
-d '{"name": "upload-from-API-test", 
"algorithm": "rsa", 
"mode": "", 
"bit_length": 2048, 
"secret_type": "private", 
"payload": "-----BEGIN RSA PRIVATE KEY-----\nMIICXQIBAAKBgQCRqXTMyx3FDDqKibQNt8zaTZ1ZUw/hkG4rZwfQrmjwJU+rQQg1\ni7jxJs8kwNrc1z5fD+7MxmnlruyY51se+u+JkHa3Xud7XIfzFJNo4atq+MfTghJV\ncQf/RV8HgOzd6ES6/lQQQoRSj2EFgOSj5YDUr/CXFw/JTyLJiFbgkwDZpQIDAQAB\nAoGAV6ghiOim5qEATcSmnSbB2ZGholKRGQ4Aro/XLSb4MaRSeF2vYgHObxkKyTRh\nwUqq1yxQadzxd244JZ/8vv0Fztu8gannHz5rb3rQPr/8tKIchqv5EMeTQA4TLczu\n3ln1j9Pqag3RLZStNIe88bFMrhPdceEf8Y4yN/tns6S/icECQQDB+8cs/yIuH+Xa\nca5pJTiiHDQ+cR+0eqmsBWgHH5d9fNVZdhgRb327J2YMQWR+XUU2c2MPQjmZn+lL\nK0o0rjYVAkEAwDrje5u1LoTVZWPKX1EJmhx6COuFWfdNjfTw+FPJdzzamyykHKBp\ney60H5oeVFhN3boNSCMEl5vGPqpOGc8JUQJAKgulr0YZpX+6dW+gix/LN6//Tu18\nHsVbk3KUir65OjTdlYd4TgcpbHBsuQlPe+hBgTzfYsZK79ZuXaGjcumzxQJBAKUM\navFguendJ5RMYCAC5mmp9aXfArpCOhaerp+o4Rw95bzCUY46tRaM/R79JvlocELm\nUi0T1AeQOmDnvPMv7mECQQCOvuwmI9HRUdhvJ8LiUMcWSY6yhICT0Epix0m+YEkg\na8a5yGIMSk16cvIPief/ZQOm6BT1e8BHCi41GIUNZ+Gk\n-----END RSA PRIVATE KEY-----", 
"payload_content_type": "text/plain" 
}'

http://192.168.60.200:9311/v1/secrets/2ca430db-523d-461b-ac4e-7da26ed3b361

curl -X POST \
http://192.168.60.200:9311/v1/containers/ \
-H "Content-Type: application/json" \
-H "X-Auth-Token: $token" \
-d '
{
    "name": "upload-from-API-test", 
    "type": "certificate", 
    "secret_refs": [
        {
            "name": "private_key", 
            "secret_ref": "http://192.168.60.200:9311/v1/secrets/2ca430db-523d-461b-ac4e-7da26ed3b361"
        }, 
        {
            "name": "certificate", 
            "secret_ref": "http://192.168.60.200:9311/v1/secrets/beff5d3a-7af5-4b40-9bf8-3cca21ab730c"
        }
        ]
}'
http://192.168.60.200:9311/v1/containers/59f187ef-6df5-4fa6-bcf7-b06827cbed8f




### private key
openstack secret store --name "the_key" --file the_key.pem --secret-type private --bit-length 2048 --algorithm rsa 
# url : http://192.168.77.15:9311/v1/secrets/be0f2005-edc0-43ae-800c-424e830f639a


token=`openstack token issue | grep "| id" | awk '{print $4}'`
curl -X GET \
http://192.168.77.15:9311/v1/secrets/be0f2005-edc0-43ae-800c-424e830f639a/payload \
-H "Content-Type: application/json" \
-H "X-Auth-Token: $token"


## openstack secret container create
openstack secret container create \
--name the_key \
--type rsa \
--secret "private_key=http://192.168.77.15:9311/v1/secrets/be0f2005-edc0-43ae-800c-424e830f639a" \
--secret "public_key=http://192.168.77.15:9311/v1/secrets/450d59de-1de1-4aea-a444-d1351baa5652" --debug


token=`openstack token issue | grep "| id" | awk '{print $4}'`
curl -X POST \
http://192.168.77.15:9311/v1/containers/ \
-H "Content-Type: application/json" \
-H "X-Auth-Token: $token" \
-d '
{
    "name": "the_key", 
    "type": "generic", 
    "secret_refs": [
        {
            "name": "private_key", 
            "secret_ref": "http://192.168.77.15:9311/v1/secrets/be0f2005-edc0-43ae-800c-424e830f639a"
        }, 
        {
            "name": "public_key", 
            "secret_ref": "http://192.168.77.15:9311/v1/secrets/450d59de-1de1-4aea-a444-d1351baa5652"
        }
        ]
}'


token=`openstack token issue | grep "| id" | awk '{print $4}'`
curl -X GET \
http://192.168.77.15:9311/v1/containers/1cf6377c-3c5c-42d4-98f4-e3e6a9aea740 \
-H "Accept: application/json" \
-H "X-Auth-Token: $token"

{
    "created": "2023-01-12T01:58:15", 
    "updated": "2023-01-12T01:58:15", 
    "status": "ACTIVE", 
    "name": "the_key", 
    "type": "generic", 
    "creator_id": "b0522483156240dea3348a31c0144693", 
    "secret_refs": [
        {
            "name": "private_key", 
            "secret_ref": "http://192.168.77.15:9311/v1/secrets/be0f2005-edc0-43ae-800c-424e830f639a"
        }, 
        {
            "name": "public_key", 
            "secret_ref": "http://192.168.77.15:9311/v1/secrets/450d59de-1de1-4aea-a444-d1351baa5652"
        }
    ], 
    "consumers": [], 
    "container_ref": "http://192.168.77.15:9311/v1/containers/1cf6377c-3c5c-42d4-98f4-e3e6a9aea740"
}






openstack secret store --name "test certification" --secret-type private --file test.pem  --bit-length 1024
http://192.168.77.15:9311/v1/secrets/e85e4934-6d78-49cb-b879-a4f4ec0c457a
openstack secret store --name "test certification crf" --secret-type certificate --file test.crf  --bit-length 1024
http://192.168.77.15:9311/v1/secrets/ba11641c-386f-4407-a10d-a8817ea61eed

token=`openstack token issue | grep "| id" | awk '{print $4}'`
curl -X POST \
http://192.168.77.15:9311/v1/containers/ \
-H "Content-Type: application/json" \
-H "X-Auth-Token: $token" \
-d '
{
    "name": "test certification", 
    "type": "certificate", 
    "secret_refs": [
        {
            "name": "private_key", 
            "secret_ref": "http://192.168.77.15:9311/v1/secrets/e85e4934-6d78-49cb-b879-a4f4ec0c457a"
        }, 
        {
            "name": "certificate", 
            "secret_ref": "http://192.168.77.15:9311/v1/secrets/ba11641c-386f-4407-a10d-a8817ea61eed"
        }
        ]
}'


curl -X POST \
http://192.168.60.200:9311/v1/containers/ \
-H "Content-Type: application/json" \
-H "X-Auth-Token: $token" \
-d '
{
    "name": "test certification", 
    "type": "certificate", 
    "secret_refs": [
        {
            "name": "private_key", 
            "secret_ref": "http://192.168.60.200:9311/v1/secrets/549f97a4-7c9a-4d3e-93c5-e5cde3af694a"
        }, 
        {
            "name": "certificate", 
            "secret_ref": "http://192.168.60.200:9311/v1/secrets/578054da-13c8-47ea-97da-8565e3880a42"
        }
        ]
}'




token=`openstack token issue | grep "| id" | awk '{print $4}'`
curl -X GET \
http://192.168.77.15:9311/v1/containers/ \
-H "Accept: application/json" \
-H "X-Auth-Token: $token"



{
    "containers": 
    [
    {
        "created": "2022-12-19T13:22:04", "updated": "2022-12-19T13:22:04",  "status": "ACTIVE", 
        "name": "first_key", 
        "type": "rsa", 
        "creator_id": "b0522483156240dea3348a31c0144693", 
        "secret_refs": 
        [{
            "name": "private_key", 
            "secret_ref": "http://192.168.77.15:9311/v1/secrets/238ab6c6-61d1-4c73-81df-166836f5e010"
        }, 
        {
                
            "name": "public_key", 
            "secret_ref": "http://192.168.77.15:9311/v1/secrets/0112ef6d-9d0d-4300-b65a-d0d21145fa77"
        }], 
        "consumers": [], 
        "container_ref": "http://192.168.77.15:9311/v1/containers/a60f0605-25cd-458a-8cc9-0c5d7cff589c"
    }, 
    {
        "created": "2023-01-07T01:07:52", "updated": "2023-01-07T01:07:52", "status": "ACTIVE", 
        "name": "create key by api", 
        "type": "rsa", 
        "creator_id": "b0522483156240dea3348a31c0144693", 
        "secret_refs": 
        [{
                
            "name": "private_key", 
            "secret_ref": "http://192.168.77.15:9311/v1/secrets/5d5dfc7d-f2e9-4209-9672-3b33b9c88068"
        }, 
        {
            "name": "public_key", 
            "secret_ref": "http://192.168.77.15:9311/v1/secrets/74877d4a-f0ac-44d5-a138-0d625b2002fb"
        }], 
        "consumers": [], 
        "container_ref": "http://192.168.77.15:9311/v1/containers/1f017ea8-8876-4650-b08b-f0039c0a2413"
    }, 
    {
        "created": "2023-01-12T02:19:09", "updated": "2023-01-12T02:19:09", "status": "ACTIVE", 
        "name": "the_key", 
        "type": "rsa", 
        "creator_id": "b0522483156240dea3348a31c0144693", 
        "secret_refs": 
        [{
            "name": "private_key", 
            "secret_ref": "http://192.168.77.15:9311/v1/secrets/be0f2005-edc0-43ae-800c-424e830f639a"
        }, 
        {
            "name": "public_key", 
            "secret_ref": "http://192.168.77.15:9311/v1/secrets/450d59de-1de1-4aea-a444-d1351baa5652"
        }], 
        "consumers": [], 
        "container_ref": "http://192.168.77.15:9311/v1/containers/96078e0d-d0ee-4c64-ae35-eaefd27c7847"
    }, 
    {
        "created": "2023-01-16T01:27:57", "updated": "2023-01-16T01:27:57", "status": "ACTIVE", 
        "name": "the_key", 
        "type": "generic", 
        "creator_id": "b0522483156240dea3348a31c0144693", 
        "secret_refs": [
            {
                "name": "public_key", 
                "secret_ref": "http://192.168.77.15:9311/v1/secrets/450d59de-1de1-4aea-a444-d1351baa5652"
            }, 
            {
                "name": "private_key", 
                "secret_ref": "http://192.168.77.15:9311/v1/secrets/be0f2005-edc0-43ae-800c-424e830f639a"
            }
        ], 
        "consumers": [], 
        "container_ref": "http://192.168.77.15:9311/v1/containers/b8305465-053b-4624-bb1c-ef609a8b7127"
    }, 
    {
        "created": "2023-01-16T01:58:38", "updated": "2023-01-16T01:58:38", "status": "ACTIVE", 
        "name": "test certification", 
        "type": "certificate", 
        "creator_id": "b0522483156240dea3348a31c0144693", 
        "secret_refs": [
            {
                "name": "private_key", 
                "secret_ref": "http://192.168.77.15:9311/v1/secrets/e85e4934-6d78-49cb-b879-a4f4ec0c457a"}, 
            {
                "name": "certificate", 
                "secret_ref": "http://192.168.77.15:9311/v1/secrets/ba11641c-386f-4407-a10d-a8817ea61eed"
            }
        ], 
        "consumers": [], 
        "container_ref": "http://192.168.77.15:9311/v1/containers/89cd3231-cd97-4cb0-8669-1218dc63eb6a"
    }
    ], 
    "total": 5
}



openstack secret update <url> <payload>


curl -X GET \
http://192.168.77.15:9311/v1/containers/5a8e0ff5-5cf7-43f8-87f3-15df01bbc51f \
-H "Accept: application/json" \
-H "X-Auth-Token: $token"

{
    "created": "2023-01-10T08:12:06", 
    "updated": "2023-01-10T08:12:06", 
    "status": "ACTIVE", 
    "name": "created_at_2023/01/10_16:12:05", 
    "type": "rsa", 
    "creator_id": "b0522483156240dea3348a31c0144693", 
    "secret_refs": [
        {
            "name": "public_key", 
            "secret_ref": "http://192.168.77.15:9311/v1/secrets/0ba836bc-c060-4a6c-adcb-cdba848452a2"
        }, 
        {
            "name": "private_key", 
            "secret_ref": "http://192.168.77.15:9311/v1/secrets/cddd35a3-134f-43e1-8a2f-3e2834cfd128"
        }
    ], 
    "consumers": [], 
    "container_ref": "http://192.168.77.15:9311/v1/containers/5a8e0ff5-5cf7-43f8-87f3-15df01bbc51f"
}


## 自己手動建立secret container
[rocky@deneil-control-node ~]$ openstack secret container get http://192.168.77.15:9311/v1/containers/1cf6377c-3c5c-42d4-98f4-e3e6a9aea740
+----------------+---------------------------------------------------------------------------------------+
| Field          | Value                                                                                 |
+----------------+---------------------------------------------------------------------------------------+
| Container href | http://192.168.77.15:9311/v1/containers/1cf6377c-3c5c-42d4-98f4-e3e6a9aea740          |
| Name           | the_key                                                                               |
| Created        | 2023-01-12T01:58:15+00:00                                                             |
| Status         | ACTIVE                                                                                |
| Type           | generic                                                                               |
| Secrets        | private_key=http://192.168.77.15:9311/v1/secrets/be0f2005-edc0-43ae-800c-424e830f639a |
|                | public_key=http://192.168.77.15:9311/v1/secrets/450d59de-1de1-4aea-a444-d1351baa5652  |
| Consumers      | None                                                                                  |
+----------------+---------------------------------------------------------------------------------------+


## secret order create 創建的 secret container
[rocky@deneil-control-node ~]$  openstack secret container get http://192.168.77.15:9311/v1/containers/5a8e0ff5-5cf7-43f8-87f3-15df01bbc51f

+----------------+------------------------------------------------------------------------------+
| Field          | Value                                                                        |
+----------------+------------------------------------------------------------------------------+
| Container href | http://192.168.77.15:9311/v1/containers/5a8e0ff5-5cf7-43f8-87f3-15df01bbc51f |
| Name           | created_at_2023/01/10_16:12:05                                               |
| Created        | 2023-01-10 08:12:06+00:00                                                    |
| Status         | ACTIVE                                                                       |
| Type           | rsa                                                                          |
| Public Key     | http://192.168.77.15:9311/v1/secrets/0ba836bc-c060-4a6c-adcb-cdba848452a2    |
| Private Key    | http://192.168.77.15:9311/v1/secrets/cddd35a3-134f-43e1-8a2f-3e2834cfd128    |
| PK Passphrase  | None                                                                         |
| Consumers      | None                                                                         |
+----------------+------------------------------------------------------------------------------+



token=`openstack token issue | grep "| id" | awk '{print $4}'`
curl -X POST \
http://192.168.77.15:9311/v1/containers/ \
-H "Content-Type: application/json" \
-H "X-Auth-Token: $token" \
-d '
{
    "name": "the_key", 
    "type": "rsa", 
    "secret_refs": [
        {
            "name": "private_key", 
            "secret_ref": "http://192.168.77.15:9311/v1/secrets/be0f2005-edc0-43ae-800c-424e830f639a"
        }, 
        {
            "name": "public_key", 
            "secret_ref": "http://192.168.77.15:9311/v1/secrets/450d59de-1de1-4aea-a444-d1351baa5652"
        }
        ]
}'

http://192.168.77.15:9311/v1/containers/96078e0d-d0ee-4c64-ae35-eaefd27c7847
[rocky@deneil-control-node ~]$ openstack secret container get http://192.168.77.15:9311/v1/containers/96078e0d-d0ee-4c64-ae35-eaefd27c7847
+----------------+------------------------------------------------------------------------------+
| Field          | Value                                                                        |
+----------------+------------------------------------------------------------------------------+
| Container href | http://192.168.77.15:9311/v1/containers/96078e0d-d0ee-4c64-ae35-eaefd27c7847 |
| Name           | the_key                                                                      |
| Created        | 2023-01-12 02:19:09+00:00                                                    |
| Status         | ACTIVE                                                                       |
| Type           | rsa                                                                          |
| Public Key     | http://192.168.77.15:9311/v1/secrets/450d59de-1de1-4aea-a444-d1351baa5652    |
| Private Key    | http://192.168.77.15:9311/v1/secrets/be0f2005-edc0-43ae-800c-424e830f639a    |
| PK Passphrase  | None                                                                         |
| Consumers      | None                                                                         |
+----------------+------------------------------------------------------------------------------+




## openstack secret container delete 
openstack secret container delete 1cf6377c-3c5c-42d4-98f4-e3e6a9aea740 --debug
curl -X DELETE \
http://192.168.77.15:9311/v1/containers/1cf6377c-3c5c-42d4-98f4-e3e6a9aea740 \
-H "X-Auth-Token: $token"




ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCPf1zoZkEtE5ygtTduifexsPQYi0f0UU+R6LLEnXYw1HTb/Iryj4onBkG3uYemxJ/5cDoOlt0zhKnuRmNiVQaTJybuMKo5kKKYJLDPUD2gzHy2Y9/VK2RVug0RcP6wRRo6XnwqtoHsZGVjcyrRNmES9ycparnEqAjhSvG6yDRNymUUXw4E2Jf83fp2S9+p/RKtZoWtf5pFrgxguSYXrd2bj1HIEfQ2VO6BHhNvo80cmOAEZIs81eIP2aL/E5GkrRtsE+zEadvGCWeZ66X3JKLjEGiUIAgcDNK2oBgfWWe4fpSXYssfpX7m3tplQov0hQi7junwE7LnsGqyNuau6ASP

[rocky@deneil-control-node ~]$ openstack secret get --payload http://192.168.77.15:9311/v1/secrets/450d59de-1de1-4aea-a444-d1351baa5652
+---------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Field   | Value                                                                                                                                                                                                                                                                                                                                                                                        |
+---------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Payload | ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCPf1zoZkEtE5ygtTduifexsPQYi0f0UU+R6LLEnXYw1HTb/Iryj4onBkG3uYemxJ/5cDoOlt0zhKnuRmNiVQaTJybuMKo5kKKYJLDPUD2gzHy2Y9/VK2RVug0RcP6wRRo6XnwqtoHsZGVjcyrRNmES9ycparnEqAjhSvG6yDRNymUUXw4E2Jf83fp2S9+p/RKtZoWtf5pFrgxguSYXrd2bj1HIEfQ2VO6BHhNvo80cmOAEZIs81eIP2aL/E5GkrRtsE+zEadvGCWeZ66X3JKLjEGiUIAgcDNK2oBgfWWe4fpSXYssfpX7m3tplQov0hQi7junwE7LnsGqyNuau6ASP |
|         |                                                                                                                                                                                                                                                                                                                                                                                              |
+---------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+








## generic secret container
token=`openstack token issue | grep "| id" | awk '{print $4}'`
curl -X POST \
http://192.168.77.15:9311/v1/containers/ \
-H "Content-Type: application/json" \
-H "X-Auth-Token: $token" \
-d '
{
    "name": "the_key", 
    "type": "generic", 
    "secret_refs": [
        {
            "name": "private_key", 
            "secret_ref": "http://192.168.77.15:9311/v1/secrets/be0f2005-edc0-43ae-800c-424e830f639a"
        }, 
        {
            "name": "public_key", 
            "secret_ref": "http://192.168.77.15:9311/v1/secrets/450d59de-1de1-4aea-a444-d1351baa5652"
        }
        ]
}'

http://192.168.77.15:9311/v1/containers/d3234a6e-99ba-4e7d-a54b-fd4c87d5d556

curl -X GET \
http://192.168.77.15:9311/v1/containers/d3234a6e-99ba-4e7d-a54b-fd4c87d5d556 \
-H "Accept: application/json" \
-H "X-Auth-Token: $token"
{
    "created": "2023-01-12T03:00:07", 
    "updated": "2023-01-12T03:00:07", 
    "status": "ACTIVE", 
    "name": "the_key", 
    "type": "generic", 
    "creator_id": "b0522483156240dea3348a31c0144693", 
    "secret_refs": 
    [
        {
            "name": "public_key", 
            "secret_ref": "http://192.168.77.15:9311/v1/secrets/450d59de-1de1-4aea-a444-d1351baa5652"
        }, 
        {
            "name": "private_key", 
            "secret_ref": "http://192.168.77.15:9311/v1/secrets/be0f2005-edc0-43ae-800c-424e830f639a"
        }
    ], 
    "consumers": [], 
    "container_ref": "http://192.168.77.15:9311/v1/containers/d3234a6e-99ba-4e7d-a54b-fd4c87d5d556"
}



curl -X GET \
http://192.168.77.15:9311/v1/containers/96078e0d-d0ee-4c64-ae35-eaefd27c7847 \
-H "Accept: application/json" \
-H "X-Auth-Token: $token"

{
    "created": "2023-01-12T02:19:09", 
    "updated": "2023-01-12T02:19:09", 
    "status": "ACTIVE", 
    "name": "the_key", 
    "type": "rsa", 
    "creator_id": "b0522483156240dea3348a31c0144693", 
    "secret_refs": 
    [
        {
            "name": "public_key", 
            "secret_ref": "http://192.168.77.15:9311/v1/secrets/450d59de-1de1-4aea-a444-d1351baa5652"
        }, 
        {
            "name": "private_key", 
            "secret_ref": "http://192.168.77.15:9311/v1/secrets/be0f2005-edc0-43ae-800c-424e830f639a"
        }
    ], 
    "consumers": [], 
    "container_ref": "http://192.168.77.15:9311/v1/containers/96078e0d-d0ee-4c64-ae35-eaefd27c7847"
}



### 測試是否能夠專一性刪除或新增secret container下的secret
## 官方API說明 只支援 genertic type secret container 但要實驗一下


curl -X DELETE \
http://192.168.77.15:9311/v1/containers/96078e0d-d0ee-4c64-ae35-eaefd27c7847/secrets \
-H "Accept: application/json" \
-H "X-Auth-Token: $token" \
-d '
{
            "name": "public_key", 
            "secret_ref": "http://192.168.77.15:9311/v1/secrets/450d59de-1de1-4aea-a444-d1351baa5652"
        }'

{"code": 400, "title": "Bad Request", "description": "Malformed JSON"}
## rsa type secret container 刪除失敗



curl -X DELETE \
http://192.168.77.15:9311/v1/containers/d3234a6e-99ba-4e7d-a54b-fd4c87d5d556/secrets \
-H "Accept: application/json" \
-H "X-Auth-Token: $token" \
-d '{
    "name": "public_key", 
    "secret_ref": "http://192.168.77.15:9311/v1/secrets/450d59de-1de1-4aea-a444-d1351baa5652"
}'







DELETE /v1/containers/{container_uuid}/secrets
Headers:
    X-Project-Id: {project_id}

Content:
{
    "name": "private key",
    "secret_ref": "https://{barbican_host}/v1/secrets/{secret_uuid}"
}




POST /v1/containers/{container_uuid}/secrets
Headers:
    X-Project-Id: {project_id}

Content:
{
    "name": "private_key",
    "secret_ref": "https://{barbican_host}/v1/secrets/{secret_uuid}"
}


[root@deneil-barbican-test-non-keystone rocky]# 
curl \
-X PUT http://localhost:9311/v1/secrets/190e2401-699c-4266-b9af-d02cd0cde08f/metadata \
-H "Content-Type: application/json" \
-H "X-Auth-Token: $token" \
-d '{
  "metadata": {
      "description": "contains the rsa key",
      "geolocation": "test",
      "testing": "test"
    }
}'

{"metadata_ref": "http://localhost:9311/v1/secrets/190e2401-699c-4266-b9af-d02cd0cde08f/metadata"}


token=`openstack token issue | grep "| id" | awk '{print $4}'`

curl -X GET \
http://192.168.77.15:9311/v1/secrets/be0f2005-edc0-43ae-800c-424e830f639a/metadata \
-H "Content-Type: application/json" \
-H "X-Auth-Token: $token"

curl \
-X PUT http://192.168.77.15:9311/v1/secrets/be0f2005-edc0-43ae-800c-424e830f639a/metadata \
-H "Content-Type: application/json" \
-H "X-Auth-Token: $token" \
-d '{
  "metadata": {
      "description": "This is self-upload private key",
      "testing": "test"
    }
}'

{"metadata_ref": "http://192.168.77.15:9311/v1/secrets/be0f2005-edc0-43ae-800c-424e830f639a/metadata"}








token=`openstack token issue | grep " id " | awk '{print $4}'`

curl -X PUT \
http://127.0.0.1:9311/v1/containers/f2fb967d-2b11-43c4-a854-ed1cc1eebe85/metadata \
-H "Content-Type: application/json" \
-H "X-Auth-Token: $token" \
-d '{
  "metadata": {
      "description": "This is self-upload private key",
      "testing": "test"
    }
}'


curl -X GET \
http://127.0.0.1:9311/v1/containers/f2fb967d-2b11-43c4-a854-ed1cc1eebe85/metadata \
-H "Content-Type: application/json" \
-H "X-Auth-Token: $token"


token="gAAAAABkrfkXcfy-0wM07n5qm4PkVQyCc4gtByW_-kab8FDjGZ3pmECKQISfPNwPgWJlzIpmsEgGzbrslWsDtqzh_im9WrpJ1ksv-pw58lxqYj4RAo3FgBACl2mLrepL5pzPc0KrO9zLH2KADTS3aZfCgePSRTF5Am28PywkJbPj4uxFq2uXDK8"



```









## ##############################
## Quota
## customer
```bash


POST {container_ref}/consumers
Headers:
    X-Auth-Token: <token>
    Content-Type: application/json

Content:
{
    "name": "ConsumerName",
    "url": "ConsumerURL"
}







```
























# openstack secret order create
```bash


openstack secret order create key --name 'admin-create-asy-test' --bit-length 256 --algorithm aes

openstack secret order create key --name 'order-create-asy-test' --bit-length 256 --algorithm aes



openstack secret order get http://192.168.60.200:9311/v1/orders/1275f8f8-868f-40b4-b365-9064f49af71d

curl -X GET "http://192.168.60.200:9311/v1/secrets/d3a5c932-5950-447f-8f4d-df048f150ab4/payload" -H "X-Auth-Token: $token"

curl -X GET "http://192.168.60.200:9311/v1/secrets?limit=100" -H "X-Auth-Token: $token"

curl -X GET "http://192.168.60.200:9311/v1/secrets/e62bc8fb-e5e3-43bc-bd00-234fb97d0edd/payload" -H "X-Auth-Token: $token"

http://192.168.60.200:9311/v1/secrets/

openstack secret order create asymmetric --name 'secret-asy-test' --bit-length 2048 --algorithm rsa --debug

token=`openstack token issue | grep " id " | awk '{print $4}'`


curl \
-X POST http://192.168.77.15:9311/v1/orders/ \
-H "Content-Type: application/json" \
-H "X-Auth-Token: $token" \
-d '{
    "type": "asymmetric", 
    "meta": 
        {
            "name": "create-by-json", 
            "algorithm": "rsa", 
            "bit_length": 2048, 
            "payload_content_type": "application/octet-stream"
        }
    }'


curl \
-X POST http://127.0.0.1:9311/v1/orders/ \
-H "Content-Type: application/json" \
-H "X-Auth-Token: $token" \
-d '{
    "type": "asymmetric", 
    "meta": 
        {
            "name": "create-by-json", 
            "algorithm": "rsa", 
            "bit_length": 2048, 
            "payload_content_type": "application/octet-stream"
        }
    }'
{"order_ref": "http://127.0.0.1:9311/v1/orders/320cf201-e2ea-4838-a0dd-c9d3b8c069cb"}

curl \
-X POST http://127.0.0.1:9311/v1/orders/ \
-H "Content-Type: application/json" \
-H "X-Auth-Token: $token" \
-d '{
    "type": "asymmetric", 
    "meta": 
        {
            "name": "test text/plain", 
            "algorithm": "rsa", 
            "bit_length": 2048, 
            "payload_content_type": "text/plain"
        }
    }'
{"order_ref": "http://127.0.0.1:9311/v1/orders/ca9f8596-f882-4123-aef7-5887f91a2d33"}
http://127.0.0.1:9311/v1/containers/49bd42c7-cbb0-4191-90c1-f812e0c5b187

```
## openstack secret delete http://localhost:9311/v1/secrets/6b7d995b-ab4c-4a9a-8ef9-cc00b06dafe8 --debug
```bash
curl -g -i \
-X DELETE http://127.0.0.1:9311/v1/secrets/6b7d995b-ab4c-4a9a-8ef9-cc00b06dafe8 \
-H "User-Agent: openstacksdk/0.101.0 keystoneauth1/5.0.0 python-requests/2.25.1 CPython/3.9.14" \
-H "X-Auth-Token: $token"

token=`openstack token issue | grep "| id" | awk '{print $4}'`
curl -g -i \
-X DELETE http://localhost:9311/v1/secrets/a203273f-d3f3-4653-8092-823ba9bee4c0 \
-H "User-Agent: openstacksdk/0.101.0 keystoneauth1/5.0.0 python-requests/2.25.1 CPython/3.9.14" \
-H "X-Auth-Token: $token"
```


### ########################################
### ########################################
### ########################################
## Test No Auth barbican
vim /etc/barbican/barbican-api-paste.ini

```conf
...
# Use this pipeline for barbican API - DEFAULT no authentication
[pipeline:barbican_api]
pipeline = unauthenticated-context apiapp

...
[composite:main]
use = egg:Paste#urlmap
/: barbican_version
/v1: barbican_api
...
```


```bash
systemctl restart --now openstack-barbican-api

```



```bash
[rocky@deneil-barbican-test-non-keystone ~]$ openstack project list
+----------------------------------+---------+
| ID                               | Name    |
+----------------------------------+---------+
| 0fc5f921d344427dab84955084d6d2f2 | service |
| 9271700a53b145099b2dec8ac2b2d650 | admin   |
+----------------------------------+---------+
```

```bash
project_id="9271700a53b145099b2dec8ac2b2d650"

curl -g -i -X GET http://127.0.0.1:9311/v1/secrets?sort=created:desc -H "Accept: application/json" -H "X-Project-Id: $project_id"

curl -g -i \
-X GET "http://192.168.77.15:9311/v1/orders?limit=10&offset=0" \
-H "Accept: application/json" \
-H "User-Agent: openstacksdk/0.101.0 keystoneauth1/5.0.0 python-requests/2.25.1 CPython/3.9.14" \
-H "X-Project-Id: $project_id"

-H "X-Auth-Token: $token"

```

curl -g -i \
-X GET http://localhost:9311/v1/secrets/b153d081-a830-4ccc-a09e-e30a1fdcb0ce \
-H "Accept: application/json" \
-H "X-Project-Id: $project_id"



### 

```bash
############# 
############# orders
############# 
## openstack secrets orders list
curl -X GET http://127.0.0.1:9311/v1/orders -H "X-Project-Id: $project_id"

## openstack secrets orders delete
curl -X DELETE http://localhost:9311/v1/orders/00e2652f-5e84-431f-a5e7-ff31fcee4345 -H "X-Project-Id: $project_id"

############# 
############# containers
############# 
## openstack secrets containers list
curl -X GET http://127.0.0.1:9311/v1/containers -H "Accept: application/json" -H "X-Project-Id: $project_id"


## openstack secrets containers get
curl -X GET http://127.0.0.1:9311/v1/containers/06e4950d-6ef6-4be3-8f4b-e635b30ed827 -H "Accept: application/json" -H "X-Project-Id: $project_id"


## openstack secrets containers delete
curl -X DELETE http://localhost:9311/v1/containers/908ea4f6-2f23-49c8-8604-f5a357bf6eee -H "X-Project-Id: $project_id"


############# 
############# secrets
############# 
## openstack secrets list
curl -X GET http://127.0.0.1:9311/v1/secrets -H "X-Project-Id: $project_id"

## openstack secret delete
curl -X DELETE http://localhost:9311/v1/secrets/ce281e0d-6cf5-4e41-8413-b3b2457ae217 -H "X-Project-Id: $project_id"


## openstack secret store
curl -g -i \
-X POST http://127.0.0.1:9311/v1/secrets/ \
-H "Content-Type: application/json" \
-H "X-Project-Id: $project_id" \
-d '{"name": "test-api-upload", 
"algorithm": "rsa", 
"mode": "", 
"bit_length": 2048, 
"secret_type": "private", 
"payload": "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQCoJ9aTaEQAfSZN\nJzf9zbV65Zu/mxrrwqPkUV1iy1vtfA9FbK9zOQuDjBjVT245LGjisSlZcWMjc1de\nF5sw7sL/mwIXg9aN4Ix1OPF0cVYVWNP2p7iIe7VxAwSeeq4Xo35LSIX34GADvjQo\nmqkkeg0DVALtaUO2J26O2WULRBBzBrMi9wZDk+dtEy+DWh8mhCf/CUlTdlxNTX50\n99u1O+2eWpxPpRPr7KPMNZRU4QYPDj3Ccx0F0iYPK4lUbY9KZhfkFV1JSj+0yY48\nByxJUYZ5GswcaDlyaXVPh2M7fDqOjs6GdBPR+qp8UVMSowxTDxX0n34ngWdoEi0r\nj6YJV1B3AgMBAAECggEAOBAgMEFA+tC+5lY/CrV83h6TUMyLqzLXpZWjBv86BPGp\nvcHAtS+9sPwSg3vaCeHOjlX2rUVqgjVAWbSRHz1bchDiH6jq7Z6B9csoZWQsCS32\nbXP5yDdGhQk2jwfj5ymxP7RMRhpeqKDPjwIRhoHSuNtXpoPD+YUoDSRZ1em5ej+k\ne9xrtqrWJOuFc/rwcL+2FMq4vtXjd0cA9Ox2WIAHr6jiMUx61DHRpdmSYLy7qU/k\nwg/VUipzw/OzXFoOMbFqCa4wncAwIsLZueW3awfTY3e8L6pYYAK8WbuI5+Qvebci\nVaCmflS92ZlwVgclF227y6kivfhCZia4fM91gtMeUQKBgQDmRyN5hMg1OAnkUO6e\npoV8ST+RlPGSyQFwFcacvgPcHgJeyeEB3CWcT4u0J4x82XAKe8dXNpXG97eG1gjA\noIv+ty01nDfUjJiX6/iv2FkiEnYh/VehbC62pGk/vfuruER5remh0CbC6+3Z263F\njM49EmsVmLNoD2Wt6zrWyPVpewKBgQC68Eu3czIuKvzYwix2r3eemv7GOw4TGsZq\n+liBArhP7dyKuv8kcr+sXKP30Rw/F4kuNxTZ6iOUp0++ifPtMu/GzCDDsLfOc+nc\nvTYwUuROPfmEhOtt73aoTu+GH9RoJrQa6WyRRyxoLlT4M50EPivQXHztYjluXV7h\nlFxf359ONQKBgQCi3EEcmmo2KVHlpc99aOwTQIKy5ZIMbBiWOvBivohgTuECROjb\nteTrrd5yJV5YljeFUpFi/vni5CNqO0mpYmJgXRCeT8O0kVMCbyNMykgPrtrZoyEs\nyyQmjBTbvfOWORZEsFkB1gLz7IQlhhZaFwFtc+9EMOEBgZI59JmCelIGrQKBgQCM\njjigCqFkTTYn1HeSFYSfYHLHoYeHnc4qiWkaN21Vy8bTGJ7WTOEJO+6dWkEevxeK\nBChNYNq33sT6wscBRhc7JihMewb41/ay3iFsXCcFHVwK49YQpshU7GT0N+KBHPi2\nc2QKJ7Wf75Y7uLMKiaRv2dqksgH0lYfNnLuH6p/hMQKBgF9yurywod2Hb9uTGzGS\nHLFZI44QnKpJr/kSPhyh90o/52KTlhnN3C8mJ81tLJhAOH1L7beeG2hiYyy+gQCU\n/Rejy2CpQkkyyc9AEzFcxHzluH03uwDzyLhDYZ7JweY7V8NVR073QM+wbc9oo3HU\nGUUTiasF3KtqIF3rpqAM/l0f\n-----END PRIVATE KEY-----\n", 
"payload_content_type": "text/plain" 
}'

## get secret metadata 
curl \
-X GET http://localhost:9311/v1/secrets/190e2401-699c-4266-b9af-d02cd0cde08f/metadata \
-H "Content-Type: application/json" \
-H "X-Project-Id: $project_id"


## add secret metadata (只能單筆新增)
curl \
-X POST http://localhost:9311/v1/secrets/190e2401-699c-4266-b9af-d02cd0cde08f/metadata \
-H "Content-Type: application/json" \
-H "X-Project-Id: $project_id" \
-d '{
    "key": "access-limit",
    "value": "11"
}'

## edit secret metadata 
# note : 能同時新增多筆
curl \
-X PUT http://localhost:9311/v1/secrets/190e2401-699c-4266-b9af-d02cd0cde08f/metadata \
-H "Content-Type: application/json" \
-H "X-Project-Id: $project_id" \
-d '{
  "metadata": {
      "description": "contains the rsa key",
      "geolocation": "test",
      "testing": "test"
    }
}'

## openstack secret order create asymmetric 
curl \
-X POST http://127.0.0.1:9311/v1/orders/ \
-H "Content-Type: application/json" \
-H "X-Project-Id: $project_id" \
-d '{
    "type": "asymmetric", 
    "meta": 
        {
            "name": "create-by-json", 
            "algorithm": "rsa", 
            "bit_length": 2048, 
            "payload_content_type": "application/octet-stream"
        }
    }'


```

