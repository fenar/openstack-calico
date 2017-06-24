#!/bin/bash
#
# Calico Deployment Kick-Starter
# Author:Fatih E. Nar (fenar)
#
model=`juju list-models |awk '{print $1}'|grep calico`

if [[ ${model:0:6} == "calico" ]]; then
	juju switch calico
     	juju deploy calico-newton.yaml
else
	juju add-model calico
	juju switch calico
     	juju deploy calico-newton.yaml
fi

echo "Login to the juju-gui to see status or use juju status"
juju gui --no-browser --show-credentials
