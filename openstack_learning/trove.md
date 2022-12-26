

trove create \
<name> \
<flavor> \
--nic \


## 確認log message
- cat /var/log/messages | tail -50


## RAM 壞掉位置
```bash
[root@dct-liberty-ctldb-001 ~]# cat /sys/devices/system/edac/mc/mc0/csrow1/ch0_dimm_label
CPU_SrcID#0_Ha#0_Chan#0_DIMM#1
[root@dct-liberty-ctldb-001 ~]# cat /sys/devices/system/edac/mc/mc0/csrow1/ch1_dimm_label 
CPU_SrcID#0_Ha#0_Chan#1_DIMM#1
```




```bash
Nov  3 17:40:22 dct-liberty-ctldb-001 kernel: EDAC MC0: 29589 CE memory read error on CPU_SrcID#0_Ha#0_Chan#0_DIMM#1 (channel:0 slot:1 page:0x17374e offset:0x0 grain:32 syndrome:0x0 -  OVERFLOW area:DRAM err_code:0001:0090 socket:0 ha:0 channel_mask:1 rank:4)
Nov  3 17:40:23 dct-liberty-ctldb-001 kernel: EDAC MC0: 26106 CE memory read error on CPU_SrcID#0_Ha#0_Chan#1_DIMM#1 (channel:1 slot:1 page:0xd3559e offset:0x240 grain:32 syndrome:0x0 -  OVERFLOW 
area:DRAM err_code:0001:0090 socket:0 ha:0 channel_mask:2 rank:5)
Nov  3 17:40:23 dct-liberty-ctldb-001 cinder-volume: 2022-11-03 17:40:23.679 4373 WARNING oslo_db.sqlalchemy.engines [-] SQL connection failed. 5 attempts left.
Nov  3 17:40:24 dct-liberty-ctldb-001 kernel: EDAC MC0: 32543 CE memory read error on CPU_SrcID#0_Ha#0_Chan#0_DIMM#1 (channel:0 slot:1 page:0x9eb379 offset:0x600 grain:32 syndrome:0x0 -  OVERFLOW 
area:DRAM err_code:0001:0090 socket:0 ha:0 channel_mask:1 rank:5)
Nov  3 17:40:25 dct-liberty-ctldb-001 kernel: EDAC MC0: 24678 CE memory read error on CPU_SrcID#0_Ha#0_Chan#0_DIMM#1 (channel:0 slot:1 page:0x1feda4d offset:0x0 grain:32 syndrome:0x0 -  OVERFLOW area:DRAM err_code:0001:0090 socket:0 ha:0 channel_mask:1 rank:4)
Nov  3 17:40:26 dct-liberty-ctldb-001 kernel: EDAC MC0: 20598 CE memory read error on CPU_SrcID#0_Ha#0_Chan#0_DIMM#1 (channel:0 slot:1 page:0x17374e offset:0x0 grain:32 syndrome:0x0 -  OVERFLOW area:DRAM err_code:0001:0090 socket:0 ha:0 channel_mask:1 rank:4)
Nov  3 17:40:26 dct-liberty-ctldb-001 trove-conductor: 2022-11-03 17:40:26.589 1802 DEBUG trove.conductor.manager [-] Instance ID: b80fdd79-bfa4-45d8-8ad4-1163678479bd heartbeat /usr/lib/python2.7/site-packages/trove/conductor/manager.py:85
Nov  3 17:40:26 dct-liberty-ctldb-001 trove-conductor: 2022-11-03 17:40:26.589 1802 DEBUG trove.conductor.manager [-] Payload: {u'service_status': u'running'} heartbeat /usr/lib/python2.7/site-packages/trove/conductor/manager.py:86
Nov  3 17:40:26 dct-liberty-ctldb-001 trove-conductor: 2022-11-03 17:40:26.591 1802 ERROR oslo_messaging.rpc.dispatcher [-] Exception during message handling: (_mysql_exceptions.OperationalError) 
(2013, 'Lost connection to MySQL server at \'reading initial communication packet\', system error: 0 "Internal error/check (Not system error)"')
Nov  3 17:40:26 dct-liberty-ctldb-001 trove-conductor: 2022-11-03 17:40:26.591 1802 ERROR oslo_messaging.rpc.dispatcher Traceback (most recent call last):
Nov  3 17:40:26 dct-liberty-ctldb-001 trove-conductor: 2022-11-03 17:40:26.591 1802 ERROR oslo_messaging.rpc.dispatcher   File "/usr/lib/python2.7/site-packages/oslo_messaging/rpc/dispatcher.py", 
line 142, in _dispatch_and_reply
Nov  3 17:40:26 dct-liberty-ctldb-001 trove-conductor: 2022-11-03 17:40:26.591 1802 ERROR oslo_messaging.rpc.dispatcher     executor_callback))
Nov  3 17:40:26 dct-liberty-ctldb-001 trove-conductor: 2022-11-03 17:40:26.591 1802 ERROR oslo_messaging.rpc.dispatcher   File "/usr/lib/python2.7/site-packages/oslo_messaging/rpc/dispatcher.py", 
line 186, in _dispatch
Nov  3 17:40:26 dct-liberty-ctldb-001 trove-conductor: 2022-11-03 17:40:26.591 1802 ERROR oslo_messaging.rpc.dispatcher     executor_callback)
Nov  3 17:40:26 dct-liberty-ctldb-001 trove-conductor: 2022-11-03 17:40:26.591 1802 ERROR oslo_messaging.rpc.dispatcher   File "/usr/lib/python2.7/site-packages/oslo_messaging/rpc/dispatcher.py", 
line 129, in _do_dispatch
Nov  3 17:40:26 dct-liberty-ctldb-001 trove-conductor: 2022-11-03 17:40:26.591 1802 ERROR oslo_messaging.rpc.dispatcher     result = func(ctxt, **new_args)
Nov  3 17:40:26 dct-liberty-ctldb-001 trove-conductor: 2022-11-03 17:40:26.591 1802 ERROR oslo_messaging.rpc.dispatcher   File "/usr/lib/python2.7/site-packages/osprofiler/profiler.py", line 105, 
in wrapper
Nov  3 17:40:26 dct-liberty-ctldb-001 trove-conductor: 2022-11-03 17:40:26.591 1802 ERROR oslo_messaging.rpc.dispatcher     return f(*args, **kwargs)
Nov  3 17:40:26 dct-liberty-ctldb-001 trove-conductor: 2022-11-03 17:40:26.591 1802 ERROR oslo_messaging.rpc.dispatcher   File "/usr/lib/python2.7/site-packages/trove/conductor/manager.py", line 88, in heartbeat
Nov  3 17:40:26 dct-liberty-ctldb-001 trove-conductor: 2022-11-03 17:40:26.591 1802 ERROR oslo_messaging.rpc.dispatcher     instance_id=instance_id)
Nov  3 17:40:26 dct-liberty-ctldb-001 trove-conductor: 2022-11-03 17:40:26.591 1802 ERROR oslo_messaging.rpc.dispatcher   File "/usr/lib/python2.7/site-packages/trove/db/models.py", line 96, in find_by
Nov  3 17:40:26 dct-liberty-ctldb-001 trove-conductor: 2022-11-03 17:40:26.591 1802 ERROR oslo_messaging.rpc.dispatcher     model = cls.get_by(**conditions)
Nov  3 17:40:26 dct-liberty-ctldb-001 trove-conductor: 2022-11-03 17:40:26.591 1802 ERROR oslo_messaging.rpc.dispatcher   File "/usr/lib/python2.7/site-packages/trove/db/models.py", line 117, in get_by
Nov  3 17:40:26 dct-liberty-ctldb-001 trove-conductor: 2022-11-03 17:40:26.591 1802 ERROR oslo_messaging.rpc.dispatcher     return get_db_api().find_by(cls, **cls._process_conditions(kwargs))     
Nov  3 17:40:26 dct-liberty-ctldb-001 trove-conductor: 2022-11-03 17:40:26.591 1802 ERROR oslo_messaging.rpc.dispatcher   File "/usr/lib/python2.7/site-packages/trove/db/sqlalchemy/api.py", line 50, in find_by
Nov  3 17:40:26 dct-liberty-ctldb-001 trove-conductor: 2022-11-03 17:40:26.591 1802 ERROR oslo_messaging.rpc.dispatcher     return _query_by(model, **kwargs).first()
Nov  3 17:40:26 dct-liberty-ctldb-001 trove-conductor: 2022-11-03 17:40:26.591 1802 ERROR oslo_messaging.rpc.dispatcher   File "/usr/lib64/python2.7/site-packages/sqlalchemy/orm/query.py", line 2634, in first
Nov  3 17:40:26 dct-liberty-ctldb-001 trove-conductor: 2022-11-03 17:40:26.591 1802 ERROR oslo_messaging.rpc.dispatcher     ret = list(self[0:1])
Nov  3 17:40:26 dct-liberty-ctldb-001 trove-conductor: 2022-11-03 17:40:26.591 1802 ERROR oslo_messaging.rpc.dispatcher   File "/usr/lib64/python2.7/site-packages/sqlalchemy/orm/query.py", line 2457, in __getitem__
Nov  3 17:40:26 dct-liberty-ctldb-001 trove-conductor: 2022-11-03 17:40:26.591 1802 ERROR oslo_messaging.rpc.dispatcher     return list(res)
Nov  3 17:40:26 dct-liberty-ctldb-001 trove-conductor: 2022-11-03 17:40:26.591 1802 ERROR oslo_messaging.rpc.dispatcher   File "/usr/lib64/python2.7/site-packages/sqlalchemy/orm/query.py", line 2736, in __iter__
Nov  3 17:40:26 dct-liberty-ctldb-001 trove-conductor: 2022-11-03 17:40:26.591 1802 ERROR oslo_messaging.rpc.dispatcher     return self._execute_and_instances(context)
Nov  3 17:40:26 dct-liberty-ctldb-001 trove-conductor: 2022-11-03 17:40:26.591 1802 ERROR oslo_messaging.rpc.dispatcher   File "/usr/lib64/python2.7/site-packages/sqlalchemy/orm/query.py", line 2749, in _execute_and_instances
Nov  3 17:40:26 dct-liberty-ctldb-001 trove-conductor: 2022-11-03 17:40:26.591 1802 ERROR oslo_messaging.rpc.dispatcher     close_with_result=True)
Nov  3 17:40:26 dct-liberty-ctldb-001 trove-conductor: 2022-11-03 17:40:26.591 1802 ERROR oslo_messaging.rpc.dispatcher   File "/usr/lib64/python2.7/site-packages/sqlalchemy/orm/query.py", line 2740, in _connection_from_session
Nov  3 17:40:26 dct-liberty-ctldb-001 trove-conductor: 2022-11-03 17:40:26.591 1802 ERROR oslo_messaging.rpc.dispatcher     **kw)
Nov  3 17:40:26 dct-liberty-ctldb-001 trove-conductor: 2022-11-03 17:40:26.591 1802 ERROR oslo_messaging.rpc.dispatcher   File "/usr/lib64/python2.7/site-packages/sqlalchemy/orm/session.py", line 
905, in connection
```





[root@dct-liberty-ctldb-003 ~]# history
 1978  2022-11-03 16:52:02 pcs status
 1979  2022-11-03 16:52:30 ls
 1980  2022-11-03 16:21:06 systemctl status openstack-cinder
 1981  2022-11-03 16:21:08 systemctl status openstack-cinder*
 1982  2022-11-03 16:21:33 rabbitmqctl cluster_status
 1983  2022-11-03 16:23:20 rabbitmqctl list_users
 1984  2022-11-03 16:23:36 systemctl status rabbitmq*
 1985  2022-11-03 16:23:46 rabbitmqctl start_app
 1986  2022-11-03 16:26:58 ssh dct-liberty-ctldb-002
 1987  2022-11-03 16:27:18 pcs status
 1988  2022-11-03 16:27:26 ssh 192.168.8.9
 1989  2022-11-03 17:03:37 vim /var/log/mysqld.log
 1990  2022-11-03 17:04:13 pcs cluster start galera-cluster dct-liberty-ctldb-003
 1991  2022-11-03 17:04:29 pcs status
 1992  2022-11-03 17:04:45 crm_resource -P
 1993  2022-11-03 17:04:48 pcs status
 1994  2022-11-03 17:04:57 vim /var/log/mysqld.log
 1995  2022-11-03 17:05:08 mysql



[root@dct-liberty-ctldb-001 ~]#
 1989  2022-11-03 16:56:59 pcs cluster start dct-liberty-ctldb-001
 1990  2022-11-03 16:57:08 pcs status
 1991  2022-11-03 16:57:28 crm_resource -P
 1992  2022-11-03 16:57:31 pcs status
 1993  2022-11-03 16:57:57 pcs cluster stop dct-liberty-ctldb-001
 1994  2022-11-03 17:01:03 pcs status


 1955  2022-11-03 17:50:09 journalctl -xe
 1956  2022-11-03 17:50:42 ssh dct-liberty-ctldb-003
 1957  2022-11-03 17:53:18 ip a
 1958  2022-11-03 18:02:57 ssh 192.168.8.10
 1959  2022-11-03 17:32:46 ssh dct-liberty-ctldb-002
 1960  2022-11-03 17:33:02 ssh 192.168.8.9
 1961  2022-11-03 17:07:28 ssh 192.168.8.10
 1962  2022-11-03 16:35:08 ssh 192.168.8.8
 1963  2022-11-03 16:35:20 ssh 192.168.8.9
 1964  2022-11-03 17:14:51 ethtool eth10g1
 1965  2022-11-03 17:15:04 ethtool eth10g2
 1966  2022-11-03 17:15:17 ethtool eth1g1
 1967  2022-11-03 17:15:19 ethtool eth1g2
 1968  2022-11-03 17:22:55 ssh dct-liberty-ctldb-003
 1969  2022-11-03 17:23:35 ifdown bond23.519 && ifup bond23.519
 1970  2022-11-03 17:23:39 ssh dct-liberty-ctldb-003
 1971  2022-11-03 17:23:44 vim /var/log/messages
 1972  2022-11-03 17:25:03 ls /var/lib/mysql/
 1973  2022-11-03 17:25:08 ls -al /var/lib/mysql/
 1974  2022-11-03 17:25:26 cat /var/lib/mysql/grastate.dat
 1975  2022-11-03 17:26:03 pcs status
 1976  2022-11-03 17:26:44 pcs resource restart galera-cluster-master
 1977  2022-11-03 17:27:06 pcs cluster start galera-cluster dct-liberty-ctldb-001
 1978  2022-11-03 17:27:46 pcs status
 1979  2022-11-03 17:27:59 pcs cluster standby galera-cluster dct-liberty-ctldb-001
 1980  2022-11-03 17:28:16 pcs cluster standby dct-liberty-ctldb-001
 1981  2022-11-03 17:28:21 pcs status
 1982  2022-11-03 17:31:28 pcs cluster standby dct-liberty-ctldb-001
 1983  2022-11-03 17:31:33 pcs status
 1984  2022-11-03 17:31:58 pcs cluster stop galera-cluster dct-liberty-ctldb-001
 1985  2022-11-03 17:35:22 pcs status
 1986  2022-11-03 17:35:41 vim /var/log/mysqld.log
 1987  2022-11-03 17:36:09 mysql
 1988  2022-11-03 17:36:25 pcs cluster start galera-cluster dct-liberty-ctldb-001
 1989  2022-11-03 17:36:59 pcs status
 1990  2022-11-03 17:38:36 pcs cluster restart galera-cluster dct-liberty-ctldb-001
 1991  2022-11-03 17:43:11 pcs status
 1992  2022-11-03 17:46:52 systemctl restart neutron*
 1993  2022-11-03 17:53:08 jouijo
 1994  2022-11-03 17:58:20 vim /var/log/messages
 1995  2022-11-03 18:01:15 ssh 192.168.8.9
 1996  2022-11-03 18:04:17 rabbitmqctl status
 1997  2022-11-03 18:04:31 systemctl status rabbitmq*
 1998  2022-11-03 18:04:41 rabbitmqctl start_app
 1999  2022-11-03 18:04:53 rabbitmqctl cluster_status







[root@dct-liberty-ctldb-002 ~]#
 1993  2022-11-03 16:15:33 ip a
 1994  2022-11-03 16:15:51 ifdown br_openstack && ifup br_openstack
 1995  2022-11-03 16:16:15 ip a
 1996  2022-11-03 16:18:21 ipdown bond23.519 && ifup bond23.519
 1997  2022-11-03 16:18:26 ifdown bond23.519 && ifup bond23.519
 1998  2022-11-03 16:40:38 mysql -u root -p
 1999  2022-11-03 16:27:41 pcs status
 2000  2022-11-03 16:28:16 ssh dct-liberty-ctldb-001




