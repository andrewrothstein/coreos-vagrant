#!/bin/bash

fleetctl submit mesos-master.service mesos-slave.service
fleetctl start mesos-master.service mesos-slave.service
