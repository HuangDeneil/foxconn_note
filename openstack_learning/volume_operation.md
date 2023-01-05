
# ⁉️ 問題釐清

問題來源:  [redmine #5089](http://10.62.163.129/redmine/issues/5089)

- FiXo過去發現狀態非activate時，不能進行volume掛載，因此把非activate狀態的主機，在掛載volume時設為不顯示 (排除所有非activate狀態的volume掛載)
- 雲高現在需要釐清 `關機` 後是否能夠掛載



# 0️⃣ 測試volume掛 (status : `shutdown` )

- 環境 : `tj-testBed`
- status : `shutdown`
- 測試 `shutdown` 狀態掛載volome (能夠掛成功)

### 確認VM內只有一顆volume ( fdisk -l )

### 確認VM是 shutdown 狀態 
```bash
[root@tj-testbed-control-001 deneil]# openstack server list
+--------------------------------------+-----------------------------------+---------+----------------------------------+----------------------------------+--------------+
| ID                                   | Name                              | Status  | Networks                         | Image                            | Flavor       |
+--------------------------------------+-----------------------------------+---------+----------------------------------+----------------------------------+--------------+
| cfd3f221-1901-4876-8695-7413232cffb5 | deneil-test-volume-attach         | SHUTOFF | private-deneil-FHW=192.168.77.4  |                                  | FiCo-v2m4-Q1 |
| e11a9f8e-0593-47f2-90cb-86e4f9a8b283 | testrabbitmq-0                    | ACTIVE  | private-deneil-FHW=192.168.77.12 |                                  | MQS-v2m4-Q1  |
| 4d1eff82-6701-4f65-9399-b0760eec4c63 | deneil_rocky_barbican_backup_test | ACTIVE  | private-deneil-FHW=192.168.77.15 | deneil-barbican-on-rocky-linux-9 | FiCo-v4m8-Q1 |
+--------------------------------------+-----------------------------------+---------+----------------------------------+----------------------------------+--------------+
```

###  確認volume 狀態 (已建立一個公volume)
```bash
[root@tj-testbed-control-001 deneil]# openstack volume list
+--------------------------------------+-----------------------------------------+-----------+------+----------------------------------------------------+
| ID                                   | Name                                    | Status    | Size | Attached to                                        |
+--------------------------------------+-----------------------------------------+-----------+------+----------------------------------------------------+
| 83f88159-0654-41cb-b3e3-8fad1b7de26a | deneil-test-volume-2                    | available |   90 |                                                    |
| aa431374-2328-472c-bc74-5bf87c146d16 | deneil_test_volume-1                    | in-use    |   40 | Attached to deneil-test-volume-attach on /dev/vda  |
| e6e5df6c-085e-4fc0-9c02-1ab3235193cd | testrabbitmq-MQaaS_Cluster-oqudmahouivl | in-use    |   40 | Attached to testrabbitmq-0 on /dev/vda             |
+--------------------------------------+-----------------------------------------+-----------+------+----------------------------------------------------+
```


### 掛載volume到關機VM (確定能夠掛上去)

- CLI 操作
```bash
## openstack server add volume <VM_id> <volume_id>
openstack server add volume 952759ce-bba1-4613-b9fd-27c0badd915a 83f88159-0654-41cb-b3e3-8fad1b7de26a
```

- api 操作

```bash
## 查詢token
openstack token issue

token=`openstack  token issue | grep "| id" | awk '{print $4}'`
```


### openstack volume list 
```bash
token=`openstack  token issue | grep "| id" | awk '{print $4}'`

curl -g -i -X GET http://osapi-fixo-1-tj.fixo.cloud:8776/v2/f3460935808041b58a2c481ace6b51be/volumes/detail \
-H "User-Agent: python-cinderclient" \
-H "Accept: application/json" \
-H "X-Auth-Token: $token" | python -m json.tool

```


## reboot CMD
```bash
openstack server reboot --hard 952759ce-bba1-4613-b9fd-27c0badd915a
openstack server reboot --soft 952759ce-bba1-4613-b9fd-27c0badd915a
```
## openstack server add volume 
```bash
openstack server add volume 952759ce-bba1-4613-b9fd-27c0badd915a 83f88159-0654-41cb-b3e3-8fad1b7de26a

token=`openstack token issue | grep "| id" | awk '{print $4}'`
curl -g -i \
-X POST http://osapi-fixo-1-tj.fixo.cloud:8774/v2.1/servers/952759ce-bba1-4613-b9fd-27c0badd915a/os-volume_attachments \
-H "User-Agent: python-novaclient" \
-H "Content-Type: application/json" \
-H "Accept: application/json" \
-H "X-Auth-Token: $token" \
-d '{"volumeAttachment": {"volumeId": "83f88159-0654-41cb-b3e3-8fad1b7de26a"}}'
```

## openstack server remove volume 
```bash
openstack server remove volume 952759ce-bba1-4613-b9fd-27c0badd915a 83f88159-0654-41cb-b3e3-8fad1b7de26a

token=`openstack token issue | grep "| id" | awk '{print $4}'`
curl -g -i \
-X DELETE http://osapi-fixo-1-tj.fixo.cloud:8774/v2.1/servers/952759ce-bba1-4613-b9fd-27c0badd915a/os-volume_attachments/83f88159-0654-41cb-b3e3-8fad1b7de26a -H "User-Agent: python-novaclient" \
-H "Accept: application/json" \
-H "X-Auth-Token: $token"  
```



## 連線測試
```bash
ip netns exec qdhcp-c94ceb9a-c58e-4897-87ef-dac98e4993ca ssh centos@192.168.77.4
```



### resize
### FiCo-v2m4-Q1, FiCo-v4m8-Q1
```bash 
openstack server resize --flavor FiCo-v4m8-Q1 952759ce-bba1-4613-b9fd-27c0badd915a
openstack server resize --confirm 952759ce-bba1-4613-b9fd-27c0badd915a
openstack server resize --flavor FiCo-v2m4-Q1 952759ce-bba1-4613-b9fd-27c0badd915a
openstack server resize --confirm 952759ce-bba1-4613-b9fd-27c0badd915a
```
### openstack server add volume 
```bash
openstack server add volume 952759ce-bba1-4613-b9fd-27c0badd915a 83f88159-0654-41cb-b3e3-8fad1b7de26a

token=`openstack token issue | grep "| id" | awk '{print $4}'`
curl -g -i \
-X POST http://osapi-fixo-1-tj.fixo.cloud:8774/v2.1/servers/952759ce-bba1-4613-b9fd-27c0badd915a/os-volume_attachments \
-H "User-Agent: python-novaclient" \
-H "Content-Type: application/json" \
-H "Accept: application/json" \
-H "X-Auth-Token: $token" \
-d '{"volumeAttachment": {"volumeId": "83f88159-0654-41cb-b3e3-8fad1b7de26a"}}'
```

### openstack server remove volume
```bash
openstack server remove volume 952759ce-bba1-4613-b9fd-27c0badd915a 83f88159-0654-41cb-b3e3-8fad1b7de26a 

token=`openstack token issue | grep "| id" | awk '{print $4}'`
curl -g -i \
-X DELETE http://osapi-fixo-1-tj.fixo.cloud:8774/v2.1/servers/952759ce-bba1-4613-b9fd-27c0badd915a/os-volume_attachments/83f88159-0654-41cb-b3e3-8fad1b7de26a -H "User-Agent: python-novaclient" \
-H "Accept: application/json" \
-H "X-Auth-Token: $token"  
```



