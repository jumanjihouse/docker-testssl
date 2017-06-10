#!/bin/bash
# vim: set sw=2 ts=2 ai et:
set -e

if [[ $# -lt 1 ]]; then
  echo "ERR: you must pass 1 or more tags as arguments" >&2
  exit 1
fi

suffixes=$@

# The names of the images as built.
build_tags="
testssl:2.8
testssl:2.9dev
"

smitty() {
  echo "[INFO] $@"
  eval $@
}

docker login -e ${mail} -u ${user} -p ${pass} quay.io

for build_tag in ${build_tags}; do
  echo "===== ${build_tag} ====="
  for suffix in ${suffixes}; do
    echo "-- ${suffix}"

    new_name="quay.io/jumanjiman/${build_tag}-${suffix}"

    # Create a new tag.
    smitty docker tag -f ${build_tag} ${new_name}

    # Publish the tagged image.
    smitty docker push ${new_name}
    echo
    echo
  done
done

smitty docker tag -f testssl:2.8 quay.io/jumanjiman/testssl:latest
smitty docker push quay.io/jumanjiman/testssl:latest

docker logout quay.io
