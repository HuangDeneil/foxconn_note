## openstack
```bash 
  loadbalancer amphora list  List amphorae (python-octaviaclient)
  loadbalancer amphora show  Show the details of a single amphora (python-octaviaclient)
  loadbalancer create  Create a load balancer (python-octaviaclient)
  loadbalancer delete  Delete a load balancer (python-octaviaclient)
  loadbalancer failover  Trigger load balancer failover (python-octaviaclient)
  loadbalancer healthmonitor create  Create a health monitor (python-octaviaclient)
  loadbalancer healthmonitor delete  Delete a health monitor (python-octaviaclient)
  loadbalancer healthmonitor list  List health monitors (python-octaviaclient)
  loadbalancer healthmonitor set  Update a health monitor (python-octaviaclient)
  loadbalancer healthmonitor show  Show the details of a single health monitor (python-octaviaclient)
  loadbalancer l7policy create  Create a l7policy (python-octaviaclient)
  loadbalancer l7policy delete  Delete a l7policy (python-octaviaclient)
  loadbalancer l7policy list  List l7policies (python-octaviaclient)
  loadbalancer l7policy set  Update a l7policy (python-octaviaclient)
  loadbalancer l7policy show  Show the details of a single l7policy (python-octaviaclient)
  loadbalancer l7rule create  Create a l7rule (python-octaviaclient)
  loadbalancer l7rule delete  Delete a l7rule (python-octaviaclient)
  loadbalancer l7rule list  List l7rules for l7policy (python-octaviaclient)
  loadbalancer l7rule set  Update a l7rule (python-octaviaclient)
  loadbalancer l7rule show  Show the details of a single l7rule (python-octaviaclient)
  loadbalancer list  List load balancers (python-octaviaclient)
  loadbalancer listener create  Create a listener (python-octaviaclient)
  loadbalancer listener delete  Delete a listener (python-octaviaclient)
  loadbalancer listener list  List listeners (python-octaviaclient)
  loadbalancer listener set  Update a listener (python-octaviaclient)
  loadbalancer listener show  Show the details of a single listener (python-octaviaclient)
  loadbalancer listener stats show  Shows the current statistics for a listener. (python-octaviaclient)
  loadbalancer member create  Creating a member in a pool (python-octaviaclient)
  loadbalancer member delete  Delete a member from a pool  (python-octaviaclient)
  loadbalancer member list  List members in a pool (python-octaviaclient)
  loadbalancer member set  Update a member (python-octaviaclient)
  loadbalancer member show  Shows details of a single Member (python-octaviaclient)
  loadbalancer pool create  Create a pool (python-octaviaclient)
  loadbalancer pool delete  Delete a pool (python-octaviaclient)
  loadbalancer pool list  List pools (python-octaviaclient)
  loadbalancer pool set  Update a pool (python-octaviaclient)
  loadbalancer pool show  Show the details of a single pool (python-octaviaclient)
  loadbalancer quota defaults show  Show quota defaults (python-octaviaclient)
  loadbalancer quota list  List quotas (python-octaviaclient)
  loadbalancer quota reset  Resets quotas to default quotas (python-octaviaclient)
  loadbalancer quota set  Update a quota (python-octaviaclient)
  loadbalancer quota show  Show the quota details for a project (python-octaviaclient)
  loadbalancer set  Update a load balancer (python-octaviaclient)
  loadbalancer show  Show the details for a single load balancer (python-octaviaclient)
  loadbalancer stats show  Shows the current statistics for a load balancer (python-octaviaclient)
```



# neutron
```bash
  lb-agent-hosting-pool              Get loadbalancer agent hosting a pool.
  lb-healthmonitor-associate         Create a mapping between a health monitor and a pool.
  lb-healthmonitor-create            Create a health monitor.
  lb-healthmonitor-delete            Delete a given health monitor.
  lb-healthmonitor-disassociate      Remove a mapping from a health monitor to a pool.
  lb-healthmonitor-list              List health monitors that belong to a given tenant.
  lb-healthmonitor-show              Show information of a given health monitor.
  lb-healthmonitor-update            Update a given health monitor.
  lb-member-create                   Create a member.
  lb-member-delete                   Delete a given member.
  lb-member-list                     List members that belong to a given tenant.
  lb-member-show                     Show information of a given member.
  lb-member-update                   Update a given member.
  lb-pool-create                     Create a pool.
  lb-pool-delete                     Delete a given pool.
  lb-pool-list                       List pools that belong to a given tenant.
  lb-pool-list-on-agent              List the pools on a loadbalancer agent.
  lb-pool-show                       Show information of a given pool.
  lb-pool-stats                      Retrieve stats for a given pool.
  lb-pool-update                     Update a given pool.
  lb-vip-create                      Create a vip.
  lb-vip-delete                      Delete a given vip.
  lb-vip-list                        List vips that belong to a given tenant.
  lb-vip-show                        Show information of a given vip.
  lb-vip-update                      Update a given vip.
  lbaas-agent-hosting-loadbalancer   Get lbaas v2 agent hosting a loadbalancer.
  lbaas-healthmonitor-create         LBaaS v2 Create a healthmonitor.
  lbaas-healthmonitor-delete         LBaaS v2 Delete a given healthmonitor.
  lbaas-healthmonitor-list           LBaaS v2 List healthmonitors that belong to a given tenant.
  lbaas-healthmonitor-show           LBaaS v2 Show information of a given healthmonitor.
  lbaas-healthmonitor-update         LBaaS v2 Update a given healthmonitor.
  lbaas-l7policy-create              LBaaS v2 Create L7 policy.
  lbaas-l7policy-delete              LBaaS v2 Delete a given L7 policy.
  lbaas-l7policy-list                LBaaS v2 List L7 policies that belong to a given listener.
  lbaas-l7policy-show                LBaaS v2 Show information of a given L7 policy.
  lbaas-l7policy-update              LBaaS v2 Update a given L7 policy.
  lbaas-l7rule-create                LBaaS v2 Create L7 rule.
  lbaas-l7rule-delete                LBaaS v2 Delete a given L7 rule.
  lbaas-l7rule-list                  LBaaS v2 List L7 rules that belong to a given L7 policy.
  lbaas-l7rule-show                  LBaaS v2 Show information of a given rule.
  lbaas-l7rule-update                LBaaS v2 Update a given L7 rule.
  lbaas-listener-create              LBaaS v2 Create a listener.
  lbaas-listener-delete              LBaaS v2 Delete a given listener.
  lbaas-listener-list                LBaaS v2 List listeners that belong to a given tenant.
  lbaas-listener-show                LBaaS v2 Show information of a given listener.
  lbaas-listener-update              LBaaS v2 Update a given listener.
  lbaas-loadbalancer-create          LBaaS v2 Create a loadbalancer.
  lbaas-loadbalancer-delete          LBaaS v2 Delete a given loadbalancer.
  lbaas-loadbalancer-list            LBaaS v2 List loadbalancers that belong to a given tenant.
  lbaas-loadbalancer-list-on-agent   List the loadbalancers on a loadbalancer v2 agent.
  lbaas-loadbalancer-show            LBaaS v2 Show information of a given loadbalancer.
  lbaas-loadbalancer-stats           Retrieve stats for a given loadbalancer.
  lbaas-loadbalancer-status          Retrieve status for a given loadbalancer.
  lbaas-loadbalancer-update          LBaaS v2 Update a given loadbalancer.
  lbaas-member-create                LBaaS v2 Create a member.
  lbaas-member-delete                LBaaS v2 Delete a given member.
  lbaas-member-list                  LBaaS v2 List members that belong to a given pool.
  lbaas-member-show                  LBaaS v2 Show information of a given member.
  lbaas-member-update                LBaaS v2 Update a given member.
  lbaas-pool-create                  LBaaS v2 Create a pool.
  lbaas-pool-delete                  LBaaS v2 Delete a given pool.
  lbaas-pool-list                    LBaaS v2 List pools that belong to a given tenant.
  lbaas-pool-show                    LBaaS v2 Show information of a given pool.
  lbaas-pool-update                  LBaaS v2 Update a given pool.
```

neutron lb-healthmonitor-list

neutron lb-member-show




neutron lb-vip-list


neutron lbaas-listener-list




```bash
neutron lbaas-pool-list

[root@dct-queens-ctl-001 deneil-dev]# neutron lbaas-pool-list
neutron CLI is deprecated and will be removed in the future. Use openstack CLI instead.
+--------------------------------------+--------+-------------------+----------+----------------+
| id                                   | name   | lb_algorithm      | protocol | admin_state_up |
+--------------------------------------+--------+-------------------+----------+----------------+
| 90ba46fe-24ce-400e-9702-fc0c395c5bdc | Pool 1 | LEAST_CONNECTIONS | TCP      | True           |
+--------------------------------------+--------+-------------------+----------+----------------+

[root@dct-queens-ctl-001 deneil-dev]# neutron lbaas-pool-show 90ba46fe-24ce-400e-9702-fc0c395c5bdc
neutron CLI is deprecated and will be removed in the future. Use openstack CLI instead.
+---------------------+------------------------------------------------+
| Field               | Value                                          |
+---------------------+------------------------------------------------+
| admin_state_up      | True                                           |
| description         |                                                |
| healthmonitor_id    | 25d3e38e-3cc6-46fe-8555-78bf3a057346           |
| id                  | 90ba46fe-24ce-400e-9702-fc0c395c5bdc           |
| lb_algorithm        | LEAST_CONNECTIONS                              |
| listeners           | {"id": "a3792481-2b42-4bc9-a8ea-e1203c63ba9c"} |
| loadbalancers       | {"id": "8bc74f69-4865-41e9-ad26-a8a27ea8a575"} |
| members             | f7e936ff-1c0a-44ba-afd8-28552ecb23bf           |
|                     | ec735e26-86be-4c1a-93b2-2c223afe9614           |
| name                | Pool 1                                         |
| protocol            | TCP                                            |
| session_persistence |                                                |
| tenant_id           | cfdc857f42274e2ea6b30dd844e23ca5               |
+---------------------+------------------------------------------------+


```



neutron lbaas-pool-show 90ba46fe-24ce-400e-9702-fc0c395c5bdc


















