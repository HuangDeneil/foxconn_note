

```bash
# installation (ubuntu)
sudo apt install python3-flask

# rocky linux
sudo dnf -y install epel-release

# install pip
sudo dnf install python3-pip python3-devel gcc -y


sudo dnf install nginx -y
sudo pip3 install virtualenv
pip3 install gunicorn flask

```
```bash
# create app folder & app
hello_flask
└── hello.py
```
```python
from flask import Flask

app = Flask(__name__)

@app.route("/")
def hello_world():
    return "<p>Hello, World!</p>"


```

```bash
export FLASK_APP=hello
flask run
```
