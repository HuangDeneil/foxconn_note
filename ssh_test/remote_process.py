from keystoneclient.auth import identity
from keystoneauth1 import session
from barbicanclient import client
from Crypto.PublicKey import RSA

import sys
import paramiko
import io

## 從barbican 拿key
def order_url_to_key(order_url):
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

    # public_key_obj = container_obj.public_key
    private_key_obj = container_obj.private_key

    # _public_key = public_key_obj.payload
    _private_key = private_key_obj.payload

    # keyPub = RSA.importKey(_public_key) # import the public key
    keyPriv = RSA.importKey(_private_key) # import the private key
    
    return keyPriv.export_key('PEM').decode('utf-8')
        

## 將barbican 取得的private key登入遠端VM，執行shell script
def remote_action(private_key, user, ip, command):
    private_key_str = io.StringIO()
    private_key_str.write(private_key)
    private_key_str.seek(0)

    key = paramiko.RSAKey.from_private_key(private_key_str)

    private_key_str.close()
    del private_key_str
    
    # 建立連線 
    ssh = paramiko.SSHClient()
    
    ## add to known_hosts
    ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
    
    ssh.connect(hostname=ip,
        port=22,
        username=user,
        pkey=key)
    
    # 在遠端執行shell script
    stdin, stdout, stderr = ssh.exec_command(command)
    
    print(stdout.read().decode())
    
    # 關閉連接
    ssh.close()
    del key

if len(sys.argv) >= 3:
    url = sys.argv[1]
    user = sys.argv[2]
    ip = sys.argv[3]
    command = f"""
    hostname=`cat /etc/hostname`
    echo -e "Now is {user}@{ip} ($hostname)\n\n.ssh/authorized_keys file:"
    head ~/.ssh/authorized_keys
    """

if __name__ == '__main__':
    #從barbican 拿private key
    get_private_key = order_url_to_key(url)
    
    # 將barbican 取得的private key登入遠端VM，執行shell script
    remote_action(get_private_key, user, ip, command)


