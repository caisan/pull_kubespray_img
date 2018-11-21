#!/bin/bash
set -o errexit
set -o nounset

# kuberspay v2.6.0版本
QUAY_URL=quay.io

images=(
coreos/etcd:v3.2.18
coreos/flannel:v0.10.0
coreos/flannel-cni:v0.3.0
calico/kube-controllers:v3.1.3-10-ge896fa9-amd64
calico/ctl:v3.1.3
calico/node:v3.1.3
calico/cni:v3.1.3
calico/routereflector:v0.6.1
external_storage/local-volume-provisioner:v2.1.0
external_storage/cephfs-provisioner:v2.1.0-k8s1.11
kubernetes-ingress-controller/nginx-ingress-controller:0.19.0
jetstack/cert-manager-controller:v0.5.0

)

for imageName in ${images[@]} ; do
  docker pull $QUAY_URL/$imageName
done
