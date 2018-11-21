#!/bin/bash
set -o errexit
set -o nounset

# kuberspay v2.6.0版本
QUAY_URL=quay.io

images=(
coreos/etcd:v3.2.18
coreos/flannel:v0.10.0
coreos/flannel-cni:v0.3.0
calico/kube-controller:v1.0.3
calico/ctl:v1.6.3
calico/node:v2.6.8
calico/cni:v1.11.4
calico/routereflector:v0.4.2
kubernetes-ingress-controller/nginx-ingress-controller:0.17.1
jetstack/cert-manager-controller:v0.4.0

)

for imageName in ${images[@]} ; do
  docker pull $QUAY_URL/$imageName
done
