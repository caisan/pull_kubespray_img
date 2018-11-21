#!/bin/bash
set -o errexit
set -o nounset
set -o pipefail

# kuberspay v2.6.0版本

kube_version=v1.10.3
dns_version=1.14.10
pod_infra_version=3.0
kubednsautoscaler_version=1.1.2
dnsmasqautoscaler_version=1.1.2
ingress_nginx_default_backend_image_tag=1.4

GCR_URL=gcr.io/google_containers
ANJIA_URL=anjia0532

images=(
hyperkube:${kube_version}
pause-amd64:${pod_infra_version}
k8s-dns-kube-dns-amd64:${dns_version}
k8s-dns-dnsmasq-nanny-amd64:${dns_version}
k8s-dns-sidecar-amd64:${dns_version}
cluster-proportional-autoscaler-amd64:${dnsmasqautoscaler_version}
cluster-proportional-autoscaler-amd64:${kubednsautoscaler_version}
defaultbackend:${ingress_nginx_default_backend_image_tag}
)
for imageName in ${images[@]} ; do
  docker pull $ANJIA_URL/$imageName
  docker tag $ANJIA_URL/$imageName $GCR_URL/$imageName
  docker rmi $ANJIA_URL/$imageName
done

