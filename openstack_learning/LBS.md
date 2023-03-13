# neutron
```bash
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



neutron lbaas-member-list fe089ae6-44dd-449e-bb2c-10c7b5bff932






neutron lbaas-healthmonitor-list
neutron lbaas-healthmonitor-show f1827c4d-1043-4025-967d-e1751a67ee7d

neutron lbaas-loadbalancer-list 
neutron lbaas-loadbalancer-show 8bc74f69-4865-41e9-ad26-a8a27ea8a575

neutron lbaas-pool-list  
neutron lbaas-pool-show fe089ae6-44dd-449e-bb2c-10c7b5bff932

neutron lbaas-listener-list
neutron lbaas-listener-show 3fda39d2-b57d-40cd-8353-4b629be3a628





```bash

[root@dct-queens-ctl-001 deneil-dev]# neutron lbaas-loadbalancer-list 
neutron CLI is deprecated and will be removed in the future. Use openstack CLI instead.
+--------------------------------------+-----------------+---------------+---------------------+----------+---------+
| id                                   | name            | vip_address   | provisioning_status | provider | timeout |
+--------------------------------------+-----------------+---------------+---------------------+----------+---------+
| 8bc74f69-4865-41e9-ad26-a8a27ea8a575 | deneil-test-LBS | 192.168.77.13 | ACTIVE              | haproxy  |  300000 |
+--------------------------------------+-----------------+---------------+---------------------+----------+---------+

[root@dct-queens-ctl-001 deneil-dev]# neutron lbaas-listener-list
neutron CLI is deprecated and will be removed in the future. Use openstack CLI instead.
+--------------------------------------+--------------------------------------+-------------------+----------+---------------+----------------+
| id                                   | default_pool_id                      | name              | protocol | protocol_port | admin_state_up |
+--------------------------------------+--------------------------------------+-------------------+----------+---------------+----------------+
| 3fda39d2-b57d-40cd-8353-4b629be3a628 | 595589dd-10c5-4170-9202-fccada384ee6 | ssh-test-listener | TCP      |          8787 | True           |
+--------------------------------------+--------------------------------------+-------------------+----------+---------------+----------------+



```







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


















