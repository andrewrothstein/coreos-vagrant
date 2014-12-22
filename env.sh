#!/usr/bin/env sh
# connect etcdctl to the etcd quorum across the three VMs
export ETCDCTL_PEERS=172.17.8.101:4001,172.17.8.102:4001,172.8.103:4001
etcdctl ls /

# connect fleetctl to the fleet across the three VMs
export FLEETCTL_TUNNEL=172.17.8.101
fleetctl list-machines
