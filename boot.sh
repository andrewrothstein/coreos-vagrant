#!/bin/bash

vagrant up
cd skydns-units; ./boot.sh; cd ..
cd zookeeper-units; ./boot.sh; cd ..

