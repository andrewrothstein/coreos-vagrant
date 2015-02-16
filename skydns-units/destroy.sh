#!/bin/bash
fleetctl stop skydns.service
fleetctl destroy skydns.service
etcdctl rm --recursive /skydns
