#!/bin/bash

ENV=drewfus
CLUSTER=dev

echo confirm that each instance knows its own id from within its container...
echo $(fleetctl ssh zookeeper\@1.service docker exec -ti zookeeper-1 cat /zk-data/myid)
echo $(fleetctl ssh zookeeper\@2.service docker exec -ti zookeeper-2 cat /zk-data/myid)
echo $(fleetctl ssh zookeeper\@3.service docker exec -ti zookeeper-3 cat /zk-data/myid)

echo the ${ENV}.${CLUSTER} cluster in skydns:
etcdctl ls /skydns/local/${ENV}/${CLUSTER}/ --recursive 
echo
echo ${ENV}.${CLUSTER}/zookeeper-1 in skydns:
etcdctl get /skydns/local/${ENV}/${CLUSTER}/zookeeper-1

echo "checking DNS resolution for zookeeper-%i from a separate container on host zookeeper@.%i..."
fleetctl ssh zookeeper@1.service docker run -ti --dns=172.17.8.101 andrewrothstein/docker-dnsutils dig zookeeper-1
fleetctl ssh zookeeper@2.service docker run -ti --dns=172.17.8.102 andrewrothstein/docker-dnsutils dig zookeeper-2
fleetctl ssh zookeeper@3.service docker run -ti --dns=172.17.8.103 andrewrothstein/docker-dnsutils dig zookeeper-3

