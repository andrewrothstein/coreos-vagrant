#!/bin/bash

fleetctl stop elasticsearch.presence@{1,2,3}.service
fleetctl destroy elasticsearch.presence@{1,2,3}.service
fleetctl stop elasticsearch@{1,2,3}.service
fleetctl destroy elasticsearch@{1,2,3}.service
fleetctl destroy elasticsearch.presence@.service
fleetctl destroy elasticsearch@.service
