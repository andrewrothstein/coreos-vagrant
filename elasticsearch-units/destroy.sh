#!/bin/bash

fleetctl stop elasticsearch-discovery@{1,2,3}.service
fleetctl destroy elasticsearch-discovery@{1,2,3}.service
fleetctl stop elasticsearch@{1,2,3}.service
fleetctl destroy elasticsearch@{1,2,3}.service
fleetctl destroy elasticsearch-discovery@.service
fleetctl destroy elasticsearch@.service
