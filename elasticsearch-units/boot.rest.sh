#!/bin/bash

fleetctl start elasticsearch-discovery@{2,3}.service
fleetctl start elasticsearch@{2,3}.service
