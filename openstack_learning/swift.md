

```bash
 openstack container create
 openstack container delete
 openstack container list
 openstack container save
 openstack container set
 openstack container show
 openstack container unset

 openstack object create
 openstack object delete
 openstack object list
 openstack object save
 openstack object set
 openstack object show
 openstack object store account set
 openstack object store account show
 openstack object store account unset
 openstack object unset

```

```bash
## Create bucket 
openstack container create

## show info
openstack container show 1-test-s3-upload
+--------------+------------------+
| Field        | Value            |
+--------------+------------------+
| account      | v1               |
| bytes_used   | 19               |
| container    | 1-test-s3-upload |
| object_count | 1                |
+--------------+------------------+

## download 
openstack container save 1-test-s3-upload


openstack object save container1 [FILE]

openstack container create deneil-upload-by-cli

## show deneil-upload-by-cli info
openstack container show deneil-upload-by-cli


## upload to object
openstack object create deneil-upload-by-cli 00_CIS_01_create_rootCA.sh




## download from object
openstack object save deneil-upload-by-cli 00_CIS_01_create_rootCA.sh


curl -g -i -X GET http://192.168.60.200:35357/v3 -H "Accept: application/json" -H "User-Agent: osc-lib/1.9.0 keystoneauth1/3.4.1 python-requests/2.14.2 CPython/2.7.5"

curl -g -i -X GET http://fibo-dct-tb.fixo.cloud/swift/v1/deneil-upload-by-cli/00_CIS_01_create_rootCA.sh -H "User-Agent: osc-lib/1.9.0 keystoneauth1/3.4.1 python-requests/2.14.2 CPython/2.7.5" -H "X-Auth-Token: {SHA1}deba581e1d89928057bd67c9e787474ac3779bab"







openstack container set 






```



```bash

## check before upload
[root@dct-queens-ctl-001 cis-update-patch-v4.10.1.0]# openstack container show deneil-upload-by-cli
+--------------+----------------------+
| Field        | Value                |
+--------------+----------------------+
| account      | v1                   |
| bytes_used   | 0                    |
| container    | deneil-upload-by-cli |
| object_count | 0                    |
+--------------+----------------------+

## upload to object -1
# 00_CIS_01_create_rootCA.sh
[root@dct-queens-ctl-001 cis-update-patch-v4.10.1.0]# openstack object create deneil-upload-by-cli 00_CIS_01_create_rootCA.sh
+----------------------------+----------------------+----------------------------------+
| object                     | container            | etag                             |
+----------------------------+----------------------+----------------------------------+
| 00_CIS_01_create_rootCA.sh | deneil-upload-by-cli | 2c6f031a9c7ca534e96b914d7467809e |
+----------------------------+----------------------+----------------------------------+

## check after first object upload
[root@dct-queens-ctl-001 cis-update-patch-v4.10.1.0]# openstack container show deneil-upload-by-cli
+--------------+----------------------+
| Field        | Value                |
+--------------+----------------------+
| account      | v1                   |
| bytes_used   | 5284                 |
| container    | deneil-upload-by-cli |
| object_count | 1                    |
+--------------+----------------------+


## upload to object -2
# 00_CIS_02_import_docker_image_to_remote_harbor.sh
[root@dct-queens-ctl-001 cis-update-patch-v4.10.1.0]# openstack object create deneil-upload-by-cli 00_CIS_02_import_docker_image_to_remote_harbor.sh

+---------------------------------------------------+----------------------+----------------------------------+
| object                                            | container            | etag                             |
+---------------------------------------------------+----------------------+----------------------------------+
| 00_CIS_02_import_docker_image_to_remote_harbor.sh | deneil-upload-by-cli | 24489b049f2a3d6b6364dfeee344ab60 |
+---------------------------------------------------+----------------------+----------------------------------+

## check after second object upload
[root@dct-queens-ctl-001 cis-update-patch-v4.10.1.0]# openstack container show deneil-upload-by-cli
+--------------+----------------------+
| Field        | Value                |
+--------------+----------------------+
| account      | v1                   |
| bytes_used   | 35421                |
| container    | deneil-upload-by-cli |
| object_count | 2                    |
+--------------+----------------------+
[root@dct-queens-ctl-001 cis-update-patch-v4.10.1.0]# 

swift stat deneil-upload-by-cli



##  
swift post --read-acl .r:* 

## set container to public acl
swift post <container> --read-acl ".r:*,.rlistings"

swift post deneil-upload-by-cli --read-acl ".r:*,.rlistings"



curl http://fibo-dct-tb.fixo.cloud/swift/v1/deneil-upload-by-cli/00_CIS_01_create_rootCA.sh


http://fibo-dct-tb.fixo.cloud/swift/v1

swift tempurl <method> <time> <path> <key>
swift tempurl GET <time> <path> <key>

swift tempurl GET 3600 /v1/my_account/container/object MYKEY


## 
openstack endpoint list --interface public --service swift  -f value -c URL
http://fibo-dct-tb.fixo.cloud/swift/v1


token=`openstack toekn issue | grep " br "| awk '{print $4}'`
publicURL=`openstack endpoint list --interface public --service swift  -f value -c URL`

curl  $publicURL/deneil-upload-by-cli?format=json -X GET -H "X-Auth-Token: $token" | python -m json.tool

curl $publicURL/deneil-upload-by-cli/

```





# upload to object
```bash

container_name="deneil-upload-by-cli"
file_list="\
00_CIS_01_create_rootCA.sh \
00_CIS_02_import_docker_image_to_remote_harbor.sh \
"

## create container
openstack container create $container_name

## upload files
for file in $file_list
do
    openstack object create $container_name $file
done

## set container to public acl
swift post $container_name --read-acl ".r:*,.rlistings"

## get container url
swift_url=`openstack endpoint list --interface public --service swift  -f value -c URL`
URL="$swift_url/$container_name/"

```





## deleted object & buckets

```bash
. admin-openrc.sh

container_name="deneil-upload-by-cli"

swift_url=`openstack endpoint list --interface public --service swift  -f value -c URL`

file_list=`curl $swift_url/$container_name/ `
# file_list="\
# 00_CIS_01_create_rootCA.sh \
# 00_CIS_02_import_docker_image_to_remote_harbor.sh \
# "

# deleted object
for file in $file_list
do
    openstack object delete $container_name $file
done

## deleted container
openstack container delete $container_name


[root@dct-queens-ctl-001 ~]# openstack container delete deneil-upload-by-cli

Forbidden (HTTP 403) (Request-ID: tx0000000000000000eea6e-00655de775-56d96a81-default)


http://fibo-dct-tb.fixo.cloud/swift/v1cis_update_file_tmp/

swift

```