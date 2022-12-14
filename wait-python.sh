#!/usr/bin/env bash


pip install dse-driver==2.11.1 >/dev/null 2>&1

clear

echo -n 'Installing DSE driver ...'; 
timeout 60 bash -c 'until pip show dse-driver >/dev/null 2>&1; do sleep 2; echo -n "."; done'; 
sleep 2
echo ' DONE!'
echo "DSE driver successfully installed."

echo ""

