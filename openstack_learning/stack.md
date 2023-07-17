# stack, k8s, docker hub, psd

```bash

openstack stack list

token=`openstack token issue | grep " id " | awk '{print $4}'`
curl -g -i -X GET http://osapi-fixo-6-lh.fixo.cloud:8004/v1/{project_id}/stacks
curl -X GET http://osapi-fixo-6-lh.fixo.cloud:8004/v1/ad0f82e97b9e4bfb9c2b43c390320654/stacks -H "X-Auth-Token: $token" 

# openstack stack delete deneilpsdha0627-lvnrbx3eqi5f
curl -X DELETE http://osapi-fixo-6-lh.fixo.cloud:8004/v1/ad0f82e97b9e4bfb9c2b43c390320654/stacks/deneilpsdha0627-lvnrbx3eqi5f -H "X-Auth-Token: $token"

# openstack stack delete cfcb69ff-74c2-4648-b254-14
token=`openstack token issue | grep " id " | awk '{print $4}'`
curl -X DELETE http://osapi-fixo-6-lh.fixo.cloud:8004/v1/ad0f82e97b9e4bfb9c2b43c390320654/stacks/cfcb69ff-74c2-4648-b254-14b1a55b3237 -H "X-Auth-Token: $token"


################
####         ###
####   K8s   ###
####         ###
################
## magnet
# openstack coe cluster list
token=`openstack token issue | grep " id " | awk '{print $4}'`
curl -X GET http://osapi-fixo-6-lh.fixo.cloud:9511/clusters/detail -H "X-Auth-Token: $token" 

# openstack coe cluster delete 7fbf9957-741f-457e-a4a2-c8fd003a6610
curl -X DELETE http://osapi-fixo-6-lh.fixo.cloud:9511/clusters/7fbf9957-741f-457e-a4a2-c8fd003a6610 -H "X-Auth-Token: $token" 


######################
####              ####
####  docker hub  ####
####              ####
######################
## migaloo
# http://cih.fixo.cloud:9522/v1

token=`openstack token issue | grep " id " | awk '{print $4}'`
curl -X GET http://cih.fixo.cloud:9522/v1/clusters/detail -H "X-Auth-Token: $token" | python -m 'json.tool'

curl -X DELETE http://cih.fixo.cloud:9522/v1/clusters/9bc06a10-a941-4cc8-ae00-e4888a5e9a75 -H "X-Auth-Token: $token" 


######################
####              ####
####   poseidon   ####
####              ####
######################
## trident
# http://psd.fixo.cloud:9511/v1

token=`openstack token issue | grep " id " | awk '{print $4}'`
curl -X GET http://psd.fixo.cloud:9511/v1/clusters/detail -H "X-Auth-Token: $token" | python -m 'json.tool'

curl -X DELETE http://psd.fixo.cloud:9511/v1/clusters/75963a0b-6497-4a45-ae93-a65959d6016b -H "X-Auth-Token: $token" 











CLUSTERTEMPALTE_ID=7ab4056f-c0b0-4a08-a1ec-9801f7a6da0b
USER_TOKEN=$(openstack token issue | grep " id " | awk '{print $4}' | tr -d '[[:space:]]')

curl -X DELETE ${TRIDENT_API_URL}/clusters/${CLUSTERTEMPALTE_ID} \
-H 'accept: application/json' \
-H 'cache-control: no-cache' \
-H 'content-type: application/json' \
-H 'user-agent: None' \
-H "X-Auth-Token: ${USER_TOKEN}"

curl -X POST ${TRIDENT_API_URL}/clusters \
-H 'accept: application/json' \
-H 'cache-control: no-cache' \
-H 'content-type: application/json' \
-H 'postman-token: 0ea42756-2178-a9d2-eab3-2e083d818428' \
-H 'user-agent: None' \
-H "X-Auth-Token: ${USER_TOKEN}" \
-d '{
   "name":"k3spsd-ha2",
   "master_count":3,
   "cluster_template_id":"7bf0a7ab-420c-4693-9045-3331f8b16e6b",   
   "create_timeout":30,
   "fixed_subnet":"1061d937-14b4-46d5-bddf-310854f22fbd",
   "labels":{}
 }'



## PSD
curl -g -i -X GET http://psd.fixo.cloud:9511/v1
curl http://docs.openstack.org/developer/trident/dev/api-spec-v1.html



curl http://cih.fixo.cloud:9522/v1

openstack stack list


openstack stack show testdockerhub0629-mnkfapski27p

http://osapi-fixo-6-lh.fixo.cloud:8004/v1/ad0f82e97b9e4bfb9c2b43c390320654/stacks/testdockerhub0629-mnkfapski27p/5dc3962e-ab77-4622-988d-78b274b18ca0


openstack: 'stack' is not an openstack command. See 'openstack --help'.
Did you mean one of these?
  stack abandon
  stack adopt
  stack cancel
  stack check
  stack create
  stack delete
  stack environment show
  stack event list
  stack event show
  stack export
  stack failures list
  stack file list
  stack hook clear
  stack hook poll
  stack list
  stack output list
  stack output show
  stack resource list
  stack resource mark unhealthy
  stack resource metadata
  stack resource show
  stack resource signal
  stack resume
  stack show
  stack snapshot create
  stack snapshot delete
  stack snapshot list
  stack snapshot restore
  stack snapshot show
  stack suspend
  stack template show
  stack update
  task execution list
  task execution published show
  task execution rerun
  task execution result show
  task execution show

```
