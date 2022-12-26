from flask import Flask
from keystoneclient.auth import identity
from keystoneauth1 import session   
from barbicanclient import client
from ssh_test import barbican_key_management as key_work
import json
from flask import render_template

application = Flask(__name__)

@application.route("/")
def hello_world():
    return render_template('test.html')
    # return "<p>Flask is live</p>"

@application.route('/order_uuid/get_key')
def get_keypair():
    
    ## input secret order uuid
    uuid = "a906eda8-9f8d-4b4f-9592-4ee1fa3a1fb0"
    output_key_list = key_work.get_key_from_order(uuid)

    output_html=f"""
    <p>{output_key_list}</p>
    """
    return render_template('table_view.html', data = output_key_list)
    # return output_html
    
@application.route('/secret_uuid/get_key')
def get_secret():
    
    ## input secret order uuid
    uuid = "35e69867-4ab7-4958-96fa-badd6617dcec"
    output_key_list = key_work.get_key_from_secret(uuid)

    output_html=f"""
    <p>{output_key_list}</p>
    """
    return render_template('table_view.html', data = output_key_list)
    # return output_html


if __name__ == "__main__":
    application.debug = True
    application.run(host='0.0.0.0', port=8080)




#http://localhost:9311/v1/orders/f8abb473-6cf4-4afd-a3a8-486a53da28b7