

wget http://ftp.udx.icscoe.jp/Linux/CentOS-stream/9-stream/BaseOS/x86_64/iso/CentOS-Stream-9-latest-x86_64-boot.iso


# CentOS-Stream-9-latest-x86_64-boot.iso
openstack image create \
--public \
--disk-format iso \
--container-format bare \
--file CentOS-Stream-9-latest-x86_64-boot.iso \
--min-disk 20 \
--min-ram 2048 \
--property title="CentOS Stream 9" \
--property type="linux" \
CentOS-Stream-9-latest-x86_64-boot

```bash
[root@dct-queens-ctl-001 deneil-dev]# openstack image create \
> --public \
> --disk-format iso \
> --container-format bare \
> --file CentOS-Stream-9-latest-x86_64-boot.iso \
> --min-disk 20 \
> --min-ram 2048 \
> --property title="CentOS Stream 9" \
> --property type="linux" \
> CentOS-Stream-9-latest-x86_64-boot
+------------------+-------------------------------------------------------------------------------------------------------------------------------------------------+
| Field            | Value                                                                                                                                           |
+------------------+-------------------------------------------------------------------------------------------------------------------------------------------------+
| checksum         | ced455d32cc3acbea7c6052ef0a413c0                                                                                                                |
| container_format | bare                                                                                                                                            |
| created_at       | 2022-11-29T00:38:43Z                                                                                                                            |
| disk_format      | iso                                                                                                                                             |
| file             | /v2/images/321e5198-a54a-4b29-bafc-19b040ac1f82/file                                                                                            |
| id               | 321e5198-a54a-4b29-bafc-19b040ac1f82                                                                                                            |
| min_disk         | 20                                                                                                                                              |
| min_ram          | 2048                                                                                                                                            |
| name             | CentOS-Stream-9-latest-x86_64-boot                                                                                                              |
| owner            | cfdc857f42274e2ea6b30dd844e23ca5                                                                                                                |
| properties       | direct_url='rbd://d68ac620-6261-49bf-bbad-ef792ccb5270/images/321e5198-a54a-4b29-bafc-19b040ac1f82/snap', title='CentOS Stream 9', type='linux' |
| protected        | False                                                                                                                                           |
| schema           | /v2/schemas/image                                                                                                                               |
| size             | 896532480                                                                                                                                       |
| status           | active                                                                                                                                          |
| tags             |                                                                                                                                                 |
| updated_at       | 2022-11-29T00:39:21Z                                                                                                                            |
| virtual_size     | None                                                                                                                                            |
| visibility       | public                                                                                                                                          |
+------------------+-------------------------------------------------------------------------------------------------------------------------------------------------+
```


openstack server create \
--flavor FiCo-v2m4-Q10 \
--image 321e5198-a54a-4b29-bafc-19b040ac1f82 \
--nic net-id=764abfc0-05ee-4a6e-8b2b-5e0b81af9bf2 \
--security-group 5834f3df-02de-4152-8076-d58c715b6931 \
--key-name deneil_keypair \
--user-data password-cloud-init \
deneil_rocky_instance-2 


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

root/qhgQLVsfZd9r 
cloud-user/foxconn




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


```bash

[root@dct-queens-ctl-001 deneil-dev]# ls
deneil.openrc.sh  Rocky-9-GenericCloud.latest.x86_64.qcow2
You have mail in /var/spool/mail/root
[root@dct-queens-ctl-001 deneil-dev]# openstack image create \
> --public \
> --disk-format qcow2 \
> --container-format bare \
> --file Rocky-9-GenericCloud.latest.x86_64.qcow2 \
> --min-disk 20 \
> --min-ram 2048 \
Rocky-9-GenericCloud.latest.x86_64> --property title="Rocky linux 9" \
> --property type="linux" \
> Rocky-9-GenericCloud.latest.x86_64
+------------------+-----------------------------------------------------------------------------------------------------------------------------------------------+
| Field            | Value                                                                                                                                         |
+------------------+-----------------------------------------------------------------------------------------------------------------------------------------------+
| checksum         | 42fac9853ff028588fd5151f794309fe                                                                                                              |
| container_format | bare                                                                                                                                          |
| created_at       | 2022-11-28T05:43:46Z                                                                                                                          |
| disk_format      | qcow2                                                                                                                                         |
| file             | /v2/images/523df8d6-b566-47fe-9468-836acd386898/file                                                                                          |
| id               | 523df8d6-b566-47fe-9468-836acd386898                                                                                                          |
| min_disk         | 20                                                                                                                                            |
| min_ram          | 2048                                                                                                                                          |
| name             | Rocky-9-GenericCloud.latest.x86_64                                                                                                            |
| owner            | cfdc857f42274e2ea6b30dd844e23ca5                                                                                                              |
| properties       | direct_url='rbd://d68ac620-6261-49bf-bbad-ef792ccb5270/images/523df8d6-b566-47fe-9468-836acd386898/snap', title='Rocky linux 9', type='linux' |
| protected        | False                                                                                                                                         |
| schema           | /v2/schemas/image                                                                                                                             |
| size             | 880082944                                                                                                                                     |
| status           | active                                                                                                                                        |
| tags             |                                                                                                                                               |
| updated_at       | 2022-11-28T05:44:23Z                                                                                                                          |
| virtual_size     | None                                                                                                                                          |
| visibility       | public                                                                                                                                        |
+------------------+-----------------------------------------------------------------------------------------------------------------------------------------------+

```











openstack image create my-image \
--public \
--disk-format qcow2 --container-format bare \
--property kernel_id=$MY_VMLINUZ_UUID \
--property ramdisk_id=$MY_INITRD_UUID \
--file my-image.qcow2

cloud-init

```config
users:
  - default
  - name: foobar
    lock_passwd: false
    passwd: 78369906
sudo:
  - ALL=(ALL) ALL
```
```
system_info:
   default_user:
     name: Ubuntu
     plain_text_passwd: 'ubuntu'
     home: /home/ubuntu
     shell: /bin/bash
     lock_passwd: False
     gecos: Ubuntu
     groups: [adm, audio, cdrom, dialout, floppy, video, plugdev, dip, netdev]
```

```config
#cloud-config
password: foxconn
chpasswd: { expire: False }
ssh_pwauth: True
```
 >>> login : 
ssh rocky@192.168.66.6
password : foxconn 


## openstack server create 
```bash
flavor-name="3"
Image-Name-Or-Image-ID="fa7ee5f1-457e-42fb-a265-f832d668f1fc" 
Network-ID="fca993fc-fc6f-42b5-82a6-35220a3e6715" 
Security_Group_ID="012c63c0-e18e-4fe3-a8fd-7854a64af617" 
Keypair-Name=="deneil_key"
VM_Name="deneil_rocky_instance"


openstack server create \
--flavor ${flavor-name} \
--image ${Image-Name-Or-Image-ID} \
--nic net-id=${Network-ID} \
--security-group ${Security_Group_ID} \
–key-name ${Keypair-Name} \
${VM_Name}


openstack server create \
--flavor FiCo-v2m4-Q10 \
--image 523df8d6-b566-47fe-9468-836acd386898 \
--nic net-id=cb807b61-8351-41fa-a635-add24dc7612f \
--security-group 5834f3df-02de-4152-8076-d58c715b6931 \
--key-name deneil_keypair \
--user-data password-cloud-init \
deneil_rocky_instance-2 


```



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


+------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Field            | Value                                                                                                                                                                                                             |
+------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| checksum         | 7950681d6a9dd9fc50552b78384cfd4d                                                                                                                                                                                  |
| container_format | bare                                                                                                                                                                                                              |
| created_at       | 2022-12-01T00:44:01Z                                                                                                                                                                                              |
| disk_format      | qcow2                                                                                                                                                                                                             |
| file             | /v2/images/721eaa22-601c-4630-8fda-8794ea8a7f3f/file                                                                                                                                                              |
| id               | 721eaa22-601c-4630-8fda-8794ea8a7f3f                                                                                                                                                                              |
| min_disk         | 20                                                                                                                                                                                                                |
| min_ram          | 2048                                                                                                                                                                                                              |
| name             | FICO-Win2k16-SPLA                                                                                                                                                                                                 |
| owner            | b2afa04057b94e79a7526b834c65e903                                                                                                                                                                                  |
| properties       | direct_url='rbd://3a1273e1-0a68-405e-8145-74c5fb6657a6/images/721eaa22-601c-4630-8fda-8794ea8a7f3f/snap', os_type='windows', os_version='Win2k16-SPLA', release='true', title='FICO-Win2k16-SPLA', type='windows' |
| protected        | False                                                                                                                                                                                                             |
| schema           | /v2/schemas/image                                                                                                                                                                                                 |
| size             | 13472563200                                                                                                                                                                                                       |
| status           | active                                                                                                                                                                                                            |
| updated_at       | 2022-12-01T00:47:35Z                                                                                                                                                                                              |
| virtual_size     | None                                                                                                                                                                                                              |
| visibility       | public                                                                                                                                                                                                            |
+------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+



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
--file FICO-winserver-2019-standard-cloudinit-20201231-2.qcow2 \
--min-disk 20 \
--min-ram 2048 \
--property title="FICO-winserver-2019-standard" \
--property type="windows" \
--property os_version="FICO-winserver-2019-standard" \
--property os_type="windows" \
--property release="true" \
FICO-winserver-2019-standard-cloudinit




openstack image create \
--public \
--disk-format qcow2 \
--container-format bare \
--file winserver-2019-standard-cloudinit-20201231.qcow2 \
--min-disk 20 \
--min-ram 2048 \
--property title="FICO-winserver-2019-standard-test" \
--property type="windows" \
--property os_version="FICO-winserver-2019-standard" \
--property os_type="windows" \
--property release="true" \
FICO-winserver-2019-standard-cloudinit-test

winserver-2019-standard-cloudinit-20201231.qcow2.xz

