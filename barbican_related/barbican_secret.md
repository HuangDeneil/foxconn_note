

- Generate key
    - Create an symmetric key
        - `openstack secret order create key --name 'secret-key-001’`
    - Create an asymmetric key
        - `openstack secret order create asymmetric --name 'secret-asy-001' --mode ctr --bit-length 1024 --algorithm rsa`


```bash
openstack secret order create asymmetric --name '20230609-deneil-test-1' --bit-length 2048 --algorithm rsa 
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

```












