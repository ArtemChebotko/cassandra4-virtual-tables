#!/usr/bin/env bash

clear

echo -n 'Starting a CQL shell ...'; 
timeout 120 bash -c 'until cqlsh -e "describe cluster" >/dev/null 2>&1; do sleep 2; echo -n "."; done'; 
sleep 2
echo ' DONE!'
echo "CQL shell successfully started."

echo ""

cqlsh
