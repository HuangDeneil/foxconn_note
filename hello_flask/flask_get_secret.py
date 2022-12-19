from flask import Flask

app = Flask(__name__)

@app.route("/")
def hello_world():
    return "<p>Hello, World!</p>"


@app.route('/user/<username>')
def username(username):
    return 'i am ' + username

@app.route('/private_url/<order_url>')
def username(private_url):
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
    
    
    return private_key



if __name__ == '__main__':
    app.debug = True
    app.run()





#http://localhost:9311/v1/orders/f8abb473-6cf4-4afd-a3a8-486a53da28b7