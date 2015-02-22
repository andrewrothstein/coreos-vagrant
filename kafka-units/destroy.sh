#!/bin/bash
fleetctl stop kafka.presence\@{1,2,3}.service
fleetctl destroy kafka.presence\@{1,2,3}.service
fleetctl stop kafka\@{1,2,3}.service
fleetctl destroy kafka\@{1,2,3}.service
fleetctl destroy kafka.presence\@.service
fleetctl destroy kafka\@.service
