#!/bin/bash
set -x

SE_VERSION="4.38"
SE_REVISION="9760"

BASE_TAGS="latest centos debian alpine ubuntu"

for TAG in ${BASE_TAGS}; do
  docker pull wanrenzhizun/softether:${TAG}
  VERSION_TAG=${SE_VERSION}-${TAG}
  REVISION_TAG=${SE_REVISION}-${TAG}
  docker tag wanrenzhizun/softether:${TAG} siomiz/softethervpn:${VERSION_TAG%-latest}
  docker tag wanrenzhizun/softether:${TAG} siomiz/softethervpn:${REVISION_TAG%-latest}
  docker push wanrenzhizun/softether:${VERSION_TAG%-latest}
  docker push wanrenzhizun/softether:${REVISION_TAG%-latest}
done
