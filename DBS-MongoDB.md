


## https://medium.com/feveral%E7%9A%84%E7%A8%8B%E5%BC%8F%E7%AD%86%E8%A8%98/mongodb-%E7%9A%84%E4%BD%BF%E7%94%A8%E8%80%85%E8%A8%AD%E5%AE%9A-bf7b3dde9c70

### Step 1: 建立 admin user

```sql
use admin

db.createUser({
  user : "root",
  pwd : "foxconn",
  roles : [
    "clusterAdmin",
    "dbAdminAnyDatabase",
    "userAdminAnyDatabase",
    "readWriteAnyDatabase"
  ]
})


```


## Step 2: 建立使用 DB 的 user

```sql
## 使用 admin 身分登入
use admin
db.auth("root", "foxconn")

## 顯示所有 DB
show dbs

## 建立使用 DB 的 user
use test_database
db.createUser({
    'user': 'user',
    'pwd': 'password',
    'roles': [{'role': 'readWrite', 'db': 'test_database'}]
})

## 進入 test_database & user login
use test_database
db.auth("user", "password")


use test_database
db.auth("user", "foxconn1234")

```



## 匯入資料到 MongoDB

```bash

#!/bin/bash
for ((i=1;i<=10;i++))
do
   mongoimport -u user -p password -d test_database -c col$i --type csv --headerline --file /home/ubuntu/1G.csv
done

mongoimport -u user -p foxconn1234 -d test_database -c collection --type csv --headerline --file /home/ubuntu/1G.csv

```


## 從MongoDB 顯示資料

```sql
use test_database
db.auth("user", "password")

## 顯示test_database 中所有 collections
> show collections
col1
col10
col11
col12
col13
col14
col15
col2
col3
col4
col5
col6
col7
col8
col9

## 取 col1 中的第一筆資料
> db.col1.findOne()
{
        "_id" : ObjectId("64f97704a794fef115b11155"),
        "266" : 281,
        "909" : 1285,
        "159625" : 159625,
        "159627" : 159627,
        "2635" : 2637,
        "20000827" : {
                "0117590018" : 20000827.011759
        },
        "1239029" : 1239029,
        "1341" : 1663,
        "-26" : {
                "399744" : -6.7535419
        },
        "1228" : 1533,
        "0" : {
                "56000537" : 0.53597438
        },
        "48" : 8
}

db.col1.find() 
```

## 顯示全部
```sql
> db.col1.find()
{ "_id" : ObjectId("64f97704a794fef115b11155"), "266" : 281, "909" : 1285, "159625" : 159625, "159627" : 159627, "2635" : 2637, "20000827" : { "0117590018" : 20000827.011759 }, "1239029" : 1239029, "1341" : 1663, "-26" : { "399744" : -6.7535419 }, "1228" : 1533, "0" : { "56000537" : 0.53597438 }, "48" : 8 }
{ "_id" : ObjectId("64f97704a794fef115b11156"), "266" : 251, "909" : 1232, "159625" : 159625, "159627" : 159627, "2635" : 2640, "20000827" : { "0117590018" : 20000827.0118 }, "1239029" : 1239029, "1341" : 930, "-26" : { "399744" : 26.815605 }, "1228" : 1153, "0" : { "56000537" : 0.53236401 }, "48" : 54 }
{ "_id" : ObjectId("64f97704a794fef115b11157"), "266" : 281, "909" : 1040, "159625" : 159625, "159627" : 159627, "2635" : 2641, "20000827" : { "0117590018" : 20000827.0118 }, "1239029" : 1239029, "1341" : 916, "-26" : { "399744" : 9.3687754 }, "1228" : 1166, "0" : { "56000537" : 0.57459098 }, "48" : 52 }
{ "_id" : ObjectId("64f97704a794fef115b11158"), "266" : 194, "909" : 1286, "159625" : 159625, "159627" : 159627, "2635" : 2642, "20000827" : { "0117590018" : 20000827.0118 }, "1239029" : 1239029, "1341" : 1495, "-26" : { "399744" 
: 0 }, "1228" : 1027, "0" : { "56000537" : 0.66013932 }, "48" : 25 }
{ "_id" : ObjectId("64f97704a794fef115b11159"), "266" : 317, "909" : 1243, "159625" : 159625, "159627" : 159627, "2635" : 2636, "20000827" : { "0117590018" : 20000827.011759 }, "1239029" : 1239029, "1341" : 1470, "-26" : { "399744" : -29.07542 }, "1228" : 1415, "0" : { "56000537" : 0.4644182 }, "48" : 53 }
{ "_id" : ObjectId("64f97704a794fef115b1115a"), "266" : 184, "909" : 907, "159625" : 159625, "159627" : 159627, "2635" : 2643, "20000827" : { "0117590018" : 20000827.011801 }, "1239029" : 1239029, "1341" : 1852, "-26" : { "399744" : 0 }, "1228" : 1104, "0" : { "56000537" : 0.52850509 }, "48" : 54 }
{ "_id" : ObjectId("64f97704a794fef115b1115b"), "266" : 207, "909" : 1143, "159625" : 159625, "159627" : 159627, "2635" : 2644, "20000827" : { "0117590018" : 20000827.011801 }, "1239029" : 1239029, "1341" : 730, "-26" : { "399744" : -12.205997 }, "1228" : 990, "0" : { "56000537" : 0.59274352 }, "48" : 47 }
{ "_id" : ObjectId("64f97704a794fef115b1115c"), "266" : 214, "909" : 1064, "159625" : 159625, "159627" : 159627, "2635" : 2645, "20000827" : { "0117590018" : 20000827.011801 }, "1239029" : 1239029, "1341" : 1188, "-26" : { "399744" : 0 }, "1228" : 909, "0" : { "56000537" : 0.63449258 }, "48" : 47 }
{ "_id" : ObjectId("64f97704a794fef115b1115d"), "266" : 204, "909" : 1198, "159625" : 159625, "159627" : 159627, "2635" : 2638, "20000827" : { "0117590018" : 20000827.011759 }, "1239029" : 1239029, "1341" : 1806, "-26" : { "399744" : 11.985353 }, "1228" : 1123, "0" : { "56000537" : 0.66897142 }, "48" : 32 }
{ "_id" : ObjectId("64f97704a794fef115b1115e"), "266" : 288, "909" : 988, "159625" : 159625, "159627" : 159627, "2635" : 2639, "20000827" : { "0117590018" : 20000827.0118 }, "1239029" : 1239029, "1341" : 1409, "-26" : { "399744" : -12.928666 }, "1228" : 1314, "0" : { "56000537" : 0.58498305 }, "48" : 39 }
{ "_id" : ObjectId("64f97704a794fef115b1115f"), "266" : 196, "909" : 1331, "159625" : 159625, "159627" : 159627, "2635" : 2647, "20000827" : { "0117590018" : 20000827.011802 }, "1239029" : 1239029, "1341" : 1514, "-26" : { "399744" : 0 }, "1228" : 1008, "0" : { "56000537" : 0.62101597 }, "48" : 8 }
{ "_id" : ObjectId("64f97704a794fef115b11160"), "266" : 204, "909" : 1181, "159625" : 159625, "159627" : 159627, "2635" : 2650, "20000827" : { "0117590018" : 20000827.011802 }, "1239029" : 1239029, "1341" : 1038, "-26" : { "399744" : 7.8673525 }, "1228" : 1038, "0" : { "56000537" : 0.55236143 }, "48" : 43 }
{ "_id" : ObjectId("64f97704a794fef115b11161"), "266" : 230, "909" : 983, "159625" : 159625, "159627" : 159627, "2635" : 2648, "20000827" : { "0117590018" : 20000827.011802 }, "1239029" : 1239029, "1341" : 2205, "-26" : { "399744" : 0 }, "1228" : 1198, "0" : { "56000537" : 0.54467571 }, "48" : 26 }
{ "_id" : ObjectId("64f97704a794fef115b11162"), "266" : 94, "909" : 827, "159625" : 159625, "159627" : 159627, "2635" : 2649, "20000827" : { "0117590018" : 20000827.011802 }, "1239029" : 1239029, "1341" : 1772, "-26" : { "399744" 
: 0 }, "1228" : 738, "0" : { "56000537" : 0.55982822 }, "48" : 20 }
{ "_id" : ObjectId("64f97704a794fef115b11163"), "266" : 108, "909" : 1073, "159625" : 159625, "159627" : 159627, "2635" : 2651, "20000827" : { "0117590018" : 20000827.011803 }, "1239029" : 1239029, "1341" : 1175, "-26" : { "399744" : 0 }, "1228" : 693, "0" : { "56000537" : 0.52536035 }, "48" : 30 }
{ "_id" : ObjectId("64f97704a794fef115b11164"), "266" : 176, "909" : 1422, "159625" : 159625, "159627" : 159627, "2635" : 2646, "20000827" : { "0117590018" : 20000827.011801 }, "1239029" : 1239029, "1341" : 1935, "-26" : { "399744" : 0 }, "1228" : 1018, "0" : { "56000537" : 0.53062689 }, "48" : 13 }
{ "_id" : ObjectId("64f97704a794fef115b11165"), "266" : 0, "909" : 1058, "159625" : 159625, "159627" : 159627, "2635" : 2652, "20000827" : { "0117590018" : 20000827.011803 }, "1239029" : 1239029, "1341" : 0, "-26" : { "399744" : 0 }, "1228" : 0, "0" : { "56000537" : -9999 }, "48" : 38 }
{ "_id" : ObjectId("64f97704a794fef115b11166"), "266" : 283, "909" : 944, "159625" : 159625, "159627" : 159627, "2635" : 2653, "20000827" : { "0117590018" : 20000827.011803 }, "1239029" : 1239029, "1341" : 1551, "-26" : { "399744" : -16.159302 }, "1228" : 1307, "0" : { "56000537" : 0.60300124 }, "48" : 38 }
{ "_id" : ObjectId("64f97704a794fef115b11167"), "266" : 312, "909" : 1383, "159625" : 159625, "159627" : 159627, "2635" : 2654, "20000827" : { "0117590018" : 20000827.011803 }, "1239029" : 1239029, "1341" : 2174, "-26" : { "399744" : -7.9546685 }, "1228" : 1558, "0" : { "56000537" : 0.56447577 }, "48" : 4 }
{ "_id" : ObjectId("64f97704a794fef115b11168"), "266" : 95, "909" : 684, "159625" : 159625, "159627" : 159627, "2635" : 2655, "20000827" : { "0117590018" : 20000827.011804 }, "1239029" : 1239029, "1341" : 778, "-26" : { "399744" : 0 }, "1228" : 580, "0" : { "56000537" : 0.52936405 }, "48" : 67 }
Type "it" for more
>

```




## mongodump

```bash
# 
############################
###                      ###
###   匯出 mongoDB data   ###
###                      ###
############################
## 匯出
mongodump \
    --host="XXX.XXX.XXX.XXX:27017" \
    --out=/output/path/folder \
    --username=root \
    --password=$passwd

mongo "192.168.120.4:27017" -u user -p foxconn1234 --authenticationDatabase "admin"

## DB-1
passwd="c2bdad7c2373d943e870aecff16e558b5ee4a60b031d9b7fc203c52ea95a1b59602c543f4b5be6c123b38944eb0deeb505aa2139966ced1daa03d25ab58ea5b1"

## DB-2
passwd="c2bdad7c2373d943e870aecff16e558b5ee4a60b031d9b7fc203c52ea95a1b59602c543f4b5be6c123b38944eb0deeb505aa2139966ced1daa03d25ab58ea5b1"

mongo --host="192.168.120.4:27017" --authenticationDatabase "admin" -u "root" -p $passwd
mongo --host="192.168.120.7:27017" --authenticationDatabase "admin" -u "root" -p $passwd
mongo --host="192.168.120.48:27017" --authenticationDatabase "admin" -u "root" -p $passwd

db.auth("root", "c2bdad7c2373d943e870aecff16e558b5ee4a60b031d9b7fc203c52ea95a1b59602c543f4b5be6c123b38944eb0deeb505aa2139966ced1daa03d25ab58ea5b1")

## user login (必須指定database)
mongo --host="192.168.120.7:27017" --authenticationDatabase "test_database" -u "user" -p foxconn1234


## 整個資料庫備份
## Admin 身分可以直接對local端mongoDB進行備份
mongodump -o /home/ubuntu/mongoDB -u admin -p foxconn --authenticationDatabase "admin"

## remote admin身分備份成功
# [成功] way1
mongodump --host=192.168.120.4 --port=27017 -o /home/ubuntu/data --authenticationDatabase "admin" -u root -p $passwd
# [成功] way2
mongodump \
    --host="192.168.120.4:27017" \
    --out=/home/ubuntu/data-2 \
    --username=root \
    --password=$passwd

## [成功] dump by user身分 
mongodump \
    --host="192.168.120.4:27017" \
    --db=test_database \
    --out=/home/ubuntu/by_user \
    --numParallelCollections 4  \
    --username=user \
    --password=foxconn1234


mongodump \
    --host="192.168.120.29:27017" \
    --out=/home/ubuntu/specific_data \
    --username=root \
    --password=$passwd \
    --db=test_database 


############################
###                      ###
###  還原 mongodump data  ###
###                      ###
############################
mongorestore \
    --host="XXX.XXX.XXX.XXX:27017" \
    --username=sample-user \
    --password=abc0123 \
    <file or floder To Be Restored>

## [成功] Admin 身分還原
mongorestore \
    --host="192.168.120.29:27017" \
    --username=root \
    --password=$passwd \
    /home/ubuntu/data-2/

## [成功] user 身分還原
mongorestore \
 --host="192.168.120.7:27017" \
 --username=user \
 --password=foxconn1234 \
 --authenticationDatabase "test_database" \
 /home/ubuntu/by_user/

mongorestore \
    --host="192.168.120.29:27017" \
    --username=root \
    --password=$passwd \
    /home/ubuntu/by_user/



mongorestore \
 --host="192.168.120.48:27017" \
 --username=user \
 --password=foxconn1234 \
 --authenticationDatabase "test_database" \
 /home/ubuntu/by_user/


mongo --host="192.168.120.48:27017" --authenticationDatabase "admin" -u "root" -p $passwd
mongo --host="192.168.120.22:27017" --authenticationDatabase "admin" -u "root" -p $passwd


## 導入CSV file
mongoimport \
    --host="192.168.120.16:27017" \
    --db=test_database \
    --collection=sample-collection \
    --type='csv' \
    --file=1G.csv \
    --fields=column1,column2,column3,column4,column5,column6,column7,column8,column9,column10,column11,column12 \
    --username=user \
    --password=foxconn1234

mongoimport \
--db=taipei_bike_record \
--fields=column1,column2,column3,column4,column5,column6,column7,column8,column9,column10,column11,column12 \
--collection=rent_dec \
--type=csv \
--file /202012_YouBike票證刷卡資料.csv

```





```bash
## check mongoDB tcp port
sudo lsof -i | grep mongo

## allow port access
sudo ufw allow from trusted_machine_ip to any port 27017

sudo ufw allow proto tcp from 0.0.0.0/0 to any port 27017


## check ufw status
sudo ufw status

## Turn on firewall
sudo ufw enable

## allow port access
mongod --auth --port 27017 --dbpath /var/lib/mongodb

## remote login
mongo 127.0.0.1:27017 -u "root" -p "foxconn" --authenticationDatabase "admin"
# mongo 127.0.0.1:27017 -u "user" -p "password" --authenticationDatabase "admin"

sudo systemctl restart mongod


```

