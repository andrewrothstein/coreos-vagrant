#!/bin/bash

vagrant up
source ./env.sh
cd baseconfig-units; ./boot.sh; cd ..
cd skydns-units; ./boot.sh; cd ..
cd zookeeper-units; ./boot.sh; cd ..
cd mesos-units; ./boot.sh; cd ..
cd kafka-units; ./boot.sh; cd ..

