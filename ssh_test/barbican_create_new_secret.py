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
    name='pyclient-secret-asy-2048-test', 
    algorithm='rsa', 
    bit_length=4096, 
    pass_phrase=None, 
    payload_content_type='application/octet-stream', 
    expiration=None)

# summit to barbican & return order url
order_url = secret.submit()
order_url ='http://192.168.77.15:9311/v1/orders/0bb07e83-55ca-42b4-921d-f6c15913e6e0'
order_url ='http://192.168.77.15:9311/v1/orders/d2ad87aa-ca23-4a84-97e3-5fce518ee428'
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
# print(private_key)
# print(public_key)

## 轉換public key格式 & 輸出檔案
from Crypto.PublicKey import RSA
from Crypto.Cipher import PKCS1_v1_5 as Cipher_PKCS1_v1_5

keyPub = RSA.importKey(public_key) # import the public key
keyPriv = RSA.importKey(private_key) # import the private key

# public key openssh格式寫入檔案
f = open('mykey-2048.pub','wb')
f.write(keyPub.export_key('OpenSSH'))
f.close()

# keyPriv.export_key('OpenSSH')
# private key pem格式寫入檔案
f = open('mykey-2048.pem','wb')
f.write(keyPriv.export_key('PEM'))
f.close()


##################################################################
## 
##   驗證private & public key是否能夠 成功 加/解密
##
from Crypto.PublicKey import RSA
from Crypto.Cipher import PKCS1_v1_5 as Cipher_PKCS1_v1_5
msg = "驗證文字"
print("raw msg->", msg)


# import the public key
keyPub = RSA.importKey(public_key)
cipher = Cipher_PKCS1_v1_5.new(keyPub)
#print(cipher.encrypt.__doc__)

## 公鑰加密
cipher_text = cipher.encrypt(msg.encode()) # now we have the cipher
print("cipher text->", cipher_text)

# import the private key
keyPriv = RSA.importKey(private_key) 
cipher = Cipher_PKCS1_v1_5.new(keyPriv)
#print(cipher.decrypt.__doc__)

## 用私鑰解密
decrypt_text = cipher.decrypt(cipher_text, None).decode()
print("decrypted msg->", decrypt_text)

## 解密後與原文驗證
assert msg == decrypt_text # check that
print("test passed")

