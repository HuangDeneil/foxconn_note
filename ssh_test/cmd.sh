# 操作方式
# python test_transport.py <openstack_secret_order_url> <ip> <local file> <remote path>

order_url="http://192.168.184.131:9311/v1/orders/81d01bf6-a0f5-4d0f-a2aa-5a7074136696"
remote_user="rocky"
ip="192.168.184.132"
local_file="testfile.txt"
remote_path="/home/rocky/test/"
# command="head /home/$user/.ssh/authorized_keys"
# command="ls -hal"
# python test_transport.py $order_url $remote_user $ip $local_file $remote_path


python test_transport.py $order_url $remote_user $ip 
