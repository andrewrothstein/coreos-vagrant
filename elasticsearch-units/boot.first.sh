#!/bin/bash

fleetctl submit elasticsearch@.service elasticsearch-discovery@.service
fleetctl start elasticsearch-discovery@1.service
fleetctl start elasticsearch@1.service
