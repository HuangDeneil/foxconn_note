from keystoneclient.auth import identity
from keystoneauth1 import session
from barbicanclient import client
from Crypto.PublicKey import RSA

import sys
import paramiko
import io
import sys



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
        

def copy_file(private_key, user, ip, local_path, remote_path):
    private_key_str = io.StringIO()
    private_key_str.write(private_key)
    private_key_str.seek(0)

    key = paramiko.RSAKey.from_private_key(private_key_str)

    private_key_str.close()
    del private_key_str

    trans = paramiko.Transport(ip, 22)
    trans.start_client()
    trans.auth_publickey(user, key)

    del key

    print('Opening transport')
    conn = trans.open_session()

    print('Opening SFTP session')
    sftp = paramiko.SFTPClient.from_transport(trans)

    print('Copying local path {} to remote path {}'.format(local_path, remote_path))
    sftp.put(local_path, remote_path) 

    print('Closing SFTP session')
    sftp.close()

    print('Closing transport')
    trans.close()


if len(sys.argv) >= 3:
    url = sys.argv[1]
    user = sys.argv[2]
    ip = sys.argv[3]
    local_file_path = sys.argv[4]
    remote_file_path = sys.argv[5]

if __name__ == '__main__':
    get_private_key = order_url_to_key(url)
    copy_file(get_private_key, user, ip, local_file_path, local_file_path)
