#!/bin/bash
set -o errexit
set -o nounset
set -o pipefail

# kuberspay v2.6.0版本

#kube_version=v1.11.3
kubedns_version=1.14.10
pod_infra_version=3.1
coredns_version=1.1.3
kubednsautoscaler_version=1.1.2
dnsmasqautoscaler_version=1.1.2
ingress_nginx_default_backend_image_tag=1.4
registry_proxy_image_tag=0.4


GCR_URL=gcr.io/google_containers
ANJIA_URL=anjia0532

#for helm tiller
docker pull anjia0532/tiller:v2.9.1
docker tag anjia0532/tiller:v2.9.1 gcr.io/kubernetes-helm/tiller:v2.9.1
#for hyperkube
docker pull anjia0532/google-containers.hyperkube-amd64:v1.11.3
docker tag anjia0532/google-containers.hyperkube-amd64:v1.11.3 gcr.io/google_containers/hyperkube-amd64:v1.11.3

images=(
pause-amd64:${pod_infra_version}
k8s-dns-kube-dns-amd64:${kubedns_version}
coredns:${coredns_version}
k8s-dns-dnsmasq-nanny-amd64:${kubedns_version}
k8s-dns-sidecar-amd64:${kubedns_version}
cluster-proportional-autoscaler-amd64:${dnsmasqautoscaler_version}
cluster-proportional-autoscaler-amd64:${kubednsautoscaler_version}
kube-registry-proxy:${registry_proxy_image_tag}
defaultbackend:${ingress_nginx_default_backend_image_tag}
)

for imageName in ${images[@]} ; do
  docker pull $ANJIA_URL/$imageName
  docker tag $ANJIA_URL/$imageName $GCR_URL/$imageName
  docker rmi $ANJIA_URL/$imageName
done

