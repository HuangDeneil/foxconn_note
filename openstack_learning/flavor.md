
## test QoS & network speed relationship

```bash

VCPU=${VCPU:-'4'}
RAM=${RAM:-'8192'}
FLAVOR_QOS_LV=${FLAVOR_QOS_LV:-'40'}
SERVER_FLAVOR="deneil-test-v${VCPU}m${RAM}-Q${FLAVOR_QOS_LV}"


openstack flavor create ${SERVER_FLAVOR} \
--ram ${RAM} \
--vcpus ${VCPU} \
--property quota:vif_inbound_peak=`expr $FLAVOR_QOS_LV \* 15000` \
--property quota:vif_inbound_average=`expr $FLAVOR_QOS_LV \* 10000` \
--property quota:vif_outbound_peak=`expr $FLAVOR_QOS_LV \* 15000` \
--property quota:vif_outbound_average=`expr $FLAVOR_QOS_LV \* 10000` \
--disk 0 --private

## deneil-test-v4m8192-Q40
## a6b4bf4a-86de-4af9-87f1-d3e8126a9327
## properties | quota:vif_inbound_average='400000', quota:vif_inbound_peak='600000', quota:vif_outbound_average='400000', quota:vif_outbound_peak='600000'



FiCo-v2m4-Q10

capabilities:cpu_info:vendor='Intel'
fico='true'
quota:vif_inbound_average='100000'
quota:vif_inbound_peak='150000'
quota:vif_outbound_average='100000'
quota:vif_outbound_peak='150000'
series='S1'
vendor='Intel' 



```



```bash

# VM : deneiltest-horizon-2
# uuid 60d193c5-9bf1-472d-a023-a66411908650
# flavor : FiCo-v4m8-Q1
# volume type : Standard-SSD


# FiCo-v4m8-Q1, Standard-SSD 速度最高只有 10MB/s
[root@deneiltest-horizon-2 ~]# scp 192.168.60.22:~/Queens-Patch-2023-November-1/cis-update-patch-v4.10.1.0/FiXo_v4.10.1.0.tar.* ./
FiXo_v4.10.1.0.tar.tgz_aa              9%  291MB   9.1MB/s   05:03 ETA

## MJC-IAASPLUS-REGISTRY-v4m8-Q10

openstack server resize --flavor MJC-IAASPLUS-REGISTRY-v4m8-Q10 60d193c5-9bf1-472d-a023-a66411908650
openstack server resize --confirm 60d193c5-9bf1-472d-a023-a66411908650


## v4m8-Q10, Standard-SSD 速度拉到 ~90MB/s
[root@deneiltest-horizon-2 centos]# scp 192.168.60.22:~/Queens-Patch-2023-November-1/cis-update-patch-v4.10.1.0/FiXo_v4.10.1.0.tar.* ./
FiXo_v4.10.1.0.tar.tgz_aa              100% 3057MB  89.8MB/s   00:34    
FiXo_v4.10.1.0.tar.tgz_ab              100% 3057MB  90.1MB/s   00:33    
FiXo_v4.10.1.0.tar.tgz_ac              100% 3057MB  90.1MB/s   00:33    
FiXo_v4.10.1.0.tar.tgz_ad              100% 3057MB  89.8MB/s   00:34    
FiXo_v4.10.1.0.tar.tgz_File_lists.txt  100%  131   111.5KB/s   00:00    
FiXo_v4.10.1.0.tar.tgz.md5             100%   57    76.5KB/s   00:00    


## deneil-test-v4m8192-Q40

openstack server resize --flavor a6b4bf4a-86de-4af9-87f1-d3e8126a9327 60d193c5-9bf1-472d-a023-a66411908650
openstack server resize --confirm 60d193c5-9bf1-472d-a023-a66411908650

openstack server show 60d193c5-9bf1-472d-a023-a66411908650

## deneil-test-v4m8192-Q40, Standard-SSD
[root@deneiltest-horizon-2 centos]# scp 192.168.60.22:~/Queens-Patch-2023-November-1/cis-update-patch-v4.10.1.0/FiXo_v4.10.1.0.tar.* ./
FiXo_v4.10.1.0.tar.tgz_aa                                                     100% 3057MB 159.6MB/s   00:19    
FiXo_v4.10.1.0.tar.tgz_ab              100% 3057MB 151.3MB/s   00:20    2
FiXo_v4.10.1.0.tar.tgz_ac              100% 3057MB 145.3MB/s   00:21    
FiXo_v4.10.1.0.tar.tgz_ad              100% 3057MB 117.5MB/s   00:26    
FiXo_v4.10.1.0.tar.tgz_File_lists.txt  100%  131    61.2KB/s   00:00    
FiXo_v4.10.1.0.tar.tgz.md5             100%   57    22.5KB/s   00:00    



## mount Ultra-Perf-SSD 測試傳輸速度: 似乎沒有更多變化
scp 192.168.60.22:~/Queens-Patch-2023-November-1/cis-update-patch-v4.10.1.0/FiXo_v4.10.1.0.tar.* /mnt/vdb
[root@deneiltest-horizon-2 vdb]# scp 192.168.60.22:~/Queens-Patch-2023-November-1/cis-update-patch-v4.10.1.0/FiXo_v4.10.1.0.tar.* /mnt/vdb
FiXo_v4.10.1.0.tar.tgz_aa              100% 3057MB 153.3MB/s   00:19    
FiXo_v4.10.1.0.tar.tgz_ab              100% 3057MB 144.4MB/s   00:21    
FiXo_v4.10.1.0.tar.tgz_ac              100% 3057MB 167.4MB/s   00:18    
FiXo_v4.10.1.0.tar.tgz_ad              100% 3057MB 157.4MB/s   00:19    
FiXo_v4.10.1.0.tar.tgz_File_lists.txt  100%  131   216.4KB/s   00:00    
FiXo_v4.10.1.0.tar.tgz.md5             100%   57    90.4KB/s   00:00    
[root@deneiltest-horizon-2 vdb]# 







# 192.168.60.231
## boot volume : deneil-test-Ultra-Perf-SSD-bootable
## volume type : Ultra-Perf-SSD

nova boot \
  --flavor a6b4bf4a-86de-4af9-87f1-d3e8126a9327 \
  --security-groups controller_SG \
  --nic port-id=5b34cc15-c35c-4634-829c-8ba49d686dd0 \
  --boot-volume 06f30f95-d9c7-4223-bc01-4e0efd1b81bb \
  --user-data /root/deneil-dev/password-cloud-init \
  --poll deneil-test-Ultra-Perf-SSD




## 檢查volume type
# openstack volume qos list
# openstack volume type list

# Create volume
## FICO-Centos-7.9
openstack volume create \
--image ef734296-e550-4198-9c66-84ad2be5fce4 \
--size 50 \
--type Un-limited-SSD \
--bootable \
deneil-test-limited-volume-bootable


[root@deneil-test-ultra-perf-ssd ~]# scp 192.168.60.22:~/Queens-Patch-2023-November-1/cis-update-patch-v4.10.1.0/FiXo_v4.10.1.0.tar.* ./
FiXo_v4.10.1.0.tar.tgz_aa                100% 3057MB 155.5MB/s   00:19    
FiXo_v4.10.1.0.tar.tgz_ab                100% 3057MB 151.2MB/s   00:20    
FiXo_v4.10.1.0.tar.tgz_ac                100% 3057MB 151.3MB/s   00:20    
FiXo_v4.10.1.0.tar.tgz_ad                100% 3057MB 156.6MB/s   00:19    
FiXo_v4.10.1.0.tar.tgz_File_lists.txt    100%  131   200.6KB/s   00:00    
FiXo_v4.10.1.0.tar.tgz.md5               100%   57   106.9KB/s   00:00  






# Unlimited-Test
## c3f61b92-19dd-44de-89e9-773003525846
## boot volume : deneil-test-limited-volume-bootable
## volume type : Un-limited-SSD

nova boot \
  --flavor a6b4bf4a-86de-4af9-87f1-d3e8126a9327 \
  --security-groups controller_SG \
  --nic port-id=5749c52c-fd4b-4ce2-8a7a-70f2725faf74 \
  --boot-volume c3f61b92-19dd-44de-89e9-773003525846 \
  --user-data /root/deneil-dev/password-cloud-init \
  --poll deneil-test-Un-limited-SSD



## flavor : v4m8-Q10
## volume type : Un-limited-SSD
[root@deneil-test-un-limited-ssd ~]# scp 192.168.60.22:~/Queens-Patch-2023-November-1/cis-update-patch-v4.10.1.0/FiXo_v4.10.1.0.tar.* ./
FiXo_v4.10.1.0.tar.tgz_aa                100% 3057MB 174.1MB/s   00:17    
FiXo_v4.10.1.0.tar.tgz_ab                100% 3057MB 171.4MB/s   00:17    
FiXo_v4.10.1.0.tar.tgz_ac                100% 3057MB 180.3MB/s   00:16    
FiXo_v4.10.1.0.tar.tgz_ad                100% 3057MB 168.1MB/s   00:18    
FiXo_v4.10.1.0.tar.tgz_File_lists.txt    100%  131   223.8KB/s   00:00    
FiXo_v4.10.1.0.tar.tgz.md5               100%   57    83.8KB/s   00:00 




cis_update_file_tmp

container_name="cis_update_file_tmp"
swift_url=`openstack endpoint list --interface public --service swift  -f value -c URL`

swift_url="http://fibo-dct-tb.fixo.cloud/swift/v1"

file_list=`curl $swift_url/$container_name/`
url="$swift_url/$container_name"


file_list="FiXo_v4.10.1.0.tar.tgz.md5
FiXo_v4.10.1.0.tar.tgz_File_lists.txt
FiXo_v4.10.1.0.tar.tgz_aa
FiXo_v4.10.1.0.tar.tgz_ab
FiXo_v4.10.1.0.tar.tgz_ac
FiXo_v4.10.1.0.tar.tgz_ad"

for file in $file_list
do
    echo "$file"
    curl -O $url/$file
done

# openstack object create $container_name $file

```




```bash
# Attach volume
## deneil-test-Un-limited-SSD

fdisk -l
mkfs.ext4 /dev/vdb
mkdir /mnt/vdb -p
mount /dev/vdb /mnt/vdb/


[root@deneil-test-ultra-perf-ssd vdb]# scp 192.168.60.22:~/Queens-Patch-2023-November-1/cis-update-patch-v4.10.1.0/FiXo_v4.10.1.0.tar.* /mnt/vdb
FiXo_v4.10.1.0.tar.tgz_aa                100% 3057MB 147.4MB/s   00:20    
FiXo_v4.10.1.0.tar.tgz_ab                100% 3057MB 145.5MB/s   00:21    
FiXo_v4.10.1.0.tar.tgz_ac                100% 3057MB 141.4MB/s   00:21    
FiXo_v4.10.1.0.tar.tgz_ad                100% 3057MB 143.7MB/s   00:21    
FiXo_v4.10.1.0.tar.tgz_File_lists.txt    100%  131   183.5KB/s   00:00    
FiXo_v4.10.1.0.tar.tgz.md5               100%   57    79.4KB/s   00:00   

```










