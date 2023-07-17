
```bash
sudo docker run -dit -p 3000:3000 \
--name docker0208 \
-v /etc/tool_api/config.json:/usr/src/app/config.json docker_compatibility_api
```

```bash
[root@deneil-test-docker centos]# docker ps
CONTAINER ID        IMAGE                      COMMAND             CREATED             STATUS              PORTS                    NAMES
f4647d4b27ef        docker_compatibility_api   "python main.py"    7 seconds ago       Up 6 seconds        0.0.0.0:3000->3000/tcp   docker0208


docker exec -ti f46 bash


```

## cold migration

```bash

openstack server list --all --host dct-queens-com-007-minsky

VM_ID="da003f4e-0c01-43e5-a777-2dc3a99e463f"
nova show $VM_ID | grep " status \| OS-EXT-STS:vm_state " | awk '{print $2 "\t" $4 }' 
nova show $VM_ID
nova reboot --hard $VM_ID
openstack server migrate $VM_ID
openstack server resize --confirm $VM_ID
openstack server resize --flavor 88e04fe7-f4ea-4c27-bff5-63760d5fedf1 $VM_ID


systemctl status openstack-nova-compute.service
systemctl stop openstack-nova-compute.service

mv manager.py backup
cp manager-NeedToTry.py manager.py
rm manager.pyc ; rm manager.pyo

systemctl restart openstack-nova-compute.service




```

## Openstack official cold migration shell script protocol

```bash

#!/bin/bash

# Provide usage
usage() {
echo "Usage: $0 VM_ID"
exit 1
}

[[ $# -eq 0 ]] && usage

# Migrate the VM to an alternate hypervisor
echo -n "Migrating instance to alternate host"
VM_ID=$1
openstack server migrate $VM_ID
VM_OUTPUT=$(openstack server show $VM_ID)
VM_STATUS=$(echo "$VM_OUTPUT" | grep status | awk '{print $4}')
while [[ "$VM_STATUS" != "VERIFY_RESIZE" ]]; do
echo -n "."
sleep 2
VM_OUTPUT=$(openstack server show $VM_ID)
VM_STATUS=$(echo "$VM_OUTPUT" | grep status | awk '{print $4}')
done
openstack server resize --confirm $VM_ID
echo " instance migrated and resized."
echo;

# Show the details for the VM
echo "Updated instance details:"
openstack server show $VM_ID

# Pause to allow users to examine VM details
read -p "Pausing, press <enter> to exit."

```
