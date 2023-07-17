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
