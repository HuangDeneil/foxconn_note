from keystoneclient.auth import identity
from keystoneauth1 import session
from barbicanclient import client
import re
import subprocess

## 轉換public key格式 & 輸出檔案
from Crypto.PublicKey import RSA

def get_key_from_secret(uuid):
    ## login openstack keystone
    auth = identity.v3.Password(
        auth_url='http://192.168.77.15:5000/v3',
        username='admin',
        user_domain_name='Default',
        password='admin_foxconn',
        project_name='admin',
        project_domain_name='Default')
    
    ## keystone & barbican session
    sess = session.Session(auth=auth)
    barbican = client.Client(session=sess)

    secret_url = "http://192.168.77.15:9311/v1/secrets/35e69867-4ab7-4958-96fa-badd6617dcec"
    
    # get secret object
    secret_obj = barbican.secrets.get(secret_url)

    # get key pair
    secret = secret_obj.payload

    uuid = re.match(r'http://192.168.77.15:9311/v1/secrets/(.*)', secret_url, re.I).group(1)

    output_key_list={}
    output_key_list={
        "uuid" : uuid,
        "order_url" : "",
        "container_url" : "",
        "secret_url" : ["","",secret_url],
        "public_key" : "",
        "private_key" : "", 
        "secret" : secret
    }
    return output_key_list
    



def get_key_from_order(uuid):
    ## login openstack keystone
    auth = identity.v3.Password(
        auth_url='http://192.168.77.15:5000/v3',
        username='admin',
        user_domain_name='Default',
        password='admin_foxconn',
        project_name='admin',
        project_domain_name='Default')
    
    ## keystone & barbican session
    sess = session.Session(auth=auth)
    barbican = client.Client(session=sess)

    order_url = f"http://192.168.77.15:9311/v1/orders/{uuid}"
    
    # get order object from barbican
    retrieved_order = barbican.orders.get(order_url)
    
    # get container url
    container_url = retrieved_order._container_ref

    # get container object
    container_obj = barbican.containers.get(container_url)

    # get secret object
    private_key_obj = container_obj.private_key
    public_key_obj = container_obj.public_key

    # get key pair
    private_key = private_key_obj.payload.decode('utf-8')
    public_key  = public_key_obj.payload
    
    # change public key format
    keyPub = RSA.importKey(public_key)
    public_key = keyPub.export_key('OpenSSH').decode('utf-8')

    public_key_url  = public_key_obj._secret_ref
    private_key_url = private_key_obj._secret_ref

    output_key_list={}
    output_key_list={
        "uuid" : uuid,
        "order_url" : order_url,
        "container_url" : container_url,
        "secret_url" : [public_key_url,private_key_url,""],
        "public_key" : public_key,
        "private_key" : private_key, 
        "secret" : ""
    }
    return output_key_list
    

def create_new_keypair(key_name):
    ## login openstack keystone
    auth = identity.v3.Password(
        auth_url='http://192.168.77.15:5000/v3',
        username='admin',
        user_domain_name='Default',
        password='admin_foxconn',
        project_name='admin',
        project_domain_name='Default')

    ## keystone & barbican session
    sess = session.Session(auth=auth)
    barbican = client.Client(session=sess)

    # Create a public & private keypair by secret order
    secret = barbican.orders.create_asymmetric(
        name = key_name, 
        algorithm='rsa', 
        bit_length=2048, 
        pass_phrase=None, 
        payload_content_type='application/octet-stream', 
        expiration=None)

    # summit to barbican & return order url
    order_url = secret.submit()
    
    # get order object
    retrieved_order = barbican.orders.get(order_url)

    # get container url
    container_url = retrieved_order._container_ref

    # get container object
    container_obj = barbican.containers.get(container_url)

    # get secret object
    private_key_obj = container_obj.private_key
    public_key_obj = container_obj.public_key
    
    # get key pair
    private_key = private_key_obj.payload.decode('utf-8')
    public_key  = public_key_obj.payload
    
    # change public key format
    keyPub = RSA.importKey(public_key)
    public_key = keyPub.export_key('OpenSSH').decode('utf-8')
    

    uuid = re.match(r'http://192.168.77.15:9311/v1/orders/(.*)', order_url, re.I).group(1)
    
    public_key_url  = public_key_obj._secret_ref
    private_key_url = private_key_obj._secret_ref
    
    output_key_list={}
    output_key_list={
        "uuid" : uuid,
        "order_url" : order_url,
        "container_url" : container_url,
        "secret_url" : [public_key_url,private_key_url,""],
        "public_key" : public_key,
        "private_key" : private_key, 
        "secret" : ""
    }
    return output_key_list

