
# order create
openstack secret order create asymmetric --name 'test-repeat' --mode ctr --bit-length 2048 --algorithm rsa 

```bash
openstack secret order create asymmetric --name 'test-repeat' --mode ctr --bit-length 2048 --algorithm rsa 
+----------------+----------------------------------------------------------------------------+
| Field          | Value                                                                      |
+----------------+----------------------------------------------------------------------------+
| Order href     | http://192.168.184.131:9311/v1/orders/08a7b3b5-4ebe-427d-afb7-235bb401ba0b |
| Type           | Asymmetric                                                                 |
| Container href | None                                                                       |
| Secret href    | N/A                                                                        |
| Created        | None                                                                       |
| Status         | None                                                                       |
| Error code     | None                                                                       |
| Error message  | None                                                                       |
+----------------+----------------------------------------------------------------------------+
```

# order get
```bash
openstack secret order get http://192.168.184.131:9311/v1/orders/08a7b3b5-4ebe-427d-afb7-235bb401ba0b
```

```bash
[rocky@barbican-on-rocky-linux ssh_test]$ openstack secret order get http://192.168.184.131:9311/v1/orders/08a7b3b5-4ebe-427d-afb7-235bb401ba0b
+----------------+--------------------------------------------------------------------------------+
| Field          | Value                                                                          |
+----------------+--------------------------------------------------------------------------------+
| Order href     | http://192.168.184.131:9311/v1/orders/08a7b3b5-4ebe-427d-afb7-235bb401ba0b     |
| Type           | Asymmetric                                                                     |
| Container href | http://192.168.184.131:9311/v1/containers/8cf1c601-0fee-4f08-890f-d326cacca3f9 |
| Secret href    | N/A                                                                            |
| Created        | 2022-12-19T01:16:25+00:00                                                      |
| Status         | ACTIVE                                                                         |
| Error code     | None                                                                           |
| Error message  | None                                                                           |
+----------------+--------------------------------------------------------------------------------+
```


# container get
```bash
openstack secret container get http://192.168.184.131:9311/v1/containers/8cf1c601-0fee-4f08-890f-d326cacca3f9
```
```bash
[rocky@barbican-on-rocky-linux ssh_test]$ openstack secret container get http://192.168.184.131:9311/v1/containers/8cf1c601-0fee-4f08-890f-d326cacca3f9
+----------------+--------------------------------------------------------------------------------+
| Field          | Value                                                                          |
+----------------+--------------------------------------------------------------------------------+
| Container href | http://192.168.184.131:9311/v1/containers/8cf1c601-0fee-4f08-890f-d326cacca3f9 |
| Name           | test-repeat                                                                    |
| Created        | 2022-12-19 01:16:26+00:00                                                      |
| Status         | ACTIVE                                                                         |
| Type           | rsa                                                                            |
| Public Key     | http://192.168.184.131:9311/v1/secrets/f6914c77-a4e4-4312-a734-143340c7eca0    |
| Private Key    | http://192.168.184.131:9311/v1/secrets/95430a1d-568b-4c5a-9104-cae0d45971de    |
| PK Passphrase  | None                                                                           |
| Consumers      | None                                                                           |
+----------------+--------------------------------------------------------------------------------+
```


# secret get 
##  Public Key
```bash
openstack secret get --payload http://192.168.184.131:9311/v1/secrets/f6914c77-a4e4-4312-a734-143340c7eca0
```

```bash
[rocky@barbican-on-rocky-linux ssh_test]$ openstack secret get --payload http://192.168.184.131:9311/v1/secrets/f6914c77-a4e4-4312-a734-143340c7eca0

+---------+------------------------------------------------------------------+
| Field   | Value                                                            |
+---------+------------------------------------------------------------------+
| Payload | -----BEGIN PUBLIC KEY-----                                       |
|         | MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAtK+vaLpJq6ZiMuksee0X |
|         | nBAmGAtOukEBvIP/5Z8/HgATqGLIGggkkrCcpmOF1vhN7EdI6BLbV75FBJOzNtoK |
|         | XDG+xRGbFwKSVs+Igxwra9A8ajfZ22HL4fvPucD9IxZOFVSIMJFhaNi41y2n7JqB |
|         | UERHyq8gUr3EktbQFDQX3R1+BqZ3n+4Ba36XmLr4Wirx5W6cQ83G7beb3IeXfGv7 |
|         | Db+8TCQXR4LEq1aGU+0JPjfl3nNXX0EBnafExj2uxGxSmlbxDAAe20G1cv5a6d+A |
|         | RUDZqnLiLYkT0faccL84F+suTVWcFPDSx5Pds8qKz9ekCXrk1GB2zjrMRknemKBf |
|         | EwIDAQAB                                                         |
|         | -----END PUBLIC KEY-----                                         |
|         |                                                                  |
+---------+------------------------------------------------------------------+
```

##  Private Key
```bash
openstack secret get --payload http://192.168.184.131:9311/v1/secrets/95430a1d-568b-4c5a-9104-cae0d45971de

```
```bash
[rocky@barbican-on-rocky-linux ssh_test]$ openstack secret get --payload http://192.168.184.131:9311/v1/secrets/95430a1d-568b-4c5a-9104-cae0d45971de

+---------+------------------------------------------------------------------+
| Field   | Value                                                            |
+---------+------------------------------------------------------------------+
| Payload | -----BEGIN PRIVATE KEY-----                                      |
|         | MIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQC0r69oukmrpmIy |
|         | 6Sx57RecECYYC066QQG8g//lnz8eABOoYsgaCCSSsJymY4XW+E3sR0joEttXvkUE |
|         | k7M22gpcMb7FEZsXApJWz4iDHCtr0DxqN9nbYcvh+8+5wP0jFk4VVIgwkWFo2LjX |
|         | LafsmoFQREfKryBSvcSS1tAUNBfdHX4Gpnef7gFrfpeYuvhaKvHlbpxDzcbtt5vc |
|         | h5d8a/sNv7xMJBdHgsSrVoZT7Qk+N+Xec1dfQQGdp8TGPa7EbFKaVvEMAB7bQbVy |
|         | /lrp34BFQNmqcuItiRPR9pxwvzgX6y5NVZwU8NLHk92zyorP16QJeuTUYHbOOsxG |
|         | Sd6YoF8TAgMBAAECggEAT+uVrsEXbPE/Zj11CskwNDuAXgpCXGf8mKHaQnrZtC9c |
|         | gpKO59TKOIgeAgrrXFagQO6W9O/CTWE/rfKWxqBTDMyEES7kZp0glX1eaH/BRQLq |
|         | diEWH892GxMCoqsWTLrE9vJY+wKTD4ks2SC8sg71O8e36ZLkvTRrCngxuX4BQC/W |
|         | +EybNCOHEmhNBPUAAlAw7BbEIDzD3y1CDHJ0HO2IvgKKVC+MZCF/ddMObYon3NI2 |
|         | FThiCmYQqN6qiZ+2H3+/BzYuLZfrixdsMqrA0/Z0uFmT9kMZA2CPGL77npBesgme |
|         | W5z/xWcuRZOHawF1p8FKVho6DDQBuX9fKZoNXx0DYQKBgQC5QUxW4AEJZHap7z8X |
|         | 6jeVXsauirJHmsFYHK/WMTMszghqynd8x3aZWFwVY44Ua5M4pf4cCr1Tzg4kYF6M |
|         | qqpLSEILTxJvcB+FyT4VjF3IUTgYa4ddhrEf6zSWOh1SkRLRi4Brif24yTcUZRdT |
|         | Ye4rtjeQo+GcWTyiNhIhFKWEvwKBgQD5r7ynVMvXTKl5d5ZTmk2xsSeXU7eG2Ur2 |
|         | jJ3+aVbsUIB0qodUoVeggMXE+MXqjWNVy9jj10lUlujUkgIJWEQ/2YrMw+d+Skpb |
|         | YH8Qxxlu6WqaLYNZ7AgCFyuJZYtHCaaWAg8pz1ALXMUpr9YBejbiRSnSqqqanIwP |
|         | EQT8xbLWrQKBgQCxoOnItvpnfhvFry/pB1wKbhjFTRnKTJmsmb0D/KLcCCXL95yA |
|         | WWTfffi1TYLzE37TJ14ylx2YGJA40up1qEKm8n7ZBxVfIrwm9KIB2Vgm9bF6wMfH |
|         | ppl5SHZgwRJSk+XeZAtbkbFlGBInDRNDkTfkU9CNcIWn+2yHAJ97dqeKUwKBgQDY |
|         | aURHeEyxUGX3vPoTfkNnBxg8pjgE7iN2LIzoLJ9FdcTQ2dkwNiOAHvzLa6AHWwLF |
|         | I0jaugd6BM7LJ74SIWoOOVx/fDESGgv2xV18ykS2CCP4fAhEETsjrLd0gAnGyYuU |
|         | qzY/U8uZ/Y96QUhowWf+mFnWmUwDdDpE+Mhs2mHWhQKBgEpI5CE1sbc/b4p0mnaS |
|         | LQOLYUbT+sVLcVJiBntoMuQunTFt7MAcKVF3JfReYx9g8jwHOLefy0ZMJAn9KzmK |
|         | xyApemSC2L1CdtR2oUadpW5JsoxURverl0H3GEKM4V1Q2LtS/omqLuNe6X5hmu3v |
|         | ir51xEvB69C5LAoFomaXoaOI                                         |
|         | -----END PRIVATE KEY-----                                        |
|         |                                                                  |
+---------+------------------------------------------------------------------+
```






[rocky@barbican-on-rocky-linux ssh_test]$ openstack token issue
+------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Field      | Value                                                                                                                                                                                   |
+------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| expires    | 2022-12-19T03:19:43+0000                                                                                                                                                                |
| id         | gAAAAABjn8o_nzJyRc2230SpNoAO6mUG0vZKUbModHuhPvgMjoY4eTAyhzcmfrm9_eXOrCHCBfD_dHXBvr7l4KD0YpfUqjl9ryTkOMxKEelqUAVU2TrwB2LaqAzNR27Rw5oQ3gAqBtMaQW5rNz2m0WQ0J8GA6v4LebcLKORZEB-TKaGQT9Ru2RA |
| project_id | 7622948973b14644ac855ee840758386                                                                                                                                                        |
| user_id    | 6ee15cfeff1e41c8b5538e37b7be50ec                                                                                                                                                        |
+------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+


```bash
TOKEN=gAAAAABjn8o_nzJyRc2230SpNoAO6mUG0vZKUbModHuhPvgMjoY4eTAyhzcmfrm9_eXOrCHCBfD_dHXBvr7l4KD0YpfUqjl9ryTkOMxKEelqUAVU2TrwB2LaqAzNR27Rw5oQ3gAqBtMaQW5rNz2m0WQ0J8GA6v4LebcLKORZEB-TKaGQT9Ru2RA

curl -X POST -H "content-type:application/json" -H "X-Auth-Token: $TOKEN" \
-d '{}' http://192.168.184.131:9311/v1/secrets
```








openstack secret store \
--file ./keys/first_key.pem \
--secret-type private \
--algorithm aes \
--payload-content-type "text/plain" \
--name test_storage
# http://192.168.184.131:9311/v1/secrets/f653f324-290c-4437-96f6-d3cb09e2b619



openstack secret store \
--file ./keys/first_key.pem \
--secret-type private \
--algorithm rsa \
--payload-content-type "text/plain" \
--name test_storage_test
# http://192.168.184.131:9311/v1/secrets/cfc06bfe-979d-4a78-8a96-2e0e91ac3be1




```bash
[rocky@barbican-on-rocky-linux ssh_test]$ openstack secret store -h
usage: openstack secret store [-h] [-f {json,shell,table,value,yaml}] [-c COLUMN]
                              [--noindent] [--prefix PREFIX]
                              [--max-width <integer>] [--fit-width] [--print-empty]
                              [--name NAME] [--secret-type SECRET_TYPE]
                              [--payload-content-type PAYLOAD_CONTENT_TYPE]
                              [--payload-content-encoding PAYLOAD_CONTENT_ENCODING]
                              [--algorithm ALGORITHM] [--bit-length BIT_LENGTH]
                              [--mode MODE] [--expiration EXPIRATION]
                              [--payload PAYLOAD | --file <filename>]

Store a secret in Barbican.

optional arguments:
  -h, --help            show this help message and exit
  --name NAME, -n NAME
                        a human-friendly name.
  --secret-type SECRET_TYPE, -s SECRET_TYPE
                        the secret type; must be one of symmetric, public, private, certificate,
                        passphrase, opaque (default)
  --payload-content-type PAYLOAD_CONTENT_TYPE, -t PAYLOAD_CONTENT_TYPE
                        the type/format of the provided secret data; "text/plain" is assumed to be
                        UTF-8; required when --payload is supplied.
  --payload-content-encoding PAYLOAD_CONTENT_ENCODING, -e PAYLOAD_CONTENT_ENCODING
                        required if --payload-content-type is "application/octet-stream".
  --algorithm ALGORITHM, -a ALGORITHM
                        the algorithm (default: aes).
  --bit-length BIT_LENGTH, -b BIT_LENGTH
                        the bit length (default: 256).
  --mode MODE, -m MODE
                        the algorithm mode; used only for reference (default: cbc)
  --expiration EXPIRATION, -x EXPIRATION
                        the expiration time for the secret in ISO 8601 format.
  --payload PAYLOAD, -p PAYLOAD
                        the unencrypted secret data.
  --file <filename>, -F <filename>
                        file containing the secret payload



output formatters:
  output formatter options

  -f {json,shell,table,value,yaml}, --format {json,shell,table,value,yaml}
                        the output format, defaults to table
  -c COLUMN, --column COLUMN
                        specify the column(s) to include, can be repeated to show multiple columns

json formatter:
  --noindent            whether to disable indenting the JSON

shell formatter:
  a format a UNIX shell can parse (variable="value")

  --prefix PREFIX
                        add a prefix to all variable names

table formatter:
  --max-width <integer>
                        Maximum display width, <1 to disable. You can also use the
                        CLIFF_MAX_TERM_WIDTH environment variable, but the parameter takes
                        precedence.
  --fit-width           Fit the table to the display width. Implied if --max-width greater than 0.
                        Set the environment variable CLIFF_FIT_WIDTH=1 to always enable
  --print-empty         Print empty table if there is no data to show.

This command is provided by the python-barbicanclient plugin.
```















