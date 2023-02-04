

```bash
token=`openstack token issue | grep "| id" | awk '{print $4}'`

# openstack loadbalancer create


# openstack loadbalancer delete


# openstack loadbalancer set


# openstack loadbalancer failover


# openstack loadbalancer list
curl -X GET \
http://osapi.dct-tb.mtjade.cloud:9876/v2.0/lbaas/loadbalancers \
-H "Accept: application/json" \
-H "X-Auth-Token: $token"

# openstack loadbalancer show b4834440-3eea-4024-848c-182304d53f13
curl -X GET \
http://osapi.dct-tb.mtjade.cloud:9876/v2.0/lbaas/loadbalancers/b4834440-3eea-4024-848c-182304d53f13 \
-H "Accept: application/json" \
-H "X-Auth-Token: $token"

# openstack loadbalancer stats show b4834440-3eea-4024-848c-182304d53f13
curl -X GET \
http://osapi.dct-tb.mtjade.cloud:9876/v2.0/lbaas/loadbalancers/b4834440-3eea-4024-848c-182304d53f13/stats \
-H "Accept: application/json" \
-H "X-Auth-Token: $token"

```








## amphora
```bash
token=`openstack token issue | grep "| id" | awk '{print $4}'`
# openstack loadbalancer amphora list
## 
curl -X GET \
http://osapi.dct-tb.mtjade.cloud:9876/v2.0/octavia/amphorae \
-H "Accept: application/json" \
-H "X-Auth-Token: $token"



# openstack loadbalancer amphora show 2daabb56-478f-44d4-9880-26b29a150e81
curl -X GET \
http://osapi.dct-tb.mtjade.cloud:9876/v2.0/octavia/amphorae/2daabb56-478f-44d4-9880-26b29a150e81 \
-H "Accept: application/json" \
-H "X-Auth-Token: $token"

```



## healthmonitor
```bash
token=`openstack token issue | grep "| id" | awk '{print $4}'`
# openstack loadbalancer healthmonitor create


# openstack loadbalancer healthmonitor delete


# openstack loadbalancer healthmonitor set


# openstack loadbalancer healthmonitor list
curl -X GET \
http://osapi.dct-tb.mtjade.cloud:9876/v2.0/lbaas/healthmonitors \
-H "Accept: application/json" \
-H "X-Auth-Token: $token"

# openstack loadbalancer healthmonitor show
curl -X GET \
http://osapi.dct-tb.mtjade.cloud:9876/v2.0/lbaas/healthmonitors/8ba725d6-a9b0-4fd5-b6fa-b128b0d9e16d \
-H "Accept: application/json" \
-H "X-Auth-Token: $token"  


```













## l7policy
```bash
# openstack loadbalancer l7policy create
# openstack loadbalancer l7policy delete
# openstack loadbalancer l7policy set
# openstack loadbalancer l7policy list
# openstack loadbalancer l7policy show
```



## l7rule
```bash
# openstack loadbalancer l7rule create
# openstack loadbalancer l7rule delete
# openstack loadbalancer l7rule set
# openstack loadbalancer l7rule list
# openstack loadbalancer l7rule show
```



## listener
```bash
# openstack loadbalancer listener create
# openstack loadbalancer listener delete
# openstack loadbalancer listener set
# openstack loadbalancer listener list
# openstack loadbalancer listener show
# openstack loadbalancer listener stats show
```


## pool
```bash
# openstack loadbalancer pool create
# openstack loadbalancer pool delete
# openstack loadbalancer pool set
# openstack loadbalancer pool list
# openstack loadbalancer pool show
```









## pool
```bash
# openstack loadbalancer pool create




# openstack loadbalancer pool delete




# openstack loadbalancer pool set 




# openstack loadbalancer pool list
token=`openstack token issue | grep "| id" | awk '{print $4}'`
curl -X GET \
http://osapi.dct-tb.mtjade.cloud:9876/v2.0/lbaas/pools \
-H "Accept: application/json" \
-H "X-Auth-Token: $token"

# openstack loadbalancer pool show 64f1b9c0-d769-45fa-819c-d1015278947b
curl -X \
GET http://osapi.dct-tb.mtjade.cloud:9876/v2.0/lbaas/pools/64f1b9c0-d769-45fa-819c-d1015278947b \
-H "Accept: application/json" \
-H "X-Auth-Token: $token"



```







## quota
```bash
# openstack loadbalancer quota defaults show
[root@dct-queens-ctl-001 ~]# openstack loadbalancer quota defaults show
+----------------+-------+
| Field          | Value |
+----------------+-------+
| load_balancer  | -1    |
| listener       | -1    |
| pool           | -1    |
| health_monitor | -1    |
| member         | -1    |
+----------------+-------+

token=`openstack token issue | grep "| id" | awk '{print $4}'`
curl -X GET \
http://osapi.dct-tb.mtjade.cloud:9876/v2.0/lbaas/quotas/defaults \
-H "Accept: application/json" \
-H "X-Auth-Token: $token"








##################################################
# openstack loadbalancer quota list
token=`openstack token issue | grep "| id" | awk '{print $4}'`
curl -X GET \
http://osapi.dct-tb.mtjade.cloud:9876/v2.0/lbaas/quotas \
-H "Accept: application/json" \
-H "X-Auth-Token: $token"



[root@dct-queens-ctl-001 ~]# openstack loadbalancer quota list
+----------------------------------+---------------+----------+------+----------------+--------+
| project_id                       | load_balancer | listener | pool | health_monitor | member |
+----------------------------------+---------------+----------+------+----------------+--------+
| 0492888a597f4c26ac161d106abf28d4 | None          | None     | None | None           | None   |
| 44d742b1543f407f9efa27d71b4b0889 | None          | None     | None | None           | None   |
| 4cf0e9a45b3e47f3b343add7c813af89 | None          | None     | None | None           | None   |
| cbae0f5332c34ddab61d06fff56a449f | None          | None     | None | None           | None   |
| d034846b0c0f4df4b0ef6cae1bd9b306 | None          | None     | None | None           | None   |
+----------------------------------+---------------+----------+------+----------------+--------+






##################################################
# openstack loadbalancer quota show

token=`openstack token issue | grep "| id" | awk '{print $4}'`
curl -X GET \
http://osapi.dct-tb.mtjade.cloud:9876/v2.0/lbaas/quotas/0492888a597f4c26ac161d106abf28d4 \
-H "Accept: application/json" \
-H "X-Auth-Token: $token"

[root@dct-queens-ctl-001 ~]# openstack loadbalancer quota show 0492888a597f4c26ac161d106abf28d4
+----------------+-------+
| Field          | Value |
+----------------+-------+
| load_balancer  | -1    |
| listener       | -1    |
| pool           | -1    |
| health_monitor | -1    |
| member         | -1    |
+----------------+-------+


# openstack loadbalancer quota set

openstack loadbalancer quota set cfdc857f42274e2ea6b30dd844e23ca5 \
--healthmonitor -1 \
--listener -1 \
--loadbalancer -1 \
--member -1 \
--pool -1

## format
curl -X PUT \
http://osapi.dct-tb.mtjade.cloud:9876/v2/lbaas/quotas/{project_id} \
-H "Content-Type: application/json" \
-H "X-Auth-Token: $token" \
-d '{
    "quota":
    {
        loadbalancer":10,
        "listener":-1,
        "member":50,
        "pool":-1,
        "healthmonitor":-1,
        "l7policy":15,
        "l7rule":25
    }
}'

curl -X PUT \
http://osapi.dct-tb.mtjade.cloud:9876/v2/lbaas/quotas/e3cd678b11784734bc366148aa37580e \
-H "Content-Type: application/json" \
-H "X-Auth-Token: $token" \
-d '{
    "quota":
    {
        loadbalancer":10,
        "listener":-1,
        "member":50,
        "pool":-1,
        "healthmonitor":-1,
        "l7policy":15,
        "l7rule":25
    }
}' 


token=`openstack token issue | grep "| id" | awk '{print $4}'`
curl -X PUT \
http://osapi.dct-tb.mtjade.cloud:9876/v2/lbaas/quotas/cfdc857f42274e2ea6b30dd844e23ca5 \
-H "Content-Type: application/json" \
-H "X-Auth-Token: $token" \
-d '{
    "quota":
    {
        loadbalancer":10,
        "listener":-1,
        "member":50,
        "pool":-1,
        "healthmonitor":-1,
        "l7policy":15,
        "l7rule":25
    }
}' 

## deneil.yz.huang@foxconn.com_20221109  project_id
cfdc857f42274e2ea6b30dd844e23ca5 



curl -g -i -X PUT \
http://osapi.dct-tb.mtjade.cloud:9876/v2.0/lbaas/quotas/cfdc857f42274e2ea6b30dd844e23ca5 \
-H "Content-Type: application/json" \
-H "Accept: application/json" \
-H "X-Auth-Token: $token" \
-d '{
    "quota": 
    {
        "load_balancer": -1, 
        "listener": -1, 
        "health_monitor": -1, 
        "member": -1, 
        "pool": -1
    }
}'


# openstack loadbalancer quota reset



```

