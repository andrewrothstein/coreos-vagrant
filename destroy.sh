#!/bin/bash

echo shutting down zookeeper...
zookeeper-units/destroy.sh

echo shutting down skydns...
skydns-units/destroy.sh

vagrant destroy -f
rm -f ~/.fleetctl/known_hosts
