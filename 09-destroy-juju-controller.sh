#!/bin/bash
# Author: Fatih E. NAR
# 
set -eaux

obnum=`hostname | cut -c 10- -`

juju kill-controller maas-v4n$obnum-controller
