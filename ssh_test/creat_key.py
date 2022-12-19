from keystoneclient.auth import identity
from keystoneauth1 import session
from barbicanclient import client

## 轉換public key格式 & 輸出檔案
from Crypto.PublicKey import RSA
# from Crypto.Cipher import PKCS1_v1_5 as Cipher_PKCS1_v1_5


import sys

if len(sys.argv) >=1:
    key_name = sys.argv[1]


def create_key(file_name):
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
        name = file_name, 
        algorithm='rsa', 
        bit_length=2048, 
        pass_phrase=None, 
        payload_content_type='application/octet-stream', 
        expiration=None)

    # summit to barbican & return order url
    order_url = secret.submit()
    
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

    # plain text of key
    # print(private_key.decode('utf-8'))
    # print(public_key.decode('utf-8'))

    keyPub = RSA.importKey(public_key) # import the public key
    keyPriv = RSA.importKey(private_key) # import the private key

    # public key openssh格式寫入檔案
    public_key_name=f"{file_name}.pub"
    f = open(public_key_name,'wb')
    f.write(keyPub.export_key('OpenSSH'))
    f.close()
    print (f"public key is at {public_key_name}")

    # keyPriv.export_key('OpenSSH')
    # private key pem格式寫入檔案
    private_key_name=f"{file_name}.pem"
    f = open(private_key_name,'wb')
    f.write(keyPriv.export_key('PEM'))
    f.close()
    print (f"private key is at {private_key_name}")

if __name__ == '__main__':
    create_key(key_name)

# ##################################################################
# ## 
# ##   驗證private & public key是否能夠 成功 加/解密
# ##
# from Crypto.PublicKey import RSA
# from Crypto.Cipher import PKCS1_v1_5 as Cipher_PKCS1_v1_5
# msg = "驗證文字"
# print("raw msg->", msg)


# # import the public key
# keyPub = RSA.importKey(public_key)
# cipher = Cipher_PKCS1_v1_5.new(keyPub)
# #print(cipher.encrypt.__doc__)

# ## 公鑰加密
# cipher_text = cipher.encrypt(msg.encode()) # now we have the cipher
# print("cipher text->", cipher_text)

# # import the private key
# keyPriv = RSA.importKey(private_key) 
# cipher = Cipher_PKCS1_v1_5.new(keyPriv)
# #print(cipher.decrypt.__doc__)

# ## 用私鑰解密
# decrypt_text = cipher.decrypt(cipher_text, None).decode()
# print("decrypted msg->", decrypt_text)

# ## 解密後與原文驗證
# assert msg == decrypt_text # check that
# print("test passed")

