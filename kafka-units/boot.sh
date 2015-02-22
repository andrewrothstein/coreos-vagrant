#!/bin/bash
fleetctl submit kafka\@.service kafka.presence\@.service
fleetctl start kafka\@{1,2,3}.service kafka.presence\@{1,2,3}.service

