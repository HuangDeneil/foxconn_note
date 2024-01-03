# storage

```bash
[root@lh-testbed-control-001 ~]# openstack endpoint list | grep stor
| 2c87c949c06e4191a995a88028ee1957 | RegionOne | swift                                                         | object-store         | True    | internal  | http://192.168.9.201:80/swift/v1                           |
| 6dfe97fc670949cba98adc77f06d442e | RegionOne | ff82fb8c-9960-4e69-be14-781a2e00e60f.images                   | storage-admin-image  | True    | admin     | http://192.168.9.200:7788                                  |
| a75871e8ed934525a79c72637d87acc2 | RegionOne | 9bf375a7-5675-4969-99fe-20127deec860.volumessata              | storage-admin-block  | True    | admin     | http://192.168.9.200:7488                                  |
| aa18fa722b9c494189a84135549c0177 | RegionOne | 704676cc-c9ce-41d5-9ad5-e9060ef416f5.volumesssd               | storage-admin-block  | True    | admin     | http://192.168.9.200:7489                                  |
| ae42f54b235b4b6881c37b5b354f01eb | RegionOne | 9bf375a7-5675-4969-99fe-20127deec860.default.rgw.buckets.data | object-store-s3      | True    | public    | https://fibo-fixo-6-lh.fixo.cloud                          |
| c02fcd8ca9c14db6bdfbaaac79d89db5 | RegionOne | 9bf375a7-5675-4969-99fe-20127deec860.default.rgw.buckets.data | storage-admin-object | True    | admin     | http://192.168.9.200:7488                                  |
| e380e84531c54dafadd60553833bf1e0 | RegionOne | swift                                                         | object-store         | True    | public    | http://fibo-fixo-6-lh.fixo.cloud/swift/v1                  |
| e4e5d71d2cf34c7fb31c018f1ad01f32 | RegionOne | swift                                                         | object-store         | True    | admin     | http://192.168.9.201:80/swift/v1                           |



### 
token=`openstack token issue | grep " id " | awk '{print $4}'`

curl -X GET -i $publicURL?format=json -H "X-Auth-Token: $token"
curl -X GET http://192.168.9.201:80/swift/v1?format=json -H "X-Auth-Token: $token"
curl -X GET http://192.168.9.201:80/swift/v1/endpoints

swift list --debug
# /v1/{account}
curl -X GET http://fibo-fixo-6-lh.fixo.cloud/swift/v1?format=json -H "X-Auth-Token: $token"
curl -X GET http://fibo-fixo-6-lh.fixo.cloud/swift/v1?format=json -H "X-Auth-Token: $token" | python -m json.tool
curl -X GET "http://fibo-fixo-6-lh.fixo.cloud/swift/v1" -H "Content-Type: application/json" -H "X-Auth-Token:$token" 

curl -X GET http://fibo-fixo-6-lh.fixo.cloud/swift/v1?format=json&marker=testdockerhub-cqilhyqdy56m -H "Accept-Encoding: gzip" -H "X-Auth-Token: $token"
curl -X GET "http://fibo-fixo-6-lh.fixo.cloud/swift/v1?format=json&marker=testdockerhub-cqilhyqdy56m" -H "X-Auth-Token: $token"
curl -X GET "http://fibo-fixo-6-lh.fixo.cloud/swift/v1?format=json&marker=testdockerhub-cqilhyqdy56m" -H "X-Auth-Token: $token" | python -m json.tool
curl -X GET "http://fibo-fixo-6-lh.fixo.cloud/swift/v1?format=json&marker=testdockerhub-cqilhyqdy56m" -H "Accept-Encoding: gzip" -H "X-Auth-Token:$token" | python -m json.tool


curl -X GET "http://fibo-fixo-6-lh.fixo.cloud/swift/v1" -H "Accept-Encoding: gzip" -H "X-Auth-Token:$token" \
-d '{
    'format' : "json"
}' | python -m json.tool



curl -i -X GET "http://fibo-fixo-6-lh.fixo.cloud/swift/v1?name=testdockerhub-cqilhyqdy56m" -H "X-Auth-Token:$token" 
-H "Content-Type: application/json" \
-d '{
    'format' : "json",
    'marker' : "testdockerhub-cqilhyqdy56m"
}' | python -m json.tool




#  swift delete testdockerhub-cqilhyqdy56m --debug

curl -X DELETE http://fibo-fixo-6-lh.fixo.cloud/swift/v1/testdockerhub-cqilhyqdy56m -H "X-Auth-Token: $token"
curl -X DELETE http://fibo-fixo-6-lh.fixo.cloud/swift/v1/deneil-test -H "X-Auth-Token: $token"
curl -X DELETE http://fibo-fixo-6-lh.fixo.cloud/swift/v1/deneiltest1-g7ylvlav5veq -H "X-Auth-Token: $token"
curl -X DELETE http://fibo-fixo-6-lh.fixo.cloud/swift/v1/deneiltest2-dnk2nagd3aci -H "X-Auth-Token: $token"

deneil-test




```



## FiBo S3

```bash

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





openstack secret store --name="test-sse_key" --payload="qTBJCqDmqcXYlCwhhmwTt0FQtaLxeSVLKQ4MusDI+0o=" --pay
load-content-type="application/octet-stream" --payload-content-encoding='base64'


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



# s3cmd ls [s3://BUCKET[/PREFIX]]
s3cmd -c /home/deneil/deneil@S3.cnfg ls s3://1-test-s3-upload/deneil-test-s3.txt

# s3cmd get s3://BUCKET/OBJECT LOCAL_FILE
s3cmd -c /home/deneil/deneil@S3.cnfg get s3://1-test-s3-upload/deneil-test-s3.txt test.txt




s3cmd -c /home/amingo/amingo.km.lin@foxconn.com.cnfg get s3://1-test-s3-upload/deneil-test-s3.txt test-2.txt















### 
### 測試 barbican consumer 資訊
###
token=`openstack token issue -c id -f value`

token=`openstack token issue | grep " id " | awk '{print $4}'`


curl -X GET 192.168.60.200:9311/v1/secrets/6f6c6bf1-9962-4b51-b007-782fd07e836c -H "X-Auth-Token: $token" | python -m json.tool
curl -X GET 192.168.60.200:9311/v1/secrets/6f6c6bf1-9962-4b51-b007-782fd07e836c/consumers -H "X-Auth-Token: $token" | python -m json.tool


## 沒有加comsumer
curl -X GET http://192.168.60.200:9311/v1/secrets/6f6c6bf1-9962-4b51-b007-782fd07e836c/consumers -H "X-Auth-Token: $token" | python -m json.tool
{
    "code": 405,
    "description": "",
    "title": "Method Not Allowed"
}

curl -X POST 192.168.60.200:9311/v1/secrets/6f6c6bf1-9962-4b51-b007-782fd07e836c/consumers \
-H "Content-Type: application/json" \
-H "X-Auth-Token: $token" \
-d '{
    "service": "object-store",
    "resource_type": "object-store-s3",
    "resource_id": "1-test-s3-upload"
}'


openstack object list 1-test-s3-upload
openstack object show 1-test-s3-upload deneil-test-s3.txt

https://fibo-dct-tb.fixo.cloud/deneiltestfibo

```

















