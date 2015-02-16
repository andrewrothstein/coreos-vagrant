#!/bin/bash
fleetctl stop zookeeper.presence\@{1,2,3}.service
fleetctl stop zookeeper\@{1,2,3}.service
fleetctl destroy zookeeper.presence\@.service
fleetctl destroy zookeeper\@.service
