#!/bin/bash
for i in `openstack secret order list | awk '{print $2}'` 
do 
    if [[ ! "$i" == "Order" ]]; then
        openstack secret order delete $i
        echo $i deleted
    fi
done
## Deletion all container
for i in `openstack secret container list | awk '{print $2}'` 
do 
    if [[ ! "$i" == "|"  ]]; then
        if [[  ! "$i" == "Container" ]]; then
            openstack secret container delete $i
            echo $i deleted
        fi
    fi
done
## Deletion all secrets
for i in `openstack secret list | awk '{print $2}'`
do 
    if [[ ! "$i" == "Secret" ]]; then
        openstack secret delete $i
        echo $i deleted
    fi
done