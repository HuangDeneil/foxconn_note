

```bash
# installation
sudo apt install python3-flask
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
