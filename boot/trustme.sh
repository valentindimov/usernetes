#!/bin/bash
# needs to be called inside the namespaces
export U7S_BASE_DIR=$(realpath $(dirname $0)/..)
source $U7S_BASE_DIR/common/common.inc.sh

### TODO why is skopeo's policy file gone?
mkdir -p /etc/containers
echo "{\"default\": [{\"type\": \"insecureAcceptAnything\"}]}" > /etc/containers/policy.json

echo Writing to $XDG_DATA_HOME/usernetes/trustme

mkdir -p $XDG_DATA_HOME/usernetes/trustme
exec trustme --working-dir $XDG_DATA_HOME/usernetes/trustme --cgroup-mode cgroupfs
