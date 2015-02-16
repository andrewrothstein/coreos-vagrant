#!/bin/bash
fleetctl submit zookeeper\@.service zookeeper.presence\@.service
fleetctl start zookeeper\@{1,2,3}.service zookeeper.presence\@{1,2,3}.service

