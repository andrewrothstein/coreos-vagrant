#!/bin/bash
echo shutting down mesos...
cd mesos-units; ./destroy.sh; cd ..

echo shutting down zookeeper...
cd zookeeper-units; ./destroy.sh; cd ..

echo shutting down skydns...
cd skydns-units; ./destroy.sh; cd ..

vagrant destroy -f
rm -f ~/.fleetctl/known_hosts
