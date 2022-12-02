

```bash
#cloud-config
users:
  - default
  - name: centos
    plain_text_passwd: '78369906'
    home: /home/centos
    shell: /bin/bash
    lock_passwd: false
    gecos: centos
    groups: [sudo, lsa, centos]
    primary-group: centos
    sudo: ['ALL=(ALL) ALL:ALL']
ssh_pwauth: True

```

```bash
#cloud-config
users:
  - default
  - name: centos
    plain_text_passwd: '78369906'
```

``` bash
#cloud-config
password: 78369906
chpasswd: {expire: False}
ssh_pwauth: True
ssh_authorized_keys:
  - ssh-rsa ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCnC8OFxacJzsQOeTp+k97c0EUFx904OiTXGMy0CBJK/wCHeN0OomErgqbhFa0LzFpnevpoDrnbfLS5PfA/EMD71lScUU9e1KP15vlsfHqWzRoOoHV5El+VGU5tn0wRO9jYz6zR7/PrJ49wdXbadmB0Fv1T5pPmibHQALZDAFKxubrbrDdFwiPp+OwEoOtNMAckf6pXsqDK+D+Fn5g+ErWaxgX4KyJjYgMGeITnaM1zbqDeVeNZaWJjcDrOhzz0FjKyaI+aNLNSGz3epe9zYQnpmqFjQBCBdOzQt0ALutqM4SWQQiLX7UjPWCPqYmmX5NE+U73F0410GG7BY2nUHBw7koibtHN9rowb8un5QNsWShMGmTRVBn4W+5c4P0F6G10Dd8iZiLDhGxgD9IINyrsaJcIgFzdt73QDj1Qfp46N2USMx2BVHWmRusGUwQHGR1a0JA36CRqinKzZWYS52fNHQdXB4mvZprGLyjnBqXQbiFUM/JF41sUn1M5ufhUpZjk= hudeneil@DESKTOP-HAPBHJ8
```




```bash
#cloud-config
password: 78369906
chpasswd: {expire: False}
```


```bash
#cloud-config
users:
  - default
  - name: foobar
    gecos: User N. Ame
    selinux-user: staff_u
    groups: users,wheel
    ssh_pwauth: True
    ssh_authorized_keys:
      - ssh-rsa AA..vz user@domain.com
chpasswd:
  list: |
    root:password
    cloud-user:atomic
    foobar:foobar
  expire: False
```

```bash
#cloud-config
chpasswd:
  list: |
    root:stDM9906
    cloud-user:78369906
    centos:78369906
  expire: False
```


```bash
#cloud-config
users:
  - default
  - name: hudeneil
    gecos: User N. Ame
    selinux-user: staff_u
    groups: users,wheel
    ssh_pwauth: True
    ssh_authorized_keys:
      - ssh-rsa AA..vz user@domain.com
chpasswd:
  list: |
    root:password
    cloud-user:atomic
    hudeneil:78369906
  expire: False
```







