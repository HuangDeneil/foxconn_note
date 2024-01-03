

- Generate key
    - Create an symmetric key
        - `openstack secret order create key --name 'secret-key-001'`
    - Create an asymmetric key
        - `openstack secret order create asymmetric --name 'secret-asy-001' --mode ctr --bit-length 1024 --algorithm rsa`


```bash
openstack secret order create asymmetric --name '20230822-deneil-test-2' --bit-length 2048 --algorithm rsa 
```

- admin :
 +-----------+---------------------+---------------+
 |  LEVEL    |    cannot exec      |   can exec    | 
 +-----------+---------------------+---------------+
 | order     | list & get & delete |               |
 | container | list & delete       |   can get     |
 | secret    | list & delete       |   can get     |
 +-----------+---------------------+---------------+


```bash
[root@dct-queens-ctl-001 ~]# openstack secret order create -h
usage: openstack secret order create [-h] [-f {json,shell,table,value,yaml}]
                                     [-c COLUMN] [--max-width <integer>]
                                     [--fit-width] [--print-empty]
                                     [--noindent] [--prefix PREFIX]
                                     [--name NAME] [--algorithm ALGORITHM]
                                     [--bit-length BIT_LENGTH] [--mode MODE]
                                     [--payload-content-type PAYLOAD_CONTENT_TYPE]
                                     [--expiration EXPIRATION]
                                     [--request-type REQUEST_TYPE]
                                     [--subject-dn SUBJECT_DN]
                                     [--source-container-ref SOURCE_CONTAINER_REF]
                                     [--ca-id CA_ID] [--profile PROFILE]
                                     [--request-file REQUEST_FILE]
                                     type

Create a new order.

positional arguments:
  type                  the type of the order (key, asymmetric, certificate)
                        to create.

optional arguments:
  -h, --help            show this help message and exit
  --name NAME, -n NAME  a human-friendly name.
  --algorithm ALGORITHM, -a ALGORITHM
                        the algorithm to be used with the requested key
                        (default: aes).
  --bit-length BIT_LENGTH, -b BIT_LENGTH
                        the bit length of the requested secret key (default:
                        256).
  --mode MODE, -m MODE  the algorithm mode to be used with the requested key
                        (default: cbc).
  --payload-content-type PAYLOAD_CONTENT_TYPE, -t PAYLOAD_CONTENT_TYPE
                        the type/format of the secret to be generated
                        (default: application/octet-stream).
  --expiration EXPIRATION, -x EXPIRATION
                        the expiration time for the secret in ISO 8601 format.
  --request-type REQUEST_TYPE
                        the type of the certificate request.
  --subject-dn SUBJECT_DN
                        the subject of the certificate.
  --source-container-ref SOURCE_CONTAINER_REF
                        the source of the certificate when using stored-key
                        requests.
  --ca-id CA_ID         the identifier of the CA to use for the certificate
                        request.
  --profile PROFILE     the profile of certificate to use.
  --request-file REQUEST_FILE
                        the file containing the CSR.

output formatters:
  output formatter options

  -f {json,shell,table,value,yaml}, --format {json,shell,table,value,yaml}
                        the output format, defaults to table
  -c COLUMN, --column COLUMN
                        specify the column(s) to include, can be repeated

table formatter:
  --max-width <integer>
                        Maximum display width, <1 to disable. You can also use
                        the CLIFF_MAX_TERM_WIDTH environment variable, but the
                        parameter takes precedence.
  --fit-width           Fit the table to the display width. Implied if --max-
                        width greater than 0. Set the environment variable
                        CLIFF_FIT_WIDTH=1 to always enable
  --print-empty         Print empty table if there is no data to show.

json formatter:
  --noindent            whether to disable indenting the JSON

shell formatter:
  a format a UNIX shell can parse (variable="value")

  --prefix PREFIX       add a prefix to all variable names

This command is provided by the python-barbicanclient plugin.



```




- 但是建立後 皆是顯示 url
    
```bash
[root@dct-queens-ctl-001 ~]# openstack secret order list
+---------------------------------------------------------------------------+------+----------------+----------------------------------------------------------------------------+---------------------------+--------+------------+---------------+
| Order href                                                                | Type | Container href | Secret href                                                                | Created                   | Status | Error code | Error message |
+---------------------------------------------------------------------------+------+----------------+----------------------------------------------------------------------------+---------------------------+--------+------------+---------------+
| http://192.168.60.200:9311/v1/orders/d04b734b-f822-4a2d-b768-29b8319f295c | Key  | N/A            | http://192.168.60.200:9311/v1/secrets/901773db-a331-4925-9ad5-7a61bf0bfb5f | 2022-11-17T02:13:32+00:00 | ACTIVE | None       | None          |
+---------------------------------------------------------------------------+------+----------------+----------------------------------------------------------------------------+---------------------------+--------+------------+---------------+ 
    
[root@dct-queens-ctl-001 ~]# openstack secret order get http://192.168.60.200:9311/v1/orders/d04b734b-f822-4a2d-b768-29b8319f295c
+----------------+----------------------------------------------------------------------------+
| Field          | Value                                                                      |
+----------------+----------------------------------------------------------------------------+
| Order href     | http://192.168.60.200:9311/v1/orders/d04b734b-f822-4a2d-b768-29b8319f295c  |
| Type           | Key                                                                        |
| Container href | N/A                                                                        |
| Secret href    | http://192.168.60.200:9311/v1/secrets/901773db-a331-4925-9ad5-7a61bf0bfb5f |
| Created        | 2022-11-17T02:13:32+00:00                                                  |
| Status         | ACTIVE                                                                     |
| Error code     | None                                                                       |
| Error message  | None                                                                       |
+----------------+----------------------------------------------------------------------------+
 ```
    
- note : 192.168.60.200 是net-001 ，但是







```bash


f0bef9fee4e3bcaabae2a0c02d07d52527b2c3e66ca4a044963b73c42f91fbd191e119cfa9201edc64ed6dad15f0af64845eb5ed3b1a5809fb922d9842516628


# user
1e4c99ca5b2a4fcd98d3663e8e10228a
# project
cfdc857f42274e2ea6b30dd844e23ca5


openstack role assignment list | grep cfdc857f42274e2ea6b30dd844e23ca5



for i in `openstack role assignment list | grep cfdc857f42274e2ea6b30dd844e23ca5 | awk '{print $2}'`
do
    rolename=`openstack role list | grep $i | awk '{print $4}' `
    echo -e "$i $rolename"
done


openstack secret order create asymmetric --name 'test-keypair' --bit-length 2048 --algorithm rsa



export OS_PROJECT_DOMAIN_ID=default
export OS_USER_DOMAIN_ID=default
export OS_PROJECT_NAME=deneil.yz.huang@foxconn.com_20221109
export OS_USERNAME=deneil.yz.huang@foxconn.com_674e
export OS_PASSWORD=f0bef9fee4e3bcaabae2a0c02d07d52527b2c3e66ca4a044963b73c42f91fbd191e119cfa9201edc64ed6dad15f0af64845eb5ed3b1a5809fb922d9842516628
export OS_AUTH_URL=http://192.168.60.200:35357/v3
export OS_IDENTITY_API_VERSION=3
export OS_IMAGE_API_VERSION=2
export OS_AUTH_VERSION=3
export OS_AUTH_TYPE=password
export OS_REGION_NAME=RegionOne


token=`openstack token issue | grep " id " | awk '{print $4}' `

curl -X POST http://osapi.dct-tb.fixo.cloud:9311/v1/orders/ \
-H "Content-Type: application/json" \
-H "X-Auth-Token: $token" \
-d '{
  "meta": 
  {
    "name": "test-symmetric key", 
    "mode": "cbc", 
    "bit_length": 256, 
    "algorithm": "aes", 
    "payload_content_type": "application/octet-stream"
  }, 
  "type": "key"
}'



curl -X POST http://192.168.60.200:9311/v1/containers/ \
-H "Content-Type: application/json" \
-H "X-Auth-Token: $token" \
-d '
{
 "name": "object_key",
 "type": "generic",
 "secret_refs": [
   {
      "name": "sse_key",
      "secret_ref": "http://192.168.60.200:9311/v1/secrets/1e41a775-add0-4214-ab6d-bcd9751bef5b"
   } 
   ]
}'

curl -X GET http://192.168.60.200:9311/v1/secrets/f7c79909-202b-4c5f-a0b4-89445fcb1724 -H "X-Auth-Token: $token" | python -m json.tool

{
    "algorithm": "aes",
    "bit_length": 256,
    "content_types": {
        "default": "application/octet-stream"
    },
    "created": "2023-09-21T07:29:08",
    "creator_id": "e9c8e161a8a44544b3bfd734eebb3ba1",
    "expiration": null,
    "mode": "cbc",
    "name": "order-create-asy-test",
    "secret_ref": "http://192.168.60.200:9311/v1/secrets/f7c79909-202b-4c5f-a0b4-89445fcb1724",
    "secret_type": "symmetric",
    "status": "ACTIVE",
    "updated": "2023-09-21T07:29:08"
}



## create radosgw account 
radosgw-admin key create --uid=${OPSK_project_uuid} --key-type=s3 --gen-access-key --gen-secret

ssh dct-queens-fixo-stor-001
## cfdc857f42274e2ea6b30dd844e23ca5 | deneil.yz.huang@foxconn.com_20221109
radosgw-admin key create --uid=cfdc857f42274e2ea6b30dd844e23ca5 --key-type=s3 --gen-access-key --gen-secret

[root@dct-queens-fixo-stor-001 ~]# radosgw-admin key create --uid=cfdc857f42274e2ea6b30dd844e23ca5 --key-type=s3 --gen-access-key --gen-secret
{
    "user_id": "cfdc857f42274e2ea6b30dd844e23ca5",
    "display_name": "deneil.yz.huang@foxconn.com_20221109",
    "email": "",
    "suspended": 0,
    "max_buckets": 1000,
    "subusers": [],
    "keys": [
        {
            "user": "cfdc857f42274e2ea6b30dd844e23ca5",
            "access_key": "GMJ4W0T2TMP47EC4PA5Q",
            "secret_key": "UYc7pVlK7jF103udAOKILmX6DCDVwRvpODZu1EAh"
        },
        {
            "user": "cfdc857f42274e2ea6b30dd844e23ca5",
            "access_key": "R35YLHKJV9558JRUK3GE",
            "secret_key": "oFVh9r5RUoWAvUaZjmLWDAp88TvpjNx3h5Y9sDOD"
        }
    ],
    "swift_keys": [],
    "caps": [],
    "op_mask": "read, write, delete",
    "default_placement": "",
    "default_storage_class": "",
    "placement_tags": [],
    "bucket_quota": {
        "enabled": false,
        "check_on_raw": false,
        "max_size": -1,
        "max_size_kb": 0,
        "max_objects": -1
    },
    "user_quota": {
        "enabled": false,
        "check_on_raw": false,
        "max_size": -1,
        "max_size_kb": 0,
        "max_objects": -1
    },
    "temp_url_keys": [
        {
            "key": 0,
            "val": "b3968d0207b54ece87cccc06515a89d4"
        }
    ],
    "type": "keystone",
    "mfa_ids": []
}





openstack secret store --name="test-sse_key" --payload="qTBJCqDmqcXYlCwhhmwTt0FQtaLxeSVLKQ4MusDI+0o=" --payload-content-type="application/octet-stream" --payload-content-encoding='base64'


## [未測試]
s3cmd -c /home/deneil/deneil@S3.cnfg \
--server-side-encryption-kms-id=6f6c6bf1-9962-4b51-b007-782fd07e836c put /home/deneil/deneil-test-s3.txt s3://cfdc857f42274e2ea6b30dd844e23ca5-DeneilTest/amingo-user-A_encryption.txt
upload: '/home/amingo/amingo-user-a.txt' -> 's3://969810259a1042208bc20931c8224b7a-amingoTest/amingo-user-A_encryption.txt'

## [成功]
s3cmd -c /home/deneil/deneil@S3.cnfg \
--server-side-encryption-kms-id=6f6c6bf1-9962-4b51-b007-782fd07e836c put /home/deneil/deneil-test-s3.txt s3://1-test-s3-upload/deneil-test-s3.txt

## 檢查加密是否有成功
s3cmd -c /home/deneil/deneil@S3.cnfg info s3://1-test-s3-upload/deneil-test-s3.txt
[root@dct-queens-fixo-stor-001 deneil]# s3cmd -c /home/deneil/deneil@S3.cnfg info s3://1-test-s3-upload/deneil-test-s3.txt
s3://1-test-s3-upload/deneil-test-s3.txt (object):
   File size: 19
   Last mod:  Sat, 23 Sep 2023 07:23:50 GMT
   MIME type: text/plain
   Storage:   STANDARD
   MD5 sum:   5fa30f48d708215287718a3a4d8cd572
   SSE:       aws:kms
   Policy:    {"Version":"2012-10-17","Statement":[{"Sid":"PublicReadWrite","Effect":"Allow","Principal":"*","Action":["s3:GetObject","s3:GetObjectVersion","s3:PutObject"],"Resource":["arn:aws:s3:::1-test-s3-upload/*"]}]}
   CORS:      none
   ACL:       deneil.yz.huang@foxconn.com_20221109: FULL_CONTROL
   x-amz-meta-s3cmd-attrs: atime:1695453791/ctime:1695452959/gid:0/gname:root/md5:5fa30f48d708215287718a3a4d8cd572/mode:33188/mtime:1695452959/uid:0/uname:root


token=`openstack token issue | grep " id " | awk '{print $4}'`

curl -X GET http://192.168.77.15:9311/v1/secrets/10bb44b6-77b1-42f5-960b-958bbf542588/consumers -H "X-Auth-Token: $token" | python -m json.tool

curl -X GET http://192.168.77.15:9311/v1/secrets/10bb44b6-77b1-42f5-960b-958bbf542588/payload -H "X-Auth-Token: $token" | base64



http://192.168.60.200:9311/v1/secrets/6f6c6bf1-9962-4b51-b007-782fd07e836c

## 沒有加comsumer
curl -X GET http://192.168.60.200:9311/v1/secrets/6f6c6bf1-9962-4b51-b007-782fd07e836c/consumers -H "X-Auth-Token: $token" | python -m json.tool
{
    "code": 405,
    "description": "",
    "title": "Method Not Allowed"
}

curl -X POST http://192.168.60.200:9311/v1/secrets/6f6c6bf1-9962-4b51-b007-782fd07e836c/consumers -H "X-Auth-Token: $token" -d '{
    "service": "d68ac620-6261-49bf-bbad-ef792ccb5270.default.rgw.buckets.data",
    "resource_type": "object-store-s3",
    "resource_id": "671418f6c2634d6194c260a6cd419c9b"
}'

curl -X GET http://192.168.60.200:9311/v1/secrets/6f6c6bf1-9962-4b51-b007-782fd07e836c/ -H "X-Auth-Token: $token" | python -m json.tool


token=`openstack token issue | grep " id " | awk '{print $4}'`
curl -X POST http://192.168.60.200:9311/v1/secrets/6f6c6bf1-9962-4b51-b007-782fd07e836c/consumers \
-H "X-Auth-Token: $token" \
-H "Content-Type: application/json" \
-d '{
    "service": "object-store",
    "resource_type": "object-store",
    "resource_id": "671418f6c2634d6194c260a6cd419c9b"
}'



https://fibo-dct-tb.fixo.cloud/deneiltestfibo



## Add SSE to container
curl -X POST http://192.168.60.200:9311/v1/containers/ \
-H "Content-Type: application/json" \
-H "X-Auth-Token: $token" \
-d '
{
 "name": "object_key",
 "type": "generic",
 "secret_refs": [
   {
      "name": "sse_key",
      "secret_ref": "http://192.168.60.200:9311/v1/secrets/6f6c6bf1-9962-4b51-b007-782fd07e836c"
   } 
   ]
}'


{"container_ref": "http://192.168.60.200:9311/v1/containers/a5962dbd-538f-4183-bbca-17675c6ed819"}

# POST {container_ref}/consumers
Headers:
    X-Auth-Token: <token>
    Content-Type: application/json

Content:
{
    "name": "ConsumerName",
    "url": "ConsumerURL"
}

curl -X POST http://192.168.60.200:9311/v1/containers/a5962dbd-538f-4183-bbca-17675c6ed819/consumers \
-H "Content-Type: application/json" \
-H "X-Auth-Token: $token" \
-d '
{
    "name": "object-store",
    "URL": "s3://1-test-s3-upload"
}'


curl -X GET http://192.168.60.200:9311/v1/containers/19391086-4c44-47fa-b4ac-f42b18d39cc7/consumers -H "X-Auth-Token: $token"


curl -X GET http://192.168.60.200:9311/v1/containers/a5962dbd-538f-4183-bbca-17675c6ed819/consumers -H "X-Auth-Token: $token"



curl -X GET http://192.168.60.200:9311/v1/containers -H "X-Auth-Token: $token" | python -m json.tool


## LBS
8bc74f69-4865-41e9-ad26-a8a27ea8a575
1a43481d-d107-4109-b817-6ae5ad3221f3

# deneil-vm
f8f83ef2-8bd2-4856-8be5-a1231c598701

## test-using-status "container"
http://192.168.60.200:9311/v1/containers/3fe3fae4-5799-4745-a17c-8a5c451d5a55


. /root/admin-openrc.sh
token=`openstack token issue | grep " id " | awk '{print $4}'`

curl -X POST http://192.168.60.200:9311/v1/containers/3fe3fae4-5799-4745-a17c-8a5c451d5a55/consumers \
-H "Content-Type: application/json" \
-H "X-Auth-Token: $token" \
-d '
{
    "name": "VM",
    "URL": "http://192.168.60.200:8774/v2.1/servers/f8f83ef2-8bd2-4856-8be5-a1231c598701"
}'


```












