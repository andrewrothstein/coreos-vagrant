#!/bin/bash

fleetctl start elasticsearch.presence@{2,3}.service
fleetctl start elasticsearch@{2,3}.service
