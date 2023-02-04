


## barbican database backup
```bash
mysqldump -h localhost -u barbican -pfoxconn barbican > barbican.backup-empty-2.sql
mysqldump -h localhost -u barbican -pfoxconn barbican > barbican.backup-empty-2023-01-18-11-14.sql;
mysqldump -h localhost -u barbican -pfoxconn barbican > barbican.backup-100key-2023-01-18-11-22.sql;
mysqldump -h localhost -u barbican -pfoxconn barbican > barbican.backup-1000key-2023-01-18-12-23.sql;
mysqldump -h localhost -u barbican -pfoxconn barbican > barbican.backup-3000key-2023-01-18-14-04.sql;
mysqldump -h localhost -u barbican -pfoxconn barbican > barbican.backup-5100key-2023-01-18-16-00.sql;
```


## 建立 100 組keypair 觀察sql 大小
```bash
count=0
time for i in {1..10000}
do
    count=$((count+=1))
    keyname="key2-$count"
    echo -e "Now is creating $keyname"

openstack secret order create \
asymmetric \
--name $keyname \
--bit-length 2048 \
--algorithm rsa

done

```


```bash

mysql -u barbican -p barbican < barbican.backup-5100key-2023-01-18-16-00.sql

```



```bash
token=`openstack token issue | grep "| id" | awk '{print $4}'`
REQ=`curl -X GET \
http://127.0.0.1:9311/v1/secrets?limit=200 \
-H "Accept: application/json" \
-H "X-Auth-Token: $token" `

echo  $REQ |  python -m json.tool | grep "created" | wc -l
```



