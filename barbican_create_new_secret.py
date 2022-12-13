from keystoneclient.auth import identity
from keystoneauth1 import session
from barbicanclient import client

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

# Let's create a Secret to store some sensitive data
secret = barbican.orders.create_asymmetric(
    name='pyclient-secret-asy-1024-2', 
    algorithm='rsa', 
    bit_length=1024, 
    pass_phrase=None, 
    payload_content_type=None, 
    expiration=None)

# summit to barbican & return order url
order_url = secret.submit()
order_url ="http://192.168.77.15:9311/v1/orders/a150e411-e612-4756-9c55-a49c1a5c2b35"

# get order_obj
retrieved_order = barbican.orders.get(order_url)

## check all inside object
# object.__dict__

# get container_ref
container_url = retrieved_order._container_ref

# get container_obj
container_obj = barbican.containers.get(container_url)

private_key_obj = container_obj.private_key
public_key_obj = container_obj.public_key

private_key = private_key_obj.payload
public_key = public_key_obj.payload

# plain text of key
print(private_key)
print(public_key)

