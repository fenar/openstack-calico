#!/bin/bash
# Author: Fatih E. Nar (fenar)
# Destroy Calico
#
set -ex
model=`juju list-models |awk '{print $1}'|grep calico`
if [[ ${model:0:6} == "calico" ]]; then
     echo "Model:Calico Found -> Destroy in Progress!"
     juju destroy-model "calico" -y
else
     echo "Model:Calico NOT Found!"
fi
