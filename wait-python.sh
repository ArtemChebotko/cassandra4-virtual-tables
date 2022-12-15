#!/usr/bin/env bash


pip install cassandra-driver >/dev/null 2>&1 &

clear

echo -n 'Installing a Cassandra driver ...'; 
timeout 300 bash -c 'until pip show cassandra-driver >/dev/null 2>&1; do sleep 2; echo -n "."; done'; 
sleep 2
echo ' DONE!'
echo "Cassandra driver successfully installed."

echo ""

