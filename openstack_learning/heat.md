


```bash

export DOCKER_IMAGE_OFFLINE_INSTALL_URL=http://fibo-dct-tb.fixo.cloud/swift/v1/cis_update_file_tmp/FiXo_v4.10.1.0.tar.tgz_File_lists.txt
export TIMEOUT=90
## flavor spec
export REGISTRY_SERVER_FLAVOR_VCPU=4
export REGISTRY_SERVER_FLAVOR_RAM=8192
export REGISTRY_SERVER_FLAVOR_QOS_LV=40
## boot volume spec
export REGISTRY_SERVER_VOLUME_TYPE=Ultra-Perf-SSD
export REGISTRY_SERVER_VOLUME_SIZE=128

######## 
######## 
######## 

REGISTRY_SERVER_INDEX=${REGISTRY_SERVER_INDEX:-'0'}
REGISTRY_SERVER_FLAVOR_UUID="2942cab5-4435-4fd9-88a9-51bcc708cb6a"

REGISTRY_SERVER_NAME="MJC-DOCKER-IMAGE-IMPORT-SERVER"
REGISTRY_SERVER_FLAVOR="MJC-IAASPLUS-REGISTRY"

REGISTRY_SERVER_INDEX=${REGISTRY_SERVER_INDEX:-'0'}
#REGISTRY_SERVER_NET_ID=${REGISTRY_SERVER_NET_ID:-'API_network'}
REGISTRY_SERVER_VOLUME_TYPE=${REGISTRY_SERVER_VOLUME_TYPE:-'Ultra-Perf-SSD'}
REGISTRY_SERVER_VOLUME_SIZE=${REGISTRY_SERVER_VOLUME_SIZE:-'128'}
REGISTRY_SERVER_IMAGE_CHECKSUM=${REGISTRY_SERVER_IMAGE_CHECKSUM:-'81233581c63e3cbb912fd9c3282b899a'}
REMOTE_HARBOR_ENDPOINT=${REMOTE_HARBOR_ENDPOINT:-''}
REMOTE_HARBOR_USER=${REMOTE_HARBOR_USER:-'admin'}
REMOTE_HARBOR_PW=${REMOTE_HARBOR_PW:-'1qa2ws3ed'}

INSTANCE_UUID=$(openstack server list -f json |  jq -r '.[-1].ID')
REGISTRY_SERVER_NET_ID=$(openstack port show $(openstack port list --device-id $INSTANCE_UUID -f value -c ID) -f value -c network_id)

DOCKER_IMAGE_OFFLINE_INSTALL_URL=${DOCKER_IMAGE_OFFLINE_INSTALL_URL:-'http://fibo-dct-tb.fixo.cloud/swift/v1/fixopackage/upgrade/v4.10.1.0/FiXo_v4.10.1.0.tar.tgz_File_lists.txt'}
HEAT_CONTAINER_AGENT_TARBALL_URL=${HEAT_CONTAINER_AGENT_TARBALL_URL:-''}

REGISTRY_SERVER_FLAVOR_UUID="2942cab5-4435-4fd9-88a9-51bcc708cb6a"
REGISTRY_SERVER_FLAVOR_VCPU=${REGISTRY_SERVER_FLAVOR_VCPU:-'4'}
REGISTRY_SERVER_FLAVOR_RAM=${REGISTRY_SERVER_FLAVOR_RAM:-'8192'}
REGISTRY_SERVER_FLAVOR_QOS_LV=${REGISTRY_SERVER_FLAVOR_QOS_LV:-'40'}

REGISTRY_SERVER_IMAGE=$(openstack image list --long --property os_distro=centos8-hbr | grep ${REGISTRY_SERVER_IMAGE_CHECKSUM} |  awk '{print $2}' | tr -d '[[:space:]]')

if [ -z "$REMOTE_HARBOR_ENDPOINT" ]; then
  echo "REMOTE_HARBOR_ENDPOINT is empty."
  USER_TOKEN=$(openstack token issue | grep " id " | awk '{print $4}' | tr -d '[[:space:]]')
  MAGNUM_API_URL=$(openstack endpoint list --interface public --service container-infra  -f value -c URL)
  CLUSTER_TEMPLATE_UUID=kubernetes-v1.18
  CLUSTER_TEMPLATE_JSON_BODY=$(curl -X GET ${MAGNUM_API_URL}/v1/clustertemplates/${CLUSTER_TEMPLATE_UUID} \
  -H "X-Auth-Token: ${USER_TOKEN}" \
  -H "Content-Type: application/json" \
  -H "Accept: application/json" \
  -H "User-Agent: None" )
  helm_chart_repo_url=$(echo "$CLUSTER_TEMPLATE_JSON_BODY" | jq -r '.labels.helm_chart_repo_url')
  protocol=$(echo "$helm_chart_repo_url" | awk -F[/] '{print $1}'| awk -F[:] '{print $1}')
  domain=$(echo "$helm_chart_repo_url" | awk -F[/] '{print $3}')
  REMOTE_HARBOR_ENDPOINT=${protocol}://${domain}
else
  echo "REMOTE_HARBOR_ENDPOINT is not empty. Value: $REMOTE_HARBOR_ENDPOINT"
fi




openstack stack create \
--template /tmp/002_mjc_push_image_to_remote_harbor.yaml \
--parameter master_index=$REGISTRY_SERVER_INDEX \
--parameter flavor_name=$REGISTRY_SERVER_FLAVOR_UUID \
--parameter network_id=$REGISTRY_SERVER_NET_ID \
--parameter volume_type=$REGISTRY_SERVER_VOLUME_TYPE \
--parameter volume_size=$REGISTRY_SERVER_VOLUME_SIZE \
--parameter server_image=$REGISTRY_SERVER_IMAGE \
--parameter heat_container_agent_tarball=$HEAT_CONTAINER_AGENT_TARBALL_URL \
--parameter docker_image_offline_install_url=$DOCKER_IMAGE_OFFLINE_INSTALL_URL \
--parameter specific_dns_server=$SPECIFIC_DNS_SERVER \
--parameter remote_harbor_endpoint=$REMOTE_HARBOR_ENDPOINT \
--parameter remote_harbor_user=$REMOTE_HARBOR_USER \
--parameter remote_harbor_pw=$REMOTE_HARBOR_PW \
--timeout $TIMEOUT \
$REGISTRY_SERVER_NAME-$REGISTRY_SERVER_INDEX --wait



```


