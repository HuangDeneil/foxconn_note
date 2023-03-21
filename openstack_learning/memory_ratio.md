
openstack flavor create \
--vcpus 64 \
--ram 314556 \
--disk 40 \
deneil-test-flavor


openstack flavor create \
--vcpus 64 \
--ram 393216 \
--disk 40 \
deneil-test-flavor2


openstack flavor create \
--vcpus 64 \
--ram 376119 \
--disk 40 \
deneil-test-flavor3


openstack flavor create \
--vcpus 64 \
--ram 413700 \
--disk 40 \
deneil-test-flavor4



openstack flavor list | grep deneil
openstack flavor delete 


## 實測 壓力測試 
https://www.twblogs.net/a/5ee35437cd139eebd77eb2b6
```bash


scp * centos@limite-test-1:~/
scp * centos@limite-test-2:~/
scp * centos@limite-test-3:~/
scp * centos@limite-test-4:~/
scp * centos@limite-test-5:~/


install_cmd="tar xvf ~/gcc.tar; tar zxvf ~/memtester-4.2.2.tar.gz; cd ~/gcc; sudo yum localinstall -y *.rpm; cd ~/memtester-4.2.2; sudo make;sudo make install"

ssh centos@limite-test-1 $install_cmd
ssh centos@limite-test-2 $install_cmd
ssh centos@limite-test-3 $install_cmd
ssh centos@limite-test-4 $install_cmd
ssh centos@limite-test-5 $install_cmd


# 安裝 gcc 套件
tar xvf gcc.tar
cd gcc
sudo yum localinstall -y *.rpm

# 安裝 memtester
tar zxvf memtester-4.2.2.tar.gz
cd memtester-4.2.2
make
make install



free -h

###############################
###
###  Start stress test
###
mem_stress_cmd="sudo nohup /usr/local/bin/memtester 364G &"

server_list="limite-test-1 limite-test-2 limite-test-3 limite-test-4"
for i in $server_list
do
ssh centos@$i sudo $mem_stress_cmd &
done


# ram_allocation_ratio = 0.92
mem_stress_cmd="sudo nohup /usr/local/bin/memtester 291G &"

# ram_allocation_ratio = 0.95
mem_stress_cmd="sudo nohup /usr/local/bin/memtester 349G &"
ssh centos@limite-test-5 $mem_stress_cmd &

sudo nohup /usr/local/bin/memtester 364G &

#  ram_allocation_ratio = 0.92
sudo nohup /usr/local/bin/memtester 291G &
# ram_allocation_ratio = 0.95
sudo nohup /usr/local/bin/memtester 348G &

# ram_allocation_ratio = 1 & reserved_host_memory_mb = 65536
sudo nohup /usr/local/bin/memtester 383G &



###############################
###
###  Check stress test pid
###
ps -ef | grep "nohup /usr/local/bin/memtester" | grep -v "grep"
ps -ef | grep "/usr/local/bin/memtester" | grep -v "grep"
ps -ef | grep "memtester" | grep -v "grep"




# sudo kill -9 `ps -ef | grep "nohup /usr/local/bin/memtester" | grep -v "grep" | awk '{print $2}'`
# sudo kill -9 `ps -ef | grep "/usr/local/bin/memtester" | grep -v "grep" | awk '{print $2}'`

###############################
###
###  Stop stress test
###


server_list="limite-test-1 limite-test-2 limite-test-3 limite-test-4 limite-test-5"

ssh centos@limite-test-1
ssh centos@limite-test-2
ssh centos@limite-test-3
ssh centos@limite-test-4
ssh centos@limite-test-5


for i in `ps -ef | grep "memtester" | grep -v "grep" | awk '{print $2}'` ; do sudo kill -9 $i ; done





systemctl status openstack-nova-compute.service
systemctl restart openstack-nova-compute.service





ssh centos@limite-test-1 sudo reboot
ssh centos@limite-test-2 sudo reboot
ssh centos@limite-test-3 sudo reboot
ssh centos@limite-test-4 sudo reboot
ssh centos@limite-test-5 sudo reboot

ssh centos@limite-test-1 sudo shutdown -P now
ssh centos@limite-test-2 sudo shutdown -P now
ssh centos@limite-test-3 sudo shutdown -P now
ssh centos@limite-test-4 sudo shutdown -P now
ssh centos@limite-test-5 sudo shutdown -P now
```


## CLI 監控
```bash
## CMD
watch bash check_server_free.sh
```
## check_server_free.sh
```bash

server_list="limite-test-1 limite-test-2 limite-test-3 limite-test-4 limite-test-5"
check_cmd="free"

for i in $server_list
do
echo $i
ssh centos@$i sudo $check_cmd
done
ssh centos@limite-test-5 sudo $check_cmd

```












