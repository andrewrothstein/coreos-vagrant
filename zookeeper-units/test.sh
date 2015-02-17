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
fleetctl ssh zookeeper@1.service docker run -ti --dns=172.17.8.101 --dns-search=${CLUSTER}.${ENV}.local andrewrothstein/docker-dnsutils dig zookeeper-1.${CLUSTER}.${ENV}.local
fleetctl ssh zookeeper@2.service docker run -ti --dns=172.17.8.102 --dns-search=${CLUSTER}.${ENV}.local andrewrothstein/docker-dnsutils dig zookeeper-2.${CLUSTER}.${ENV}.local
fleetctl ssh zookeeper@3.service docker run -ti --dns=172.17.8.103 --dns-search=${CLUSTER}.${ENV}.local andrewrothstein/docker-dnsutils dig zookeeper-3.${CLUSTER}.${ENV}.local

