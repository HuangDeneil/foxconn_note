from keystoneclient.auth import identity
from keystoneauth1 import session
from barbicanclient import client
from Crypto.PublicKey import RSA

import sys

if len(sys.argv) >= 3:
    url = sys.argv[1]
    type= sys.argv[2]
    present= sys.argv[3]
    key_name = "mykey"
    if present == "file":
        if len(sys.argv) == 4:
            key_name = sys.argv[4]
            
else:
    print("Missing some arguement")
    quit()


def order_url_to_key(order_url, private_or_public_key_output, type_out, name):
    if private_or_public_key_output == "private" or private_or_public_key_output == "public":
        pass
    else:
        print('input error')
        return 500
    
    # We'll use Keystone API v3 for authentication
    auth = identity.v3.Password(auth_url='http://192.168.77.15:5000/v3',
                                username='admin',
                                user_domain_name='Default',
                                password='admin_foxconn',
                                project_name='admin',
                                project_domain_name='Default')

    # Next we'll create a Keystone session using the auth plugin we just created
    sess = session.Session(auth=auth)

    # Now we use the session to create a Barbican client
    barbican = client.Client(session=sess)

    # get order_obj
    retrieved_order = barbican.orders.get(order_url)
    
    # get container_ref
    container_url = retrieved_order._container_ref

    # get container_obj
    container_obj = barbican.containers.get(container_url)

    private_key_obj = container_obj.private_key
    public_key_obj = container_obj.public_key

    private_key = private_key_obj.payload
    public_key = public_key_obj.payload

    keyPub = RSA.importKey(public_key) # import the public key
    keyPriv = RSA.importKey(private_key) # import the private key
    
    if private_or_public_key_output == "public":
        if type_out == "show":
            print(keyPub.export_key('OpenSSH').decode('utf-8'))
        elif type_out == "file":
            f = open(f'{name}.pub','wb')
            f.write(keyPub.export_key('OpenSSH'))
            f.close()
    elif private_or_public_key_output == "private":
        if type_out == "show":
            print(keyPriv.export_key('PEM').decode('utf-8'))
        elif type_out == "file":
            f = open(f'{name}.pem','wb')
            f.write(keyPriv.export_key('PEM'))
            f.close()

if __name__ == '__main__':
    if len(sys.argv) == 4:
        order_url_to_key(url, type, present, key_name)
    else:
        order_url_to_key(url, type, present)
