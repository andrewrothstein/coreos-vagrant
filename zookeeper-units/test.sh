#!/bin/bash -x

ENV=drewfus
CLUSTER=dev

echo "check that the zookeeper myids are set correctly"
fleetctl ssh zookeeper\@1.service docker exec -ti zookeeper-1 cat /zk-data/myid
fleetctl ssh zookeeper\@2.service docker exec -ti zookeeper-2 cat /zk-data/myid
fleetctl ssh zookeeper\@3.service docker exec -ti zookeeper-3 cat /zk-data/myid

echo "what's in etcd?"
etcdctl ls /skydns/local/${ENV}/${CLUSTER}/ --recursive 
etcdctl get /skydns/local/${ENV}/${CLUSTER}/zookeeper-1

echo "checking DNS resolution for zookeeper-%i from a separate container on host zookeeper@.%i..."
fleetctl ssh zookeeper@1.service docker run -ti --dns=172.17.8.101 andrewrothstein/docker-dnsutils dig zookeeper-1
fleetctl ssh zookeeper@2.service docker run -ti --dns=172.17.8.102 andrewrothstein/docker-dnsutils dig zookeeper-2
fleetctl ssh zookeeper@3.service docker run -ti --dns=172.17.8.103 andrewrothstein/docker-dnsutils dig zookeeper-3

