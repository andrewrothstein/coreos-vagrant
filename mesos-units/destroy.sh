#!/bin/bash

fleetctl stop mesos-master.service
fleetctl destroy mesos-master.service
