

## kubectl config 
```bash
--kubeconfig="": use a particular kubeconfig file

## check config content
kubectl config view --kubeconfig="config"

## 
kubectl config get-contexts --kubeconfig="config"



kubectl cluster-info --kubeconfig="config"
┌──(root㉿DESKTOP-95OEUM0)-[/mnt/d/hudeneil/gitlab/CIS]
└─# kubectl cluster-info --kubeconfig="config"
Kubernetes control plane is running at https://deneiltestk8s-hzdnkslel25h.lh-6.fixo.cloud:6443
CoreDNS is running at https://deneiltestk8s-hzdnkslel25h.lh-6.fixo.cloud:6443/api/v1/namespaces/kube-system/services/kube-dns:dns/proxy

To further debug and diagnose cluster problems, use 'kubectl cluster-info dump'.


# kubectl -n kube-system get pod --kubeconfig="config"
┌──(root㉿DESKTOP-95OEUM0)-[/mnt/d/hudeneil/gitlab/CIS]
└─# kubectl -n kube-system get pod --kubeconfig="config"
NAME                                                    READY   STATUS    RESTARTS   AGE  
alertmanager-cis-kube-prometheus-stack-alertmanager-0   2/2     Running   0          4d16h
calico-kube-controllers-b6bd4798b-fmzj9                 1/1     Running   0          4d16h
calico-node-425sx                                       1/1     Running   0          4d16h
calico-node-6ptsw                                       1/1     Running   0          4d16h
calico-node-7lgc5                                       1/1     Running   0          4d16h
calico-node-qxlhj                                       1/1     Running   0          4d16h
calico-node-x5ltm                                       1/1     Running   0          4d16h
cis-kube-prometheus-stack-operator-6d99847c75-bmw97     1/1     Running   0          4d16h
cis-kube-state-metrics-665f9467c8-rsg78                 1/1     Running   0          4d16h
cis-metrics-server-b8d689776-cbp56                      1/1     Running   0          4d16h
cis-node-feature-discovery-master-56cfc98847-qd7kk      1/1     Running   0          4d16h
cis-node-feature-discovery-worker-2fz4d                 1/1     Running   3          4d16h
cis-node-feature-discovery-worker-hp882                 1/1     Running   2          4d16h
cis-prometheus-node-exporter-2fwtb                      1/1     Running   0          4d16h
cis-prometheus-node-exporter-4qcmr                      1/1     Running   0          4d16h
cis-prometheus-node-exporter-jw4j7                      1/1     Running   0          4d16h
cis-prometheus-node-exporter-kq92n                      1/1     Running   0          4d16h
cis-prometheus-node-exporter-v6rxt                      1/1     Running   0          4d16h
coredns-848ccf9c4b-bfgnw                                1/1     Running   0          4d16h
coredns-848ccf9c4b-p4lpq                                1/1     Running   0          4d16h
csi-cinder-controllerplugin-0                           5/5     Running   0          4d16h
csi-cinder-nodeplugin-gzrl2                             2/2     Running   0          4d16h
csi-cinder-nodeplugin-t7tl2                             2/2     Running   0          4d16h
k8s-keystone-auth-l7m2j                                 1/1     Running   0          4d16h
k8s-keystone-auth-lxrlw                                 1/1     Running   0          4d16h
k8s-keystone-auth-zkv2l                                 1/1     Running   0          4d16h
kube-dns-autoscaler-b8c4c754b-4z6hh                     1/1     Running   0          4d16h
npd-5bslz                                               1/1     Running   0          4d16h
npd-cfclc                                               1/1     Running   0          4d16h
openstack-cloud-controller-manager-9gk2k                1/1     Running   6          4d16h
openstack-cloud-controller-manager-dtl2f                1/1     Running   9          4d16h
openstack-cloud-controller-manager-q5v8q                1/1     Running   5          4d16h
prometheus-cis-kube-prometheus-stack-prometheus-0       2/2     Running   0          4d16h


# kubectl cluster-info --kubeconfig="config"
┌──(root㉿DESKTOP-95OEUM0)-[/mnt/d/hudeneil/gitlab/CIS]
└─# kubectl cluster-info --kubeconfig="config"
Kubernetes control plane is running at https://deneiltestk8s-hzdnkslel25h.lh-6.fixo.cloud:6443
CoreDNS is running at https://deneiltestk8s-hzdnkslel25h.lh-6.fixo.cloud:6443/api/v1/namespaces/kube-system/services/kube-dns:dns/proxy

To further debug and diagnose cluster problems, use 'kubectl cluster-info dump'.




kubectl cluster-info dump --kubeconfig="config"

## 
kubectl create clusterrolebinding kube-system-cluster-admin --clusterrole=cluster-admin --serviceaccount=kube-system:default
clusterrolebinding.rbac.authorization.k8s.io/kube-system-cluster-admin created

## 
kubectl get pod --kubeconfig="config"

kubectl get pods -n kube-system --kubeconfig="config"
kubectl get pods --kubeconfig="config"
kubectl get pods --all-namespace --kubeconfig="config"

# create namespace
kubectl create namespace kube-system --kubeconfig="config"



kubectl delete pods -n kube-system  kubernetes-dashboard-5498ccf677-dq2ct
pod "kubernetes-dashboard-5498ccf677-dq2ct" deleted


kubectl proxy --kubeconfig="config" -p 6443 
kubectl proxy --kubeconfig="config" -p 6443 --address='0.0.0.0'

```



# https://deneiltestk8s-hzdnkslel25h.lh-6.fixo.cloud:6443/api/v1/namespaces/kube-system/services/kube-dns:dns/proxy
```json
{
  "kind": "Status",
  "apiVersion": "v1",
  "metadata": {
    
  },
  "status": "Failure",
  "message": "services \"kube-dns:dns\" is forbidden: User \"system:anonymous\" cannot get resource \"services/proxy\" in API group \"\" in the namespace \"kube-system\"",
  "reason": "Forbidden",
  "details": {
    "name": "kube-dns:dns",
    "kind": "services"
  },
  "code": 403
}

```



```bash
## Try try to fix forbidden issue but get 

kubectl create clusterrolebinding cluster-system-anonymous --clusterrole=cluster-admin --user=system:anonymous --kubeconfig="config"
```


# https://deneiltestk8s-hzdnkslel25h.lh-6.fixo.cloud:6443/api/v1/namespaces/kube-system/services/kube-dns:dns/proxy
```json
{
  "kind": "Status",
  "apiVersion": "v1",
  "metadata": {
    
  },
  "status": "Failure",
  "message": "error trying to reach service: EOF",
  "code": 500
}

```


## K8S API
```bash
## token
token=$(kubectl describe secret --kubeconfig="config" $(kubectl get secrets --kubeconfig="config" | grep default | cut -f1 -d ' ') | grep -E '^token' | cut -f2 -d':' | tr -d ' ')

## API url
APIserver=$(kubectl config view --kubeconfig="config" | grep https | cut -f 2- -d ":" | tr -d " ")

curl -X GET $APIserver/api/v1/ --header "Authorization: Bearer $token"  --insecure


curl $APIserver/api/v1/namespaces/default/pods/nginx-75f4785b7-dxp2h \
-H "Authorization: Bearer $token" --insecure

10.134.74.135 deneiltestk8s-hzdnkslel25h.lh-6.fixo.cloud




http://https://deneiltestk8s-hzdnkslel25h.lh-6.fixo.cloud:80/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/
```







## PSD

```bash

https://api-fixo-6-lh.fixo.cloud/api/doc 


curl https://api-fixo-6-lh.fixo.cloud/api/opsk/magnum/poseidon/list


curl -X GET https://api-fixo-6-lh.fixo.cloud/api/opsk/magnum/poseidon/list -H "Content-Type: application/json" -d '{"detail" : True, "projectName" : "deneil.yz.huang@fii-foxconn.com_20230605"}'

curl -X GET https://api-fixo-6-lh.fixo.cloud/api/opsk/magnum/poseidon/list -H "Content-Type: application/json" -d '{"detail" : True, "projectName" : "ad0f82e97b9e4bfb9c2b43c390320654"}'


ad0f82e97b9e4bfb9c2b43c390320654


```


