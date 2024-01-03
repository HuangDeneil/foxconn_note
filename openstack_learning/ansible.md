
## Carpstack (KHQ-testBed)
persp@172.16.16.52

## 使用root操作
sudo su

# update-Queens-Patch-2023-October-0-deneil-test.yaml
ansible-playbook -i /opt/deploy/ansible/inventory/iaas_inventory.ini /opt/deploy/ansible/update-Queens-Patch-2023-October-0-deneil-test.yaml


# update-Queens-Patch-2023-October-0.yaml
ansible-playbook -i /opt/deploy/ansible/inventory/iaas_inventory.ini /opt/deploy/ansible/update-Queens-Patch-2023-October-0.yaml


## 單獨測試 cinder-volume restart
ansible-playbook -i /opt/deploy/ansible/inventory/iaas_inventory.ini /opt/deploy/ansible/deneil-test1.yml

- 測試原因 : 這次是RPM 升級不是修改conf，所以restart要寫在playbook
 - RPM 雖然使用yum 管理，update後會重啟，但 cinder-volume 是用 pcs 管理所以重啟需要另外處理 

### deneil-test1.yml 

```yml
---
- name: Restart cinder-volume service
  hosts: Control_hosts[0]
  tasks:
    - shell: |
      pcs resource restart cinder-volume

```


# 紀錄

## 測試前

```bash

[root@dct-queens-ctl-001 ~]# pcs status
Cluster name: HAstack
Stack: corosync
Current DC: dct-queens-ctl-001 (version 1.1.16-12.el7_4.2.0.0.rdo1-94ff4df) - partition with quorum
Last updated: Tue Oct 31 11:58:47 2023
Last change: Fri Oct 27 16:42:29 2023 by root via crm_resource on dct-queens-ctl-001

3 nodes configured
6 resources configured

Online: [ dct-queens-ctl-001 dct-queens-ctl-002 dct-queens-ctl-003 ]

Full list of resources:

 Master/Slave Set: galera-cluster-master [galera-cluster]
     Masters: [ dct-queens-ctl-001 dct-queens-ctl-002 dct-queens-ctl-003 ]
 ceilomter-cinder-audit (ocf::heartbeat:symlink):       Started dct-queens-ctl-001
 aodh-notifier  (systemd:openstack-aodh-notifier):      Started dct-queens-ctl-002
 cinder-volume  (systemd:openstack-cinder-volume):      Started dct-queens-ctl-003

Daemon Status:
  corosync: active/enabled
  pacemaker: active/enabled
  pcsd: active/enabled


#### 剛執行
[root@dct-queens-ctl-001 ~]# pcs status
Cluster name: HAstack
Stack: corosync
Current DC: dct-queens-ctl-001 (version 1.1.16-12.el7_4.2.0.0.rdo1-94ff4df) - partition with quorum
Last updated: Tue Oct 31 12:11:03 2023
Last change: Tue Oct 31 12:10:58 2023 by root via crm_resource on dct-queens-ctl-001

3 nodes configured
6 resources configured (1 DISABLED)

Online: [ dct-queens-ctl-001 dct-queens-ctl-002 dct-queens-ctl-003 ]

Full list of resources:

 Master/Slave Set: galera-cluster-master [galera-cluster]
     Masters: [ dct-queens-ctl-001 dct-queens-ctl-002 dct-queens-ctl-003 ]
 ceilomter-cinder-audit (ocf::heartbeat:symlink):       Started dct-queens-ctl-001
 aodh-notifier  (systemd:openstack-aodh-notifier):      Started dct-queens-ctl-002
 cinder-volume  (systemd:openstack-cinder-volume):      Started dct-queens-ctl-003 (disabled)

Daemon Status:
  corosync: active/enabled
  pacemaker: active/enabled
  pcsd: active/enabled


```
