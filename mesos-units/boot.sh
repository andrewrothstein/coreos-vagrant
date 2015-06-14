#!/bin/bash

fleetctl submit mesos-master\@.service
fleetctl start mesos-master\@1.service
#fleetctl submit mesos-master\@.service mesos-slave.service
#fleetctl start mesos-master\@{1,2,3}.service mesos-slave.service
