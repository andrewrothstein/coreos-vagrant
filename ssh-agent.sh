#!/usr/bin/env sh
eval `ssh-agent -s`
ssh-add ~/.vagrant.d/insecure_private_key
ssh-add -l
