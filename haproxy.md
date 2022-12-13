

# Rocky linux 9
------

# install haproxy
```bash
dnf install haproxy -y
```

## start haproxy service
```bash
systemctl start haproxy
systemctl enable haproxy
```

## edit conf
```bash
nano /etc/haproxy/haproxy.cfg
```

