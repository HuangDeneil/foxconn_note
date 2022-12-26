

```bash
# installation (ubuntu)
sudo apt install python3-flask

```

## on rocky linux 9
### ref : https://computingforgeeks.com/install-flask-gunicorn-on-rocky-almalinux/
```bash
# rocky linux
sudo dnf -y install epel-release

# install pip python3 gcc
sudo dnf install python3-pip python3-devel gcc -y

## nginx
sudo dnf install nginx -y
sudo pip3 install virtualenv

## 
pip3 install gunicorn flask
```



## 將flask 設定成固定port 且 on line服務


## 在 `/` 下建立專案資料夾
```bash
# create app folder & app
/hello_flask
├── hello.py
└── wsgi.py
```

---

## hello.py
```python
from flask import Flask
application = Flask(__name__)

@application.route("/")
def hello():
    return "<h1 style='color:green'>Hello World, Flask is amazing!</h1>"

if __name__ == "__main__":
    application.run(host='0.0.0.0', port=80)
```

---

## wsgi.py
```python
from hello import application

if __name__ == "__main__":
    application.run()
```

---

## 防火牆開port
```bash
sudo firewall-cmd --add-port=8080/tcp --permanent
sudo firewall-cmd --reload
```

---

## 啟動服務
```bash
cd /myproject
gunicorn --bind 0.0.0.0:8080 wsgi
```
---


# 將flask 設定成固定port 且 on line服務

## 建立一個myapp.service
```bash
sudo vim /etc/systemd/system/myapp.service
```

```conf
[Unit]
Description=The Gunicorn instance to serve Flask Project
After=network.target

[Service]
WorkingDirectory=/myproject
Environment="PATH=/myproject/projectenv/bin"
ExecStart=/myproject/projectenv/bin/gunicorn --workers 3 --bind unix:myproject.sock -m 007 wsgi

[Install]
WantedBy=multi-user.target
```

```bash
chown -R -t bin_t /myproject/projectenv/bin/

# Reload the system daemon
sudo systemctl daemon-reload

# start automatically on boot
sudo systemctl start myapp
sudo systemctl enable myapp


```

---

## Configure the Nginx Proxy
```bash
sudo vim /etc/nginx/conf.d/myapp.conf
```

```bash
server {
    listen 80;
    server_name myapp.example.com;

    location / {
        proxy_set_header Host $http_host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
        proxy_pass http://unix:/myproject/myproject.sock;
    }
}
```




```bash
sudo chown -R nginx /myproject/
```


