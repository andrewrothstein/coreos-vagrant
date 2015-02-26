#!/bin/bash

fleetctl submit elasticsearch@.service elasticsearch.presence@.service
fleetctl start elasticsearch.presence@1.service
fleetctl start elasticsearch@1.service
