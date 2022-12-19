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
FICO-Rocky-linux-9.0



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
