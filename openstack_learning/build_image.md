# CentOS-Stream-GenericCloud-9-20210830.0.x86_64.qcow2
wget http://cloud.centos.org/centos/9-stream/x86_64/images/CentOS-Stream-GenericCloud-9-20210830.0.x86_64.qcow2

# make image
openstack image create \
--public \
--disk-format qcow2 \
--container-format bare \
--file CentOS-Stream-GenericCloud-9-20210830.0.x86_64.qcow2 \
--min-disk 20 \
--min-ram 2048 \
--property title="CentOS Stream 9" \
--property type="linux" \
CentOS-Stream-GenericCloud-9-20210830.0.x86_64

# start instance
openstack server create \
--flavor FiCo-v2m4-Q10 \
--image 1e1da046-575f-4e41-8559-b4ae31b2db61 \
--nic net-id=764abfc0-05ee-4a6e-8b2b-5e0b81af9bf2 \
--security-group 5834f3df-02de-4152-8076-d58c715b6931 \
--key-name deneil_keypair \
--user-data password-cloud-init \
deneil_centos_stream_9

```bash
+-------------------------------------+---------------------------------------------------------------------------------------+
| Field                               | Value                                                                                 |
+-------------------------------------+---------------------------------------------------------------------------------------+
| OS-DCF:diskConfig                   | MANUAL                                                                                |
| OS-EXT-AZ:availability_zone         |                                                                                       |
| OS-EXT-SRV-ATTR:host                | None                                                                                  |
| OS-EXT-SRV-ATTR:hypervisor_hostname | None                                                                                  |
| OS-EXT-SRV-ATTR:instance_name       |                                                                                       |
| OS-EXT-STS:power_state              | NOSTATE                                                                               |
| OS-EXT-STS:task_state               | scheduling                                                                            |
| OS-EXT-STS:vm_state                 | building                                                                              |
| OS-SRV-USG:launched_at              | None                                                                                  |
| OS-SRV-USG:terminated_at            | None                                                                                  |
| accessIPv4                          |                                                                                       |
| accessIPv6                          |                                                                                       |
| addresses                           |                                                                                       |
| adminPass                           | qhgQLVsfZd9r                                                                          |
| config_drive                        |                                                                                       |
| created                             | 2022-11-29T00:58:49Z                                                                  |
| flavor                              | FiCo-v2m4-Q10 (5454752f-ce6c-41b4-a42d-1596d7dc78c3)                                  |
| hostId                              |                                                                                       |
| id                                  | f99b8695-2bca-43e9-9489-d4851957a94d                                                  |
| image                               | CentOS-Stream-GenericCloud-9-20210830.0.x86_64 (1e1da046-575f-4e41-8559-b4ae31b2db61) |
| key_name                            | deneil_keypair                                                                        |
| name                                | deneil_centos_stream_9                                                                |
| progress                            | 0                                                                                     |
| project_id                          | cfdc857f42274e2ea6b30dd844e23ca5                                                      |
| properties                          |                                                                                       |
| security_groups                     | name='5834f3df-02de-4152-8076-d58c715b6931'                                           |
| status                              | BUILD                                                                                 |
| updated                             | 2022-11-29T00:58:49Z                                                                  |
| user_id                             | 1e4c99ca5b2a4fcd98d3663e8e10228a                                                      |
| volumes_attached                    |                                                                                       |
+-------------------------------------+---------------------------------------------------------------------------------------+
```
user/passwd:
root/qhgQLVsfZd9r 
cloud-user/foxconn







# Rocky-9-GenericCloud.latest.x86_64.qcow2
wget http://download.rockylinux.org/pub/rocky/8/isos/x86_64/Rocky-8.7-x86_64-minimal.iso

# Rocky-9-GenericCloud.latest.x86_64.qcow2
openstack image create \
--public \
--disk-format qcow2 \
--container-format bare \
--file Rocky-9-GenericCloud.latest.x86_64.qcow2 \
--min-disk 20 \
--min-ram 2048 \
--property title="Rocky linux 9" \
--property type="linux" \
Rocky-9-GenericCloud.latest.x86_64


openstack server create \
--flavor FiCo-v2m4-Q10 \
--image 321e5198-a54a-4b29-bafc-19b040ac1f82 \
--nic net-id=764abfc0-05ee-4a6e-8b2b-5e0b81af9bf2 \
--security-group 5834f3df-02de-4152-8076-d58c715b6931 \
--key-name deneil_keypair \
--user-data password-cloud-init \
deneil_rocky_instance-2 


openstack server create \
--flavor FiCo-v4m8-Q5 \
--image 41af64d0-987b-4f58-ab92-759973b222a7 \
--nic net-id=764abfc0-05ee-4a6e-8b2b-5e0b81af9bf2 \
--security-group e3cdc39a-53f0-427a-8098-48785d2e7b4e \
--key-name deneil_keypair \
--user-data password-cloud-init \
deneil_rocky_barbican_test


openstack server create \
--flavor FiCo-v4m8-Q5 \
--image 41af64d0-987b-4f58-ab92-759973b222a7 \
--nic net-id=764abfc0-05ee-4a6e-8b2b-5e0b81af9bf2 \
--security-group e3cdc39a-53f0-427a-8098-48785d2e7b4e \
--key-name deneil_keypair \
--user-data password-cloud-init \
deneil_rocky_barbican_test-3


openstack server create \
--flavor FiCo-v4m8-Q5 \
--image 41af64d0-987b-4f58-ab92-759973b222a7 \
--nic net-id=764abfc0-05ee-4a6e-8b2b-5e0b81af9bf2 \
--security-group e3cdc39a-53f0-427a-8098-48785d2e7b4e \
--key-name deneil_keypair \
--user-data rocky-password-cloud-init \
deneil_rocky_barbican_test-cloud-init






```config
#cloud-config
password: foxconn
chpasswd: { expire: False }
ssh_pwauth: True
```
 >>> login : 
ssh rocky@192.168.66.6
password : foxconn 




```bash

[root@dct-queens-ctl-001 deneil-dev]# openstack server create \
> --flavor FiCo-v2m4-Q10 \
> --image 523df8d6-b566-47fe-9468-836acd386898 \
> --nic net-id=cb807b61-8351-41fa-a635-add24dc7612f \
> --security-group 5834f3df-02de-4152-8076-d58c715b6931 \
> --key-name deneil_keypair \
> --user-data password-cloud-init \
> deneil_rocky_instance-2
+-------------------------------------+------------------------------------------------------+
| Field                               | Value                                                |
+-------------------------------------+------------------------------------------------------+
| OS-DCF:diskConfig                   | MANUAL                                               |
| OS-EXT-AZ:availability_zone         |                                                      |
| OS-EXT-SRV-ATTR:host                | None                                                 |
| OS-EXT-SRV-ATTR:hypervisor_hostname | None                                                 |
| OS-EXT-SRV-ATTR:instance_name       |                                                      |
| OS-EXT-STS:power_state              | NOSTATE                                              |
| OS-EXT-STS:task_state               | scheduling                                           |
| OS-EXT-STS:vm_state                 | building                                             |
| OS-SRV-USG:launched_at              | None                                                 |
| OS-SRV-USG:terminated_at            | None                                                 |
| accessIPv4                          |                                                      |
| accessIPv6                          |                                                      |
| addresses                           |                                                      |
| adminPass                           | 22M6TNsXiEtk                                         |
| config_drive                        |                                                      |
| created                             | 2022-11-28T07:06:12Z                                 |
| flavor                              | FiCo-v2m4-Q10 (5454752f-ce6c-41b4-a42d-1596d7dc78c3) |
| hostId                              |                                                      |
| id                                  | 7f768bbe-f584-4726-8ea4-520a64d69ac0                 |
| image                               | Rocky-9 (523df8d6-b566-47fe-9468-836acd386898)       |
| key_name                            | deneil_keypair                                       |
| name                                | deneil_rocky_instance-2                              |
| progress                            | 0                                                    |
| project_id                          | cfdc857f42274e2ea6b30dd844e23ca5                     |
| properties                          |                                                      |
| security_groups                     | name='5834f3df-02de-4152-8076-d58c715b6931'          |
| status                              | BUILD                                                |
| updated                             | 2022-11-28T07:06:12Z                                 |
| user_id                             | 1e4c99ca5b2a4fcd98d3663e8e10228a                     |
| volumes_attached                    |                                                      |
+-------------------------------------+------------------------------------------------------+

```






## Windows image download
FICO-Win2k16-SPLA
22c804a1-d1df-4a69-b6cd-6ca7b48d2a7b
glance image-download --file ./example-test.img 0a[...]5dd

glance image-download --file ./FICO-Win2k16-SPLA-test.qcow2 22c804a1-d1df-4a69-b6cd-6ca7b48d2a7b

openstack image save --file ./FICO-Win2k16-SPLA-test.qcow2 22c804a1-d1df-4a69-b6cd-6ca7b48d2a7b


65004f50-52de-4a9e-9080-3adabeae4b2c | FICO-Win2k12r2-SPLA 

glance image-download --file ./FICO-Win2k12r2-SPLA.qcow2 65004f50-52de-4a9e-9080-3adabeae4b2c

openstack image save --file ./FICO-Win2k12r2-SPLA.qcow2 65004f50-52de-4a9e-9080-3adabeae4b2c

```bash
[root@dct-queens-ctl-001 ~]# openstack image show 22c804a1-d1df-4a69-b6cd-6ca7b48d2a7b
+------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Field            | Value                                                                                                                                                                  |
+------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| checksum         | 7950681d6a9dd9fc50552b78384cfd4d                                                                                                                                       |
| container_format | bare                                                                                                                                                                   |
| created_at       | 2021-05-12T00:04:22Z                                                                                                                                                   |
| disk_format      | qcow2                                                                                                                                                                  |
| file             | /v2/images/22c804a1-d1df-4a69-b6cd-6ca7b48d2a7b/file                                                                                                                   |
| id               | 22c804a1-d1df-4a69-b6cd-6ca7b48d2a7b                                                                                                                                   |
| min_disk         | 50                                                                                                                                                                     |
| min_ram          | 4096                                                                                                                                                                   |
| name             | FICO-Win2k16-SPLA                                                                                                                                                      |
| owner            | d034846b0c0f4df4b0ef6cae1bd9b306                                                                                                                                       |
| properties       | direct_url='rbd://d68ac620-6261-49bf-bbad-ef792ccb5270/images/22c804a1-d1df-4a69-b6cd-6ca7b48d2a7b/snap', os_type='windows', os_version='windows-2016', release='True' |
| protected        | True                                                                                                                                                                   |
| schema           | /v2/schemas/image                                                                                                                                                      |
| size             | 13472563200                                                                                                                                                            |
| status           | active                                                                                                                                                                 |
| tags             | os_type=windows, os_version=windows-2016                                                                                                                               |
| updated_at       | 2021-05-12T00:08:49Z                                                                                                                                                   |
| virtual_size     | None                                                                                                                                                                   |
| visibility       | public                                                                                                                                                                 |
+------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

```


Foxconn image ftp server information
```bash
sftp fixo@10.62.166.8
fixo@10.62.166.8's : Openstack_Y)$
cd FiXo/VM_Images
```




###### #############################################################
###### #############################################################
###### #############################################################
###### #############################################################

# Windows image

# make image
openstack image create \
--public \
--disk-format qcow2 \
--container-format bare \
--file FICO-Win2k16-SPLA.qcow2 \
--min-disk 20 \
--min-ram 2048 \
--property title="FICO-Win2k16-SPLA" \
--property type="windows" \
--property os_version="Win2k16-SPLA" \
--property os_type="windows" \
--property release="true" \
FICO-Win2k16-SPLA



# make image
openstack image create \
--public \
--disk-format qcow2 \
--container-format bare \
--file winserver-2019-standard-cloudinit-20201231-2.qcow2 \
--min-disk 20 \
--min-ram 2048 \
--property title="winserver-2019-standard" \
--property type="windows" \
--property os_version="winserver-2019-standard" \
--property os_type="windows" \
--property release="true" \
winserver-2019-standard-cloudinit








openstack image create \
--public \
--disk-format qcow2 \
--container-format bare \
--file winserver-2019-standard-v3-20210105.qcow2 \
--min-disk 20 \
--min-ram 2048 \
--property title="FICO-winserver-2019-standard-withpasswd" \
--property type="windows" \
--property os_version="windows server-2019-standard" \
--property os_type="windows" \
--property release="true" \
FICO-winserver-2019-standard-cloudinit-withpasswd




openstack image create \
--public \
--disk-format qcow2 \
--container-format bare \
--file FICO-Win2k16-SPLA.qcow2 \
--min-disk 20 \
--min-ram 2048 \
--property os_version="windows 2016" \
--property os_type="windows" \
--property release="true" \
FICO-Win2k16-SPLA-test


## 2022/12/06 FICO-Win2k16-DataCenter-CHT.qcow2
openstack image create \
--public \
--disk-format qcow2 \
--container-format bare \
--file FICO-Win2k16-DataCenter-CHT.qcow2 \
--min-disk 20 \
--min-ram 2048 \
--property os_version="windows 2016" \
--property os_type="windows" \
--property release="true" \
--tag os_type=windows \
--tag os_version=windows-2016  \
FICO-Win2k16-DataCenter-CHT

os_type=windows
os_version=windows-2016 


# winserver-2019-standard-v3-20210105.qcow2
openstack image create \
--public \
--disk-format qcow2 \
--container-format bare \
--file winserver-2019-standard-v3-20210105.qcow2 \
--min-disk 50 \
--min-ram 2048 \
--property os_version="windows 2019" \
--property os_type="windows" \
--property release="true" \
--tag os_type=windows \
--tag os_version=windows-2019  \
FICO-winserver-2019-standard-v3-cloudinit-withpasswd



## FiXo CentOS
openstack image save --file ./FICO-CentOS-7.9-2009-1.qcow2 94b57838-ee09-47f3-8c59-6f654005a3d3

openstack image create \
--public \
--disk-format qcow2 \
--container-format bare \
--file FICO-CentOS-7.9-2009-1.qcow2 \
--min-disk 20 \
--min-ram 2048 \
--property os_version="centos-7.9" \
--property os_type="linux" \
--property release="true" \
--tag os_type=linux \
--tag os_version=centos-7.9 \
FICO-CentOS-7.9-2009-1-1



# barbicanVM-on-Rocky-linux
openstack image create \
--public \
--disk-format qcow2 \
--container-format bare \
--file barbicanVM-localhost-version.qcow2 \
--property title="barbicanVM-localhost-version (Rocky linux 9)" \
--property os_version="rocky-linux-9.0" \
--property type="linux" \
--property release="true" \
--tag os_type=linux \
--tag os_version=Rocky_linux-9.0 \
barbicanVM-on-Rocky-linux



# note : 
## Metadata:
--property  os_type="linux"        >>> 建image時能夠讀到
--property os_version="centos-7.9" >>> 建image時能夠讀到
--property release="true"          >>> 建image時能夠讀到

## tag :
--tag os_type=linux                >>> dashboard能夠讀到
--tag os_version=centos-7.9        >>> dashboard能夠讀到


# Rocky-9-GenericCloud.latest.x86_64.qcow2
openstack image create \
--public \
--disk-format qcow2 \
--container-format bare \
--file Rocky-9-GenericCloud.latest.x86_64.qcow2 \
--min-disk 40 \
--min-ram 2048 \
--property os_type="linux" \
--property os_version="Rocky_linux-9.0" \
--property release="true" \
--tag os_type=linux \
--tag os_version=Rocky_linux-9.0 \
Rocky-linux-9.0-upload-test-0704



openstack server create \
--flavor FiCo-v2m4-Q10 \
--image 321e5198-a54a-4b29-bafc-19b040ac1f82 \
--nic net-id=764abfc0-05ee-4a6e-8b2b-5e0b81af9bf2 \
--security-group 5834f3df-02de-4152-8076-d58c715b6931 \
--key-name deneil_keypair \
--user-data password-cloud-init \
deneil_rocky_linux_9








## KH-testBed.L
openstack server create \
--flavor M2 \
--image 5db06f36-0df6-4560-8e43-a811ff67ee1d \
--nic net-id=fca993fc-fc6f-42b5-82a6-35220a3e6715 \
--security-group 50119033-a69e-4a80-ad75-010aac239339 \
--key-name deneil_key \
--user-data password-cloud-init \
deneil_rocky_linux_9



# FICO-Ubuntu-20.04
openstack image create \
--public \
--disk-format qcow2 \
--container-format bare \
--file FICO-Ubuntu-20.04.qcow2 \
--property os_type="linux" \
--property os_version="ubuntu-20.04" \
--property release="true" \
--tag os_type=linux \
--tag os_version=ubuntu-20.04 \
FICO-Ubuntu-20.04

FICO-Ubuntu-20.04.qcow2



openstack image create \
--public \
--disk-format qcow2 \
--container-format bare \
--file barbicanVM-test-volume-to-image.qcow2 \
--property description="rocky linux 9" \
--property os_type="linux" \
--property os_version="centos-7.9" \
--property release="true" \
--tag os_type=linux \
--tag os_version=centos-7.9 \
FICO-test-barbican-on-rocky-linux-9



barbicanVM-test-volume-to-image.qcow2


--nic net-id=c94ceb9a-c58e-4897-87ef-dac98e4993ca \

openstack server create \
--flavor FiCo-v4m8-Q1 \
--image 94051f44-b835-4c33-926b-43e9c5f4f4e5 \
--nic port-id=243204f2-4cc8-484e-ae08-780978b35835 \
--security-group fc45a76d-9621-4458-a37b-f5b99f8271a0 \
--key-name deneil_keypair \
--user-data password-cloud-init \
deneil_rocky_barbican_backup_test


openstack server create \
--flavor 2dc3ad92-9759-4f9d-b2d7-6aef171cd394 \
--image 03517740-3fe8-45c9-9866-36b313acd13d \
--nic port-id=243204f2-4cc8-484e-ae08-780978b35835 \
--security-group fc45a76d-9621-4458-a37b-f5b99f8271a0 \
--key-name deneil_keypair \
--user-data password-cloud-init \
deneil_rocky_barbican_backup_test

8b3b0cf9-a2cf-4075-8521-f35ecdea0878


### backup
```bash
# 要用admin 身分操作不然可能會卡權限 
source ~/admin-openrc.sh

volume_id="82d7aba7-e509-49cf-ae6d-ee67bb1270a3"

# VM 關機後改變 volume 狀態 從 in-use 變成 available 
cinder reset-state --state available ${volume_id}

# 將volume 轉換成 image
cinder upload-to-image ${volume_id} barbicanVM-test-volume-to-image --force=True --disk-format=qcow2

image_id=""

# download image 
openstack image save --file barbicanVM-test-volume-to-image.qcow2 $image_id



```

```bash

openstack server create \
--flavor FiCo-v2m4-Q10 \
--availability-zone Availability-Zone-1:dct-queens-com-002 \
--image ef734296-e550-4198-9c66-84ad2be5fce4 \
--nic net-id=ca85ca51-0324-494a-9046-bf5876654516 \
--security-group 6d72cd08-786a-4705-95e7-096a900928da \
--key-name deneil-keypair \
--user-data password-cloud-init \
deneil_test_key_rotation


openstack server create \
--flavor FiCo-v2m4-Q10 \
--availability-zone test-Spare-zone:dct-queens-com-014 \
--image ef734296-e550-4198-9c66-84ad2be5fce4 \
--nic net-id=ca85ca51-0324-494a-9046-bf5876654516 \
--security-group 6d72cd08-786a-4705-95e7-096a900928da \
--key-name deneil-keypair \
--user-data ~/deneil-dev/password-cloud-init \
deneil_test_VM_migration


openstack server create \
--flavor FiCo-v1m2-Q1 \
--image 98901246-af91-43d8-b5e6-a4506aa8f369 \
--block-device source=volume,id=d620d971-b160-4c4e-8652-2513d74e2080,dest=volume,shutdown=preserve \
  myInstanceWithVolume


nova boot \
  --flavor FiCo-v1m2-Q1 \
  --availability-zone test-Spare-zone:dct-queens-com-007-minsky \
  --security-groups controller_SG \
  --nic port-id=5749c52c-fd4b-4ce2-8a7a-70f2725faf74 \
  --boot-volume 955280b9-963b-4d2d-8cc5-7c86381b3d91 \
  --user-data /root/deneil-dev/password-cloud-init \
  --poll deneil-minsky-vm-test1


nova boot \
  --flavor FiCo-v4m8-Q1 \
  --security-groups b0f520aa-83dc-41f5-bac7-b17e6aa95557 \
  --nic port-id=987ba1d2-bcdc-4b3e-aebb-d780c452973c \
  --boot-volume abc14603-de74-49a4-9e47-d26c9ad4975e \
  --user-data /root/deneil-dev/password-cloud-init \
  --key-name deneil-keypair \
  --poll deneil-vm-test2


# openstack port list | grep admin
| 987ba1d2-bcdc-4b3e-aebb-d780c452973c | deneil-admin | fa:16:3e:aa:e4:f5 | ip_address='192.168.120.27', subnet_id='b755546e-ff4d-418d-9f28-59a389478a14'  | DOWN   |

## deneil-201-2
--nic net-id=b1e25bc7-99f3-4c61-b1fe-c4d7c9593d48



6dbef5ec-fb02-4f11-9c52-c3e63d8d4bfe |deneil-test-volume-6
0b582fea-0e5f-42d1-af63-61db93425e0e |deneil-test-volume-5
f5fc8d88-0796-4f2a-aeb8-ad46ae27e6c5 |deneil-test-volume-4
0b0fad0d-ede7-4348-a3f8-8aa9e075c54a |deneil-test-volume-3
3e031aff-7d63-460b-a7ec-b1ab3b71dbb4 |deneil-test-volume-2
dbae0c04-4314-45d4-832e-68bdf415b4c4 |deneil-test-volume-1
955280b9-963b-4d2d-8cc5-7c86381b3d91 |Attached to deneil-minsky-vm-test1 on /dev/vda 

## deneil-test-volume-1 , deneil-test-port-1
nova boot \
  --flavor FiCo-v4m8-Q1 \
  --availability-zone test-Spare-zone:dct-queens-com-009-minsky \
  --security-groups controller_SG \
  --nic port-id=7653b3c9-392b-4fab-bff4-20ea666342b8 \
  --boot-volume dbae0c04-4314-45d4-832e-68bdf415b4c4 \
  --user-data /root/deneil-dev/password-cloud-init \
  --poll deneil-minsky-vm-test-evacuate-1

## deneil-test-volume-2 , deneil-test-port-2
nova boot \
  --flavor FiCo-v4m8-Q1 \
  --availability-zone test-Spare-zone:dct-queens-com-009-minsky \
  --security-groups controller_SG \
  --nic port-id=c44f53ca-ba53-4ec6-af88-be59f7f92ee4 \
  --boot-volume 3e031aff-7d63-460b-a7ec-b1ab3b71dbb4 \
  --user-data /root/deneil-dev/password-cloud-init \
  --poll deneil-minsky-vm-test-evacuate-2


## deneil-test-volume-3 , deneil-test-port-3
nova boot \
  --flavor FiCo-v4m8-Q1 \
  --availability-zone test-Spare-zone:dct-queens-com-009-minsky \
  --security-groups controller_SG \
  --nic port-id=5c3fb46f-de01-47bc-bea3-cacf92d58f20 \
  --boot-volume 0b0fad0d-ede7-4348-a3f8-8aa9e075c54a \
  --user-data /root/deneil-dev/password-cloud-init \
  --poll deneil-minsky-vm-test-evacuate-3


## deneil-test-volume-4 , deneil-test-port-4
nova boot \
  --flavor FiCo-v4m8-Q1 \
  --availability-zone test-Spare-zone:dct-queens-com-009-minsky \
  --security-groups controller_SG \
  --nic port-id=de5fb266-9fe6-4b10-bb1b-0ebc3cc9d9d1 \
  --boot-volume f5fc8d88-0796-4f2a-aeb8-ad46ae27e6c5 \
  --user-data /root/deneil-dev/password-cloud-init \
  --poll deneil-minsky-vm-test-evacuate-4

## deneil-test-volume-5 , deneil-test-port-5
nova boot \
  --flavor FiCo-v4m8-Q1 \
  --availability-zone test-Spare-zone:dct-queens-com-008-minsky \
  --security-groups controller_SG \
  --nic port-id=a9c9704c-70a3-44f9-aace-b397f9b115be \
  --boot-volume 0b582fea-0e5f-42d1-af63-61db93425e0e\
  --user-data /root/deneil-dev/password-cloud-init \
  --poll deneil-minsky-vm-test-evacuate-5


## deneil-test-volume-6 , deneil-test-port-6
nova boot \
  --flavor FiCo-v2m4-Q10 \
  --availability-zone test-Spare-zone:dct-queens-com-008-minsky \
  --security-groups controller_SG \
  --nic port-id=da3a33e7-4469-4d41-9c62-6c7324c47c95 \
  --boot-volume 6dbef5ec-fb02-4f11-9c52-c3e63d8d4bfe \
  --user-data /root/deneil-dev/password-cloud-init \
  --poll deneil-minsky-vm-test-evacuate-6

openstack port create --network a835ccf4-a388-4ead-9f13-372056b9fdf1 deneil-test-port-4

## deneil-private-network (192.168.180.0/24)
--nic net-id=a835ccf4-a388-4ead-9f13-372056b9fdf1
c6719aeb-17fc-495f-a469-a803fef92d9e

  --availability-zone test-Spare-zone:dct-queens-com-014 \


openstack server create \
--flavor FiCo-v2m4-Q10 \
--availability-zone Availability-Zone-1:dct-queens-com-003 \
--image ef734296-e550-4198-9c66-84ad2be5fce4 \
--nic port-id=3273a948-293b-4608-b3ad-fa54356bd2fb \
--security-group e3cdc39a-53f0-427a-8098-48785d2e7b4e \
--key-name "openstack control node" \
--user-data password-cloud-init \
deneil_test_barbican-centos7





nova boot \
  --flavor FiCo-v1m2-Q1 \
  --availability-zone minsky-az:dct-queens-com-007 \
  --security-groups default \
  --nic net-id=9c68fbfe-8519-4472-bf1b-1419322db0f9 \
  --boot-volume 9f00c49e-d7bc-48ee-940b-a54cb890fb5c \
  --poll khq-st-minsky-vm-test6


```

