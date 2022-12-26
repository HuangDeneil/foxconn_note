### ref: https://blog.csdn.net/u011028408/article/details/82932525

# 雙網卡狀況，改routing ip位置可以設定成同時通內/外網
## 一張對內
## 一張對外

### 情境
一台VM 接上兩張網卡 想要同時可以通內外網路
- eth0 192.168.200.0/24 >>>  可以對內
- eth1 192.168.77.0/24  >>>  可以對外

```bash
[rocky@deneil-control-node ~]$ route -n
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
0.0.0.0         192.168.77.1    0.0.0.0         UG    100    0        0 eth0
0.0.0.0         192.168.200.1   0.0.0.0         UG    101    0        0 eth1
169.254.169.254 192.168.77.1    255.255.255.255 UGH   100    0        0 eth0
169.254.169.254 192.168.200.1   255.255.255.255 UGH   101    0        0 eth1
192.168.77.0    0.0.0.0         255.255.255.0   U     100    0        0 eth0
192.168.200.0   0.0.0.0         255.255.255.0   U     101    0        0 eth1
```

# 因為 linux環境中只能有一個 default gateway，所以我們可以先用下列指令新增default gateway.

## 去除default gateway
```bash
# 選定外網為default gateway
sudo route add default gw 192.168.77.1


# 先砍掉內網
sudo route delete default gw 192.168.200.1
```
# 但是這樣做只是將大家的default gateway換掉，並沒有做到分開。


## 為了要將內網/外網分開，所以我們要加一條指令，設定封包流動的方法
```bash
sudo route add -net 10.0.0.0 netmask 255.0.0.0 gw 192.168.200.1
```

## 最後網路routing table :
```bash
[rocky@deneil-control-node ~]$ route -n
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
0.0.0.0         192.168.77.1    0.0.0.0         UG    100    0        0 eth0
10.0.0.0        192.168.200.1   255.0.0.0       UG    0      0        0 eth1
169.254.169.254 192.168.77.1    255.255.255.255 UGH   100    0        0 eth0
169.254.169.254 192.168.200.1   255.255.255.255 UGH   101    0        0 eth1
192.168.77.0    0.0.0.0         255.255.255.0   U     100    0        0 eth0
192.168.200.0   0.0.0.0         255.255.255.0   U     101    0        0 eth1
```


## 
```bash
# 加入內網floating ip 後確定也可以從內網ip ssh 進去
 openstack floating ip set --port 6ae64caf-050f-4397-a4a9-f482c03a5378 6ea8ec61-a3c8-4a0c-98c5-01b406032eee
```

