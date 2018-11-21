#kuberspay v2.6.0版本
#!/bin/bash
set -o errexit
set -o nounset
set -o pipefail

elasticsearch_version=v5.6.4
fluentd_version=v2.0.4

GCR_URL=k8s.gcr.io
ANJIA_URL=anjia0532

images=(
elasticsearch:${elasticsearch_version}
fluentd-elasticsearch:${fluentd_version}

)

for imageName in ${images[@]} ; do
  docker pull $ANJIA_URL/$imageName
  docker tag $ANJIA_URL/$imageName $GCR_URL/$imageName
  docker rmi $ANJIA_URL/$imageName
done
