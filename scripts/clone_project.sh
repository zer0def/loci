#!/bin/bash

set -eux

git clone ${PROJECT_REPO} /tmp/${PROJECT}
pushd /tmp/${PROJECT}
git fetch ${PROJECT_REPO} ${PROJECT_REF}
git checkout FETCH_HEAD
for i in $(find "$(dirname "${0}")/../patches/${PROJECT}" -type f); do
  patch -p1 <"${i}"
done
git add .
git -c user.name='zer0def' -c user.email='zer0def@zer0def.0' commit -m 'local corrections' ||:
popd
