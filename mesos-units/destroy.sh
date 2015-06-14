#!/bin/bash

fleetctl stop mesos-master\@1.service
fleetctl destroy mesos-master\@1.service

#fleetctl stop mesos-master\@{1,2,3}.service
#fleetctl stop mesos-slave.service
#fleetctl destroy mesos-master\@{1,2,3}.service
#fleetctl destroy mesos-slave.service
fleetctl destroy mesos-master\@.service
