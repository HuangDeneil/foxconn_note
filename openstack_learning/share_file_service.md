
ssh -i ~/.ssh/keys/foxconn-openstack_key.pem root@10.67.46.22
ssh tj-testbed-network-001
ip netns exec qdhcp-c94ceb9a-c58e-4897-87ef-dac98e4993ca ssh centos@192.168.77.5
ip netns exec qdhcp-c94ceb9a-c58e-4897-87ef-dac98e4993ca ssh rocky@192.168.77.15


192.168.77.13:/shares/share-45eba983-183a-4eac-966c-6a3b18c995b4

mount -t nfs 10.10.0.2:/shared/nfs /mnt

## `NFS`
## 掛載網路共享空間至linux上
mount -t nfs 192.168.77.13:/shares/share-45eba983-183a-4eac-966c-6a3b18c995b4 /mnt

```bash
[root@deneil-test-volume-attach-1 mnt]# df -h
Filesystem                                                        Size  Used Avail Use% Mounted on
devtmpfs                                                          1.9G     0  1.9G   0% /dev
tmpfs                                                             1.9G     0  1.9G   0% /dev/shm
tmpfs                                                             1.9G   25M  1.9G   2% /run
tmpfs                                                             1.9G     0  1.9G   0% /sys/fs/cgroup
/dev/vda1                                                          40G  864M   40G   3% /
tmpfs                                                             379M     0  379M   0% /run/user/1000
192.168.77.13:/shares/share-45eba983-183a-4eac-966c-6a3b18c995b4   98G   60M   93G   1% /mnt
```

showmount -e IP_ADDR

umount -a

[root@deneil-test-volume-attach-1 /]# df -h
Filesystem                                                        Size  Used Avail Use% Mounted on
devtmpfs                                                          1.9G     0  1.9G   0% /dev
tmpfs                                                             1.9G   25M  1.9G   2% /run
tmpfs                                                             1.9G     0  1.9G   0% /sys/fs/cgroup
/dev/vda1                                                          40G  864M   40G   3% /
192.168.77.13:/shares/share-45eba983-183a-4eac-966c-6a3b18c995b4   98G   60M   93G   1% /mnt


umount -f /mnt

mount -t nfs 192.168.77.13:/shares/share-45eba983-183a-4eac-966c-6a3b18c995b4 /mnt/data1

mount -t nfs 192.168.77.13:/shares/share-45eba983-183a-4eac-966c-6a3b18c995b4 /share/data1/





## `CIFS`
```bash
### way 1
# centos
mount -t cifs \
//192.168.77.13/share-73ec5d2f-c222-4947-8d48-d1f88c809a2e \
/mnt/data-cifs

mount.cifs //192.168.77.13/share-73ec5d2f-c222-4947-8d48-d1f88c809a2e /mnt/data-cifs



# rocky
mount -t cifs //192.168.77.13/share-73ec5d2f-c222-4947-8d48-d1f88c809a2e /share/data-cifs

mount.cifs //192.168.77.13/share-73ec5d2f-c222-4947-8d48-d1f88c809a2e \
/share/data-cifs

umount /mnt/smb



### way 2
mount.cifs -o username="Username",password="Password" //IP/share /mnt/smb
umount.cifs /mnt/smb






```



