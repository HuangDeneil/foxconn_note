





## change admin passwd

```bash

for i in `ls *`
do
	if [ -f "$i" ] ;then
        data=`cat $i | grep "admin_foxconn"`
        if grep -qzw "admin_foxconn" $i ;then 
            echo -e "-------------------\n$i\n$data" 
        fi
    fi 
    if [ -d $i ] ;then 
        for j in `ls $i/* -d`
        do
            if [ -f "$j" ] ;then
                data=`cat $j | grep "admin_foxconn"`
                if [ "$j" = "trove/trove-taskmanager.conf" ]; then
                    echo $i
                fi
                if grep -qzw "admin_foxconn" $j ;then 
                    echo -e "-------------------\n$j\n$data" 
                fi
            fi
            if [ -d $j ] ;then 
                for k in `ls $j/* -d`
                do
                    if [ -f "$k" ] ;then
                        data=`cat $k | grep "admin_foxconn"`
                        if grep -qzw "admin_foxconn" $k ;then 
                            echo -e "-------------------\n$k\n$data" 
                        fi
                    fi
                done
            fi
        done
    fi
done


i="systemd/user.conf"
i="trove/trove-taskmanager.conf"

data=`cat $i | grep "admin_foxconn"`


if grep -qzw "admin_foxconn" $i ;then 
    echo -e "-------------------\n$i\n$data" 
fi

grep -qzw "^$1" file

if [ `grep  PATTERN file.txt` ]; then
    echo found
else
    echo not foun


for i in `ls * -d`
do 
    if [ -d $i ] ;then 
        for j in `ls $i/* -d`
        do
            if [ -f $j ] ;then 
                # echo $j
                if [ "$j" == "trove/trove-taskmanager.conf" ]; then
                    echo $j
                fi
            fi
            # if grep -qzw "admin_foxconn" $j ;then 
            #     data=`cat $j | grep "foxconn"`
            #     echo -e "-------------------\n$j\n$data" 
            # fi
        done
    fi
done




openstack user password set \
--password <new-password> \
--original-password <current-admin-password>

openstack user set --password <> admin

```


```conf

-------------------
trove/trove-guestagent.conf
nova_proxy_admin_pass = foxconn
transport_url = rabbit://openstack:rabbitmq_foxconn@amqp.jadecloud.fixoiaas


-------------------

trove/trove-taskmanager.conf
transport_url = rabbit://openstack:rabbitmq_foxconn@192.168.60.22,openstack:rabbitmq_foxconn@192.168.60.28,openstack:rabbitmq_foxconn@192.168.60.29
nova_proxy_admin_pass = admin_foxconn
connection = mysql+pymysql://trove:trove_foxconn@192.168.60.200/trove
password = admin_foxconn
admin_password = trove_foxconn

```

```bash

cd /usr/lib/python2.7/site-packages/horizon
for i in `ls *.py`
do 
    data=`cat $i | grep IPAddressFilter`
    echo -e "-------------\n $i\n$data "
done


for i in `ls * -d `
do 
    if [ -d "$i" ] ;then
        for j in `ls $i/*.py `
        do
            data=`cat $j | grep IPAddressFilter`
            echo -e "-------------\n $j\n$data "
        done
    fi
done



```