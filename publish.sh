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
testssl:master
testssl:2.6
"

smitty() {
  echo "[INFO] $@"
  eval $@
}

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
