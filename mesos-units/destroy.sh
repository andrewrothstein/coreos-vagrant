#!/bin/bash

fleetctl stop mesos-master.service
fleetctl stop mesos-slave.service
fleetctl destroy mesos-master.service
fleetctl destroy mesos-slave.service

