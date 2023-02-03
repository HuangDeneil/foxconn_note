
[Notion](https://easy-broker-f36.notion.site/No-auth-barbican-803a1c740d584d23b995aa59712049d6)

```bash
token=`openstack  token issue | grep "| id" | awk '{print $4}'`

curl \
-X GET "http://192.168.77.15:9311/v1/orders?limit=10&offset=0" \
-H "Accept: application/json" \
-H "X-Auth-Token: $token"


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



curl \
-X POST http://192.168.77.15:9311/v1/secrets/ \
-H "Content-Type: application/json" \
-H "X-Auth-Token: $token" \
-d '{"name": "api secret upload test", 
"algorithm": "rsa", 
"mode": "cbc", 
"bit_length": 2048, 
"secret_type": "private", 
"payload": "LS0tLS1CRUdJTiBQUklWQVRFIEtFWS0tLS0tCk1JSUV2Z0lCQURBTkJna3Foa2lHOXcwQkFRRUZBQVNDQktnd2dnU2tBZ0VBQW9JQkFRQ29KOWFUYUVRQWZTWk4KSnpmOXpiVjY1WnUvbXhycndxUGtVVjFpeTF2dGZBOUZiSzl6T1F1RGpCalZUMjQ1TEdqaXNTbFpjV01qYzFkZQpGNXN3N3NML213SVhnOWFONEl4MU9QRjBjVllWV05QMnA3aUllN1Z4QXdTZWVxNFhvMzVMU0lYMzRHQUR2alFvCm1xa2tlZzBEVkFMdGFVTzJKMjZPMldVTFJCQnpCck1pOXdaRGsrZHRFeStEV2g4bWhDZi9DVWxUZGx4TlRYNTAKOTl1MU8rMmVXcHhQcFJQcjdLUE1OWlJVNFFZUERqM0NjeDBGMGlZUEs0bFViWTlLWmhma0ZWMUpTaisweVk0OApCeXhKVVlaNUdzd2NhRGx5YVhWUGgyTTdmRHFPanM2R2RCUFIrcXA4VVZNU293eFREeFgwbjM0bmdXZG9FaTByCmo2WUpWMUIzQWdNQkFBRUNnZ0VBT0JBZ01FRkErdEMrNWxZL0NyVjgzaDZUVU15THF6TFhwWldqQnY4NkJQR3AKdmNIQXRTKzlzUHdTZzN2YUNlSE9qbFgyclVWcWdqVkFXYlNSSHoxYmNoRGlINmpxN1o2Qjljc29aV1FzQ1MzMgpiWFA1eURkR2hRazJqd2ZqNXlteFA3Uk1SaHBlcUtEUGp3SVJob0hTdU50WHBvUEQrWVVvRFNSWjFlbTVlaitrCmU5eHJ0cXJXSk91RmMvcndjTCsyRk1xNHZ0WGpkMGNBOU94MldJQUhyNmppTVV4NjFESFJwZG1TWUx5N3FVL2sKd2cvVlVpcHp3L096WEZvT01iRnFDYTR3bmNBd0lzTFp1ZVczYXdmVFkzZThMNnBZWUFLOFdidUk1K1F2ZWJjaQpWYUNtZmxTOTJabHdWZ2NsRjIyN3k2a2l2ZmhDWmlhNGZNOTFndE1lVVFLQmdRRG1SeU41aE1nMU9BbmtVTzZlCnBvVjhTVCtSbFBHU3lRRndGY2FjdmdQY0hnSmV5ZUVCM0NXY1Q0dTBKNHg4MlhBS2U4ZFhOcFhHOTdlRzFnakEKb0l2K3R5MDFuRGZVakppWDYvaXYyRmtpRW5ZaC9WZWhiQzYycEdrL3ZmdXJ1RVI1cmVtaDBDYkM2KzNaMjYzRgpqTTQ5RW1zVm1MTm9EMld0NnpyV3lQVnBld0tCZ1FDNjhFdTNjekl1S3Z6WXdpeDJyM2VlbXY3R093NFRHc1pxCitsaUJBcmhQN2R5S3V2OGtjcitzWEtQMzBSdy9GNGt1TnhUWjZpT1VwMCsraWZQdE11L0d6Q0REc0xmT2MrbmMKdlRZd1V1Uk9QZm1FaE90dDczYW9UdStHSDlSb0pyUWE2V3lSUnl4b0xsVDRNNTBFUGl2UVhIenRZamx1WFY3aApsRnhmMzU5T05RS0JnUUNpM0VFY21tbzJLVkhscGM5OWFPd1RRSUt5NVpJTWJCaVdPdkJpdm9oZ1R1RUNST2piCnRlVHJyZDV5SlY1WWxqZUZVcEZpL3ZuaTVDTnFPMG1wWW1KZ1hSQ2VUOE8wa1ZNQ2J5Tk15a2dQcnRyWm95RXMKeXlRbWpCVGJ2Zk9XT1JaRXNGa0IxZ0x6N0lRbGhoWmFGd0Z0Yys5RU1PRUJnWkk1OUptQ2VsSUdyUUtCZ1FDTQpqamlnQ3FGa1RUWW4xSGVTRllTZllITEhvWWVIbmM0cWlXa2FOMjFWeThiVEdKN1dUT0VKTys2ZFdrRWV2eGVLCkJDaE5ZTnEzM3NUNndzY0JSaGM3SmloTWV3YjQxL2F5M2lGc1hDY0ZIVndLNDlZUXBzaFU3R1QwTitLQkhQaTIKYzJRS0o3V2Y3NVk3dUxNS2lhUnYyZHFrc2dIMGxZZk5uTHVINnAvaE1RS0JnRjl5dXJ5d29kMkhiOXVUR3pHUwpITEZaSTQ0UW5LcEpyL2tTUGh5aDkwby81MktUbGhuTjNDOG1KODF0TEpoQU9IMUw3YmVlRzJoaVl5eStnUUNVCi9SZWp5MkNwUWtreXljOUFFekZjeEh6bHVIMDN1d0R6eUxoRFlaN0p3ZVk3VjhOVlIwNzNRTSt3YmM5b28zSFUKR1VVVGlhc0YzS3RxSUYzcnBxQU0vbDBmCi0tLS0tRU5EIFBSSVZBVEUgS0VZLS0tLS0K", "payload_content_type": "application/octet-stream", 
"payload_content_encoding": "base64"}'




openstack secret store --name "test-2" --file test.pem --secret-type private --bit-length 2048 --algorithm rsa --payload-content-type "text/plain" --debug


token=`openstack  token issue | grep "| id" | awk '{print $4}'`
curl -g -i \
-X POST http://127.0.0.1:9311/v1/secrets/ \
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








token=`openstack token issue | grep "| id" | awk '{print $4}'`

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
openstack secret order create asymmetric --name 'secret-asy-test' --bit-length 2048 --algorithm rsa --debug

token=`openstack token issue | grep "| id" | awk '{print $4}'`


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

