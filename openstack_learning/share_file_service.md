
ssh -i ~/.ssh/keys/foxconn-openstack_key.pem root@10.67.46.22
ssh tj-testbed-network-001
ip netns exec qdhcp-c94ceb9a-c58e-4897-87ef-dac98e4993ca ssh centos@192.168.77.5
ip netns exec qdhcp-c94ceb9a-c58e-4897-87ef-dac98e4993ca ssh rocky@192.168.77.15

ssh 10.67.46.151
ssh rocky@10.67.46.151


192.168.77.13:/shares/share-45eba983-183a-4eac-966c-6a3b18c995b4

mount -t nfs 10.10.0.2:/shared/nfs /mnt

## `NFS`
```bash
## 掛載網路共享空間至linux上
### centos 掛載
mount -t nfs 192.168.77.13:/shares/share-45eba983-183a-4eac-966c-6a3b18c995b4 /mnt/data1

### rocky 掛載
mount -t nfs 192.168.77.13:/shares/share-45eba983-183a-4eac-966c-6a3b18c995b4 /share/data1/
mount -t nfs 192.168.77.13:/shares/share-0c7fbaaa-3f4b-49f9-bc43-d33a6faf147d /share/data-testNFS

###### Detach share disk
### centos
umount -f /mnt/data1
### rocky
umount -f /share/data1/
umount -f /share/data-testNFS


```




## `CIFS`
```bash
##### way 1
### centos
mount -t cifs //192.168.77.13/share-73ec5d2f-c222-4947-8d48-d1f88c809a2e /mnt/data-cifs \
-o username="Username",password="Password"

### rocky
mount -t cifs //192.168.77.13/share-73ec5d2f-c222-4947-8d48-d1f88c809a2e /share/data-cifs \
-o username="Username",password="Password"


##### way 2
### centos
mount.cifs //192.168.77.13/share-73ec5d2f-c222-4947-8d48-d1f88c809a2e /mnt/data-cifs \
-o username="Username",password="Password"

### rocky
mount.cifs //192.168.77.13/share-73ec5d2f-c222-4947-8d48-d1f88c809a2e /share/data-cifs \
-o username="Username",password="Password"


###### Detach share disk
### centos
umount /mnt/data-cifs
### rocky
umount /share/data-cifs
```

## installing `cifs-utils`

```bash
# 先到還沒裝 & 有對外網路的VM
yum install -y --downloadonly cifs-utils

```

## 會顯示要安裝的package們，且只會下載下來

```bash
...
Downloading Packages:
(1/6): avahi-libs-0.8-12.el9.x86_64.rpm                      272 kB/s |  67 kB     00:00    
(2/6): cifs-utils-6.14-1.el9.x86_64.rpm                      346 kB/s |  93 kB     00:00    
(3/6): samba-common-libs-4.16.4-101.el9.x86_64.rpm           348 kB/s | 101 kB     00:00    
(4/6): samba-common-4.16.4-101.el9.noarch.rpm                2.2 MB/s | 145 kB     00:00    
(5/6): libwbclient-4.16.4-101.el9.x86_64.rpm                 1.3 MB/s |  43 kB     00:00    
(6/6): samba-client-libs-4.16.4-101.el9.x86_64.rpm            30 MB/s | 5.0 MB     00:00  
...
```

### 下載結束後使用root 到 `/` 下尋找檔案

```bash
find . | grep avahi-libs-0.8-12.el9.x86_64.rpm
***
```

### 將把所有rpm file放到同個資料夾下進行安裝

```bash
rpm -ivh *
yum localinstall *
```

## 確認所有nova-compute

```bash
192.168.60.114 dct-queens-com-007
192.168.60.115 dct-queens-com-008
192.168.60.116 dct-queens-com-009
192.168.60.121 dct-queens-com-010-gpu
192.168.60.131 dct-queens-com-010-teak
192.168.60.132 dct-queens-com-011-teak
192.168.60.17 dct-queens-com-001
192.168.60.19 dct-queens-com-002
192.168.60.21 dct-queens-com-003
192.168.60.22 dct-queens-ctl-001
192.168.60.65 dct-queens-com-006-gpu
192.168.60.92 dct-queens-com-004
192.168.60.93 dct-queens-com-005


list="dct-queens-com-007 \
dct-queens-com-010-teak \
dct-queens-com-011-teak \
dct-queens-com-001 \
dct-queens-com-002 \
dct-queens-com-003 \
dct-queens-com-004 \
dct-queens-com-005"

instance_id="0bd63f4a-035c-4ef8-88e1-cddb15f80a3e"
cmd="cat /var/log/nova/nova-compute.log | grep $instance_id"
ssh dct-queens-com-010-teak $cmd

cmd=""
ssh dct-queens-com-010-teak grep ""

az-teak-010
0bd63f4a-035c-4ef8-88e1-cddb15f80a3e

Availability-Zone-2
4c481580-9d0c-4532-8bac-e50133373427

```

```bash

manila list
manila list | grep f3a16da7-ca58-4fb7-b8cc-584b9f589999
manila show f3a16da7-ca58-4fb7-b8cc-584b9f589999

manila service-list

manila share-instance-list
manila share-server-list

## check ip acl
manila access-list <share>
  <share>              Name or ID of the share

manila create
manila help create

manila show f3a16da7-ca58-4fb7-b8cc-584b9f589999

/v2/shares

```

# KHQ-testBed

## API

```bash
## API
## https://docs.openstack.org/api-ref/shared-file-system/?expanded=list-shares-detail

token=`openstack  token issue | grep "| id" | awk '{print $4}'`

## admin project
## /v2/{admin_project_id}/shares/{share_id}/export_locations
curl -i -X GET http://osapi.dct-tb.mtjade.cloud:8786/v2/d034846b0c0f4df4b0ef6cae1bd9b306/shares/f3a16da7-ca58-4fb7-b8cc-584b9f589999/export_locations \
-H "X-Openstack-Manila-Api-Version: 2.42" \
-H "X-Auth-Token: $token" \
-H "Accept: application/json" \
-H "User-Agent: python-manilaclient"

## admin project check whole platform shares
## /v2/{admin_project_id}/shares/detail?all_tenants=True 
curl -i -X GET http://osapi.dct-tb.mtjade.cloud:8786/v2/d034846b0c0f4df4b0ef6cae1bd9b306/shares/detail?all_tenants=True \
-H "X-Openstack-Manila-Api-Version: 2.42" \
-H "X-Auth-Token: $token"




## admin project check whole platform shares
## POST /v2/{project_id}/shares/{share_id}/action 
curl -i -X POST http://osapi.dct-tb.mtjade.cloud:8786/v2/d034846b0c0f4df4b0ef6cae1bd9b306/shares/63e0fdb2-0029-4954-a3ca-19f9ce956e1e?force_delete=null \
-H "X-Auth-Token: $token"

curl -i -X GET http://osapi.dct-tb.mtjade.cloud:8786/v2/d034846b0c0f4df4b0ef6cae1bd9b306/shares/63e0fdb2-0029-4954-a3ca-19f9ce956e1e/export_locations \
-H "X-Auth-Token: $token" \
-H "Accept: application/json" \
-H "User-Agent: python-manilaclient"

manila show 63e0fdb2-0029-4954-a3ca-19f9ce956e1e



token=`openstack  token issue | grep "| id" | awk '{print $4}'`

## /v2/{project_id}/shares 
curl -i -X GET http://osapi.dct-tb.mtjade.cloud:8786/v2/5a54b3853491478ead28060213c857c4/shares \
-H "X-Auth-Token: $token" \
-H "Accept: application/json" \
-H "User-Agent: python-manilaclient"

## /v2/{project_id}/shares/detail
curl -i -X GET http://osapi.dct-tb.mtjade.cloud:8786/v2/5a54b3853491478ead28060213c857c4/shares/detail \
-H "X-Auth-Token: $token" \
-H "Accept: application/json" 

## /v2/{project_id}/shares/{share_id}/export_locations
curl -i -X GET http://osapi.dct-tb.mtjade.cloud:8786/v2/5a54b3853491478ead28060213c857c4/shares/f3a16da7-ca58-4fb7-b8cc-584b9f589999/export_locations \
-H "X-Auth-Token: $token" \
-H "Accept: application/json" \
-H "User-Agent: python-manilaclient"



## /v2/{project_id}/shares/{share_id}/instances
curl -i -X GET http://osapi.dct-tb.mtjade.cloud:8786/v2/5a54b3853491478ead28060213c857c4/shares/f3a16da7-ca58-4fb7-b8cc-584b9f589999/instances \
-H "X-Auth-Token: $token" \
-H "Accept: application/json" \
-H "User-Agent: python-manilaclient"
```

# lh-testBed

## API

```bash
## 
[root@lh-testbed-control-001 ~]# openstack project list | grep admin
| e7e526aee74f41daadbb3e1104f5a404 | admin                                                            |

[root@lh-testbed-control-001 deneil-dev]# manila list
+--------------------------------------+---------------+------+-------------+-----------+-----------+--------------------+------+-------------------+
| ID                                   | Name          | Size | Share Proto | Status    | Is Public | Share Type Name    | Host | Availability Zone |
+--------------------------------------+---------------+------+-------------+-----------+-----------+--------------------+------+-------------------+
| 056acb85-ce74-4538-a9c5-65ad82c421c2 | testSFS-NFS-2 | 100  | NFS         | available | False     | default_share_type |      | None              |
| b4d0923b-305e-4435-b827-55dd7bf9b35f | testSFS-NFS   | 50   | NFS         | available | False     | default_share_type |      | None              |
| cafc9911-04c7-4506-93c9-a1c10af6f0d9 | testSFS-NFS-3 | 150  | NFS         | available | False     | default_share_type |      | None              |
+--------------------------------------+---------------+------+-------------+-----------+-----------+--------------------+------+-------------------+


token=`openstack  token issue | grep "| id" | awk '{print $4}'`

## admin project
## /v2/{admin_project_id}/shares/{share_id}/export_locations
curl -i -X GET http://192.168.9.200:8786/v2/e7e526aee74f41daadbb3e1104f5a404/shares/056acb85-ce74-4538-a9c5-65ad82c421c2/export_locations \
-H "X-Auth-Token: $token" \
-H "X-Openstack-Manila-Api-Version: 2.42" \
-H "Accept: application/json" \
-H "User-Agent: python-manilaclient"

## admin project check whole platform shares
## /v2/{admin_project_id}/shares/detail?all_tenants=True 
curl -i -X GET http://192.168.9.200:8786/v2/e7e526aee74f41daadbb3e1104f5a404/shares/detail?all_tenants=True \
-H "X-Openstack-Manila-Api-Version: 2.42" \
-H "X-Auth-Token: $token"

token=`openstack  token issue | grep "| id" | awk '{print $4}'`
REQ=`curl -i -X GET http://192.168.9.200:8786/v2/e7e526aee74f41daadbb3e1104f5a404/shares/detail?all_tenants=True \
-H "X-Openstack-Manila-Api-Version: 2.42" \
-H "X-Auth-Token: $token"`




curl -i -X GET http://192.168.9.200:8786/v2/e7e526aee74f41daadbb3e1104f5a404/shares/056acb85-ce74-4538-a9c5-65ad82c421c2 -H "X-Auth-Token: $token" 


## admin project check whole platform shares
## POST /v2/{admin_project_id}/shares/{share_id}/action 
curl -i -X POST http://192.168.9.200:8786/v2/e7e526aee74f41daadbb3e1104f5a404/shares/056acb85-ce74-4538-a9c5-65ad82c421c2?force_delete=null \
-H "X-Auth-Token: $token"


# GET /v2/{project_id}/snapshots
curl -i -X GET http://192.168.9.200:8786/v2/e7e526aee74f41daadbb3e1104f5a404/snapshots -H "X-Auth-Token: $token" 


## admin only
## GET v2/{project_id}/share-servers
curl -i -X GET http://192.168.9.200:8786/v2/e7e526aee74f41daadbb3e1104f5a404/share-servers -H "X-Auth-Token: $token" 




token=`openstack  token issue | grep "| id" | awk '{print $4}'`

# DELETE /v2/{project_id}/shares/{share_id}  
curl -i -X DELETE http://192.168.9.200:8786/v2/e7e526aee74f41daadbb3e1104f5a404/shares/056acb85-ce74-4538-a9c5-65ad82c421c2?force_delete=null -H "X-Auth-Token: $token"

curl -i -X DELETE http://192.168.9.200:8786/v2/e7e526aee74f41daadbb3e1104f5a404/shares/b700b0dd-8992-45a5-ac57-cb856432da6d?force_delete=null -H "X-Auth-Token: $token"

curl -i -X DELETE http://192.168.9.200:8786/v2/e7e526aee74f41daadbb3e1104f5a404/shares/b4d0923b-305e-4435-b827-55dd7bf9b35f?force_delete=null -H "X-Auth-Token: $token"
curl -i -X DELETE http://192.168.9.200:8786/v2/e7e526aee74f41daadbb3e1104f5a404/shares/cafc9911-04c7-4506-93c9-a1c10af6f0d9?force_delete=null -H "X-Auth-Token: $token"


cafc9911-04c7-4506-93c9-a1c10af6f0d9



curl -i -X GET http://192.168.9.200:8786/v2/e7e526aee74f41daadbb3e1104f5a404/shares/63e0fdb2-0029-4954-a3ca-19f9ce956e1e/export_locations \
-H "X-Auth-Token: $token" \
-H "Accept: application/json" \
-H "User-Agent: python-manilaclient"



```

## CLI help

```bash


[root@dct-queens-ctl-001 ~]# manila 
usage: manila [--version] [-d] [--os-cache] [--os-reset-cache]
              [--os-user-id <auth-user-id>] [--os-username <auth-user-name>]
              [--os-password <auth-password>]
              [--os-tenant-name <auth-tenant-name>]
              [--os-project-name <auth-project-name>]
              [--os-tenant-id <auth-tenant-id>]
              [--os-project-id <auth-project-id>]
              [--os-user-domain-id <auth-user-domain-id>]
              [--os-user-domain-name <auth-user-domain-name>]
              [--os-project-domain-id <auth-project-domain-id>]
              [--os-project-domain-name <auth-project-domain-name>]
              [--os-auth-url <auth-url>] [--os-region-name <region-name>]
              [--os-token <token>] [--bypass-url <bypass-url>]
              [--service-type <service-type>] [--service-name <service-name>]
              [--share-service-name <share-service-name>]
              [--endpoint-type <endpoint-type>]
              [--os-share-api-version <share-api-ver>]
              [--os-cacert <ca-certificate>] [--retries <retries>]
              [--os-cert <certificate>]
              <subcommand> ...

Command-line interface to the OpenStack Manila API.

Positional arguments:
  <subcommand>
    absolute-limits     Print a list of absolute limits for a user.
    access-allow        Allow access to the share.
    access-deny         Deny access to a share.
    access-list         Show access list for share.
    api-version         Display the API version information.
    availability-zone-list
                        List all availability zones.
    create              Creates a new share (NFS, CIFS, CephFS, GlusterFS,
                        HDFS or MAPRFS).
    credentials         Show user credentials returned from auth.
    delete              Remove one or more shares.
    endpoints           Discover endpoints that get returned from the
                        authenticate services.
    extend              Increases the size of an existing share.
    extra-specs-list    Print a list of current 'share types and extra specs'
                        (Admin Only).
    force-delete        Attempt force-delete of share, regardless of state
                        (Admin only).
    list                List NAS shares with filters.
    manage              Manage share not handled by Manila (Admin only).
    message-delete      Remove one or more messages.
    message-list        Lists all messages.
    message-show        Show details about a message.
    metadata            Set or delete metadata on a share.
    metadata-show       Show metadata of given share.
    metadata-update-all
                        Update all metadata of a share.
    migration-cancel    Cancels migration of a given share when copying (Admin
                        only, Experimental).
    migration-complete  Completes migration for a given share (Admin only,
                        Experimental).
    migration-get-progress
                        Gets migration progress of a given share when copying
                        (Admin only, Experimental).
    migration-start     Migrates share to a new host (Admin only,
                        Experimental).
    pool-list           List all backend storage pools known to the scheduler
                        (Admin only).
    quota-class-show    List the quotas for a quota class.
    quota-class-update  Update the quotas for a quota class (Admin only).
    quota-defaults      List the default quotas for a tenant.
    quota-delete        Delete quota for a tenant/user or tenant/share-type.
                        The quota will revert back to default (Admin only).
    quota-show          List the quotas for a tenant/user.
    quota-update        Update the quotas for a project/user and/or share type
                        (Admin only).
    rate-limits         Print a list of rate limits for a user.
    reset-state         Explicitly update the state of a share (Admin only).
    reset-task-state    Explicitly update the task state of a share (Admin
                        only, Experimental).
    revert-to-snapshot  Revert a share to the specified snapshot.
    security-service-create
                        Create security service used by tenant.
    security-service-delete
                        Delete one or more security services.
    security-service-list
                        Get a list of security services.
    security-service-show
                        Show security service.
    security-service-update
                        Update security service.
    service-disable     Disables 'manila-share' or 'manila-scheduler' services
                        (Admin only).
    service-enable      Enables 'manila-share' or 'manila-scheduler' services
                        (Admin only).
    service-list        List all services (Admin only).
    share-export-location-list
                        List export locations of a given share.
    share-export-location-show
                        Show export location of the share.
    share-group-create  Creates a new share group (Experimental).
    share-group-delete  Remove one or more share groups (Experimental).
    share-group-list    List share groups with filters (Experimental).
    share-group-reset-state
                        Explicitly update the state of a share group (Admin
                        only, Experimental).
    share-group-show    Show details about a share group (Experimental).
    share-group-snapshot-create
                        Creates a new share group snapshot (Experimental).
    share-group-snapshot-delete
                        Remove one or more share group snapshots
                        (Experimental).
    share-group-snapshot-list
                        List share group snapshots with filters
                        (Experimental).
    share-group-snapshot-list-members
                        List members of a share group snapshot (Experimental).
    share-group-snapshot-reset-state
                        Explicitly update the state of a share group snapshot
                        (Admin only, Experimental).
    share-group-snapshot-show
                        Show details about a share group snapshot
                        (Experimental).
    share-group-snapshot-update
                        Update a share group snapshot (Experimental).
    share-group-type-access-add
                        Adds share group type access for the given project
                        (Admin only).
    share-group-type-access-list
                        Print access information about a share group type
                        (Admin only).
    share-group-type-access-remove
                        Removes share group type access for the given project
                        (Admin only).
    share-group-type-create
                        Create a new share group type (Admin only).
    share-group-type-delete
                        Delete a specific share group type (Admin only).
    share-group-type-key
                        Set or unset group_spec for a share group type (Admin
                        only).
    share-group-type-list
                        Print a list of available 'share group types'.
    share-group-type-specs-list
                        Print a list of 'share group types specs' (Admin
                        Only).
    share-group-update  Update a share group (Experimental).
    share-instance-export-location-list
                        List export locations of a given share instance.
    share-instance-export-location-show
                        Show export location for the share instance.
    share-instance-force-delete
                        Force-delete the share instance, regardless of state
                        (Admin only).
    share-instance-list
                        List share instances (Admin only).
    share-instance-reset-state
                        Explicitly update the state of a share instance (Admin
                        only).
    share-instance-show
                        Show details about a share instance (Admin only).
    share-network-create
                        Create description for network used by the tenant.
    share-network-delete
                        Delete one or more share networks.
    share-network-list  Get a list of network info.
    share-network-security-service-add
                        Associate security service with share network.
    share-network-security-service-list
                        Get list of security services associated with a given
                        share network.
    share-network-security-service-remove
                        Dissociate security service from share network.
    share-network-show  Get a description for network used by the tenant.
    share-network-update
                        Update share network data.
    share-replica-create
                        Create a share replica (Experimental).
    share-replica-delete
                        Remove one or more share replicas (Experimental).
    share-replica-list  List share replicas (Experimental).
    share-replica-promote
                        Promote specified replica to 'active' replica_state
                        (Experimental).
    share-replica-reset-replica-state
                        Explicitly update the 'replica_state' of a share
                        replica (Experimental).
    share-replica-reset-state
                        Explicitly update the 'status' of a share replica
                        (Experimental).
    share-replica-resync
                        Attempt to update the share replica with its 'active'
                        mirror (Experimental).
    share-replica-show  Show details about a replica (Experimental).
    share-server-delete
                        Delete one or more share servers (Admin only).
    share-server-details
                        Show share server details (Admin only).
    share-server-list   List all share servers (Admin only).
    share-server-show   Show share server info (Admin only).
    show                Show details about a NAS share.
    shrink              Decreases the size of an existing share.
    snapshot-access-allow
                        Allow read only access to a snapshot.
    snapshot-access-deny
                        Deny access to a snapshot.
    snapshot-access-list
                        Show access list for a snapshot.
    snapshot-create     Add a new snapshot.
    snapshot-delete     Remove one or more snapshots.
    snapshot-export-location-list
                        List export locations of a given snapshot.
    snapshot-export-location-show
                        Show export location of the share snapshot.
    snapshot-force-delete
                        Attempt force-deletion of one or more snapshots.
                        Regardless of the state (Admin only).
    snapshot-instance-export-location-list
                        List export locations of a given snapshot instance.
    snapshot-instance-export-location-show
                        Show export location of the share instance snapshot.
    snapshot-instance-list
                        List share snapshot instances.
    snapshot-instance-reset-state
                        Explicitly update the state of a share snapshot
                        instance.
    snapshot-instance-show
                        Show details about a share snapshot instance.
    snapshot-list       List all the snapshots.
    snapshot-manage     Manage share snapshot not handled by Manila (Admin
                        only).
    snapshot-rename     Rename a snapshot.
    snapshot-reset-state
                        Explicitly update the state of a snapshot (Admin
                        only).
    snapshot-show       Show details about a snapshot.
    snapshot-unmanage   Unmanage one or more share snapshots (Admin only).
    type-access-add     Adds share type access for the given project (Admin
                        only).
    type-access-list    Print access information about the given share type
                        (Admin only).
    type-access-remove  Removes share type access for the given project (Admin
                        only).
    type-create         Create a new share type (Admin only).
    type-delete         Delete one or more specific share types (Admin only).
    type-key            Set or unset extra_spec for a share type (Admin only).
    type-list           Print a list of available 'share types'.
    type-show           Show share type details.
    unmanage            Unmanage share (Admin only).
    update              Rename a share.
    bash-completion     Print arguments for bash_completion. Prints all of the
                        commands and options to stdout so that the
                        manila.bash_completion script doesn't have to hard
                        code them.
    help                Display help about this program or one of its
                        subcommands.
    list-extensions     List all the os-api extensions that are available.

Optional arguments:
  --version             show program's version number and exit
  -d, --debug           Print debugging output.
  --os-cache            Use the auth token cache. Defaults to env[OS_CACHE].
  --os-reset-cache      Delete cached password and auth token.
  --os-user-id <auth-user-id>
                        Defaults to env [OS_USER_ID].
  --os-username <auth-user-name>
                        Defaults to env[OS_USERNAME].
  --os-password <auth-password>
                        Defaults to env[OS_PASSWORD].
  --os-tenant-name <auth-tenant-name>
                        Defaults to env[OS_TENANT_NAME].
  --os-project-name <auth-project-name>
                        Another way to specify tenant name. This option is
                        mutually exclusive with --os-tenant-name. Defaults to
                        env[OS_PROJECT_NAME].
  --os-tenant-id <auth-tenant-id>
                        Defaults to env[OS_TENANT_ID].
  --os-project-id <auth-project-id>
                        Another way to specify tenant ID. This option is
                        mutually exclusive with --os-tenant-id. Defaults to
                        env[OS_PROJECT_ID].
  --os-user-domain-id <auth-user-domain-id>
                        OpenStack user domain ID. Defaults to
                        env[OS_USER_DOMAIN_ID].
  --os-user-domain-name <auth-user-domain-name>
                        OpenStack user domain name. Defaults to
                        env[OS_USER_DOMAIN_NAME].
  --os-project-domain-id <auth-project-domain-id>
                        Defaults to env[OS_PROJECT_DOMAIN_ID].
  --os-project-domain-name <auth-project-domain-name>
                        Defaults to env[OS_PROJECT_DOMAIN_NAME].
  --os-auth-url <auth-url>
                        Defaults to env[OS_AUTH_URL].
  --os-region-name <region-name>
                        Defaults to env[OS_REGION_NAME].
  --os-token <token>    Defaults to env[OS_TOKEN].
  --bypass-url <bypass-url>
                        Use this API endpoint instead of the Service Catalog.
                        Defaults to env[OS_MANILA_BYPASS_URL].
  --service-type <service-type>
                        Defaults to compute for most actions.
  --service-name <service-name>
                        Defaults to env[OS_MANILA_SERVICE_NAME].
  --share-service-name <share-service-name>
                        Defaults to env[OS_MANILA_SHARE_SERVICE_NAME].
  --endpoint-type <endpoint-type>
                        Defaults to env[OS_MANILA_ENDPOINT_TYPE] or publicURL.
  --os-share-api-version <share-api-ver>
                        Accepts 1.x to override default to
                        env[OS_SHARE_API_VERSION].
  --os-cacert <ca-certificate>
                        Specify a CA bundle file to use in verifying a TLS
                        (https) server certificate. Defaults to
                        env[OS_CACERT].
  --retries <retries>   Number of retries.
  --os-cert <certificate>
                        Defaults to env[OS_CERT].

See "manila help COMMAND" for help on a specific command.
```



```bash
[root@dct-queens-ctl-001 ~]# manila service-list

+----+------------------+----------------------------+------+---------+-------+----------------------------+
| Id | Binary           | Host                       | Zone | Status  | State | Updated_at                 |
+----+------------------+----------------------------+------+---------+-------+----------------------------+
| 3  | manila-scheduler | dct-queens-ctl-002         | nova | enabled | up    | 2023-02-09T01:47:05.000000 |
| 6  | manila-scheduler | dct-queens-ctl-001         | nova | enabled | up    | 2023-02-09T01:47:06.000000 |
| 9  | manila-scheduler | dct-queens-ctl-003         | nova | enabled | up    | 2023-02-09T01:47:02.000000 |
| 12 | manila-share     | dct-queens-net-001@generic | nova | enabled | up    | 2023-02-09T01:47:01.000000 |
| 15 | manila-share     | dct-queens-net-002@generic | nova | enabled | up    | 2023-02-09T01:47:06.000000 |
| 18 | manila-share     | dct-queens-net-003@generic | nova | enabled | up    | 2023-02-09T01:47:05.000000 |
+----+------------------+----------------------------+------+---------+-------+----------------------------+
```

