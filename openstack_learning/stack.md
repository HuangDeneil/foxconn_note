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

{
    "clusters": [
        {
            "api_address": "https://deneilk8s-5tuq776kepiv.lh-6.fixo.cloud:6443",
            "cluster_template_id": "88374d04-33d6-4b97-9748-40575db733e9",
            "coe_version": "kubernetes-v1.20",
            "container_version": "1.13.1",
            "create_timeout": 30,
            "created_at": "2023-07-10T00:54:57+00:00",
            "discovery_url": "http://discovery.jadecloud.fixoiaas:2379/v2/keys/discovery/b9c930db2be34bf2b1820b9e9a4d0900",
            "docker_volume_size": 120,
            "flavor_id": "CIS-K8SWORKER-v4m8-Q1",
            "keypair": null,
            "labels": 
            {
                "boot_volume_size": "64",
                "boot_volume_type": "SSD-600",
                "calico_ipv4pool": "172.20.0.0/16",
                "cgroup_driver": "systemd",
                "cloud_provider_tag": "v1.15.2",
                "container_infra_prefix": "chart.fixo.cloud/rke118xx/",
                "containerd_tarball_sha256": "a4a4af4776316833cad5996c66d59f8b4a2af4da716b7902b7a2d5f5ac362dcc",
                "containerd_tarball_url": "http://fibo-fixo-6-lh.fixo.cloud:80/swift/v1/cis-support-component/cri-containerd-cni-1.4.11-linux-amd64.tar.gz",
                "docker_volume_type": "Standard-SSD",
                "fcos_python_package_container_image": "chart.fixo.cloud/rke118xx/python-cis:3.8.12",
                "fimo_agent_tarball_url": "http://fibo-fixo-6-lh.fixo.cloud:80/swift/v1/cis-support-component/fimo_agent.tar",
                "gpu_enabled": "false",
                "heat_container_agent_tag": "wallaby-stable-1",
                "helm_chart_repo_url": "http://chart.fixo.cloud/chartrepo/charts",
                "helm_client_url": "http://fibo-fixo-6-lh.fixo.cloud:80/swift/v1/cis-support-component/helm-client.tar.gz",
                "ingress_controller": "null",
                "kube_dashboard_enabled": "false",
                "kube_prometheus_stack_script_url": "http://fibo-fixo-6-lh.fixo.cloud:80/swift/v1/cis-support-component/kube-prometheus-stack/kube-prometheus-stack-gpu.yaml",
                "kube_tag": "v1.20.14-rancher1",
                "podman_tarball_url": "http://fibo-fixo-6-lh.fixo.cloud:80/swift/v1/cis-support-component/podman.gz",
                "poseidon_cluster_uuid": "aa16c9d9-6128-4e3b-bd9d-549461f95a64",
                "poseidon_endpoint": "https://deneilpsd-gctmuqxxikdf.lh-6.fixo.cloud:443",
                "poseidon_token": "token-mrrz9:vl75v9ddgc8vx94lt8w6q9zx6q9flwlrth7rnddpz896zvmpjcqnqg ",
                "prometheus_operator_crd_url": "http://fibo-fixo-6-lh.fixo.cloud:80/swift/v1/cis-support-component/kube-prometheus-stack/prometheus-operator-0.53.1.tar.gz",
                "selinux_mode": "permissive"
            },
            "links": [
                {
                    "href": "http://osapi-fixo-6-lh.fixo.cloud:9511/v1/clusters/cf9fdb22-7eac-4b23-8ec1-f0a31ccbfad3",
                    "rel": "self"
                },
                {
                    "href": "http://osapi-fixo-6-lh.fixo.cloud:9511/clusters/cf9fdb22-7eac-4b23-8ec1-f0a31ccbfad3",
                    "rel": "bookmark"
                }
            ],
            "master_addresses": [
                "192.168.120.23",
                "192.168.120.22",
                "192.168.120.13"
            ],
            "master_count": 3,
            "master_flavor_id": "CIS-K8SMASTER-v2m4-Q10",
            "name": "deneilk8s",
            "node_addresses": [
                "192.168.120.4",
                "192.168.120.26"
            ],
            "node_count": 2,
            "project_id": "ad0f82e97b9e4bfb9c2b43c390320654",
            "stack_id": "5d65ef52-00e1-43d3-859d-514b7545336c",
            "status": "CREATE_COMPLETE",
            "status_reason": "Stack CREATE completed successfully",
            "updated_at": "2023-07-10T01:11:29+00:00",
            "user_id": "c1d7df5a4e8845a0b5dd89c5e944184e",
            "uuid": "cf9fdb22-7eac-4b23-8ec1-f0a31ccbfad3"
        }
    ]
}


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
