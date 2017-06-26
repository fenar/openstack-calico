#!/bin/bash
# Author: Fatih E. NAR
# 
set -x
export v4num=${HOSTNAME:9}

addr=`juju run --unit nova-compute/0 'ip addr show br-eth0 | grep inet'`

ipaddr=${addr:9:13}

NEUTRON_FIXED_NET_CIDR="192.168.$((v4num)).0/24"

echo "NOVA-COMPUTE Address: ${ipaddr}"

sudo route add -net $NEUTRON_FIXED_NET_CIDR gw ${ipaddr}
