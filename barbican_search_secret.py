from keystoneclient.auth import identity
from keystoneauth1 import session
from barbicanclient import client

import sys

url = sys.argv[1]
type= sys.argv[2]

def order_url_to_key(order_url, private_or_public_key_output):
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

    # summit to barbican & return order url
    # order_url = "http://localhost:9311/v1/orders/f8abb473-6cf4-4afd-a3a8-486a53da28b7"
    # order_url = "http://192.168.77.15:9311/v1/orders/f8abb473-6cf4-4afd-a3a8-486a53da28b7"
    # order_url = "http://192.168.77.15:9311/v1/orders/630a0462-998f-4f32-b9c9-f8c7eeebb4fe"

    # get order_obj
    retrieved_order = barbican.orders.get(order_url)
    
    try:
        retrieved_order = barbican.orders.get(order_url)
    except ValueError:
        raise BaseException("501")
    
    # get container_ref
    container_url = retrieved_order._container_ref

    # get container_obj
    container_obj = barbican.containers.get(container_url)

    private_key_obj = container_obj.private_key
    public_key_obj = container_obj.public_key

    private_key = private_key_obj.payload
    public_key = public_key_obj.payload

    # plain text of key
    # print(private_key)
    # print(public_key)
    if private_or_public_key_output == "private":
        print(private_key)
    elif private_or_public_key_output == "public":
        print(public_key)

if __name__ == '__main__':
    order_url_to_key(url, type)
