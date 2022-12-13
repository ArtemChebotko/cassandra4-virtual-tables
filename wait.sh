#!/usr/bin/env bash

clear
echo " ██████╗  █████╗ ████████╗ █████╗ ███████╗████████╗ █████╗ ██╗  ██╗ "
echo " ██╔══██╗██╔══██╗╚══██╔══╝██╔══██╗██╔════╝╚══██╔══╝██╔══██╗╚██╗██╔╝ "
echo " ██║  ██║███████║   ██║   ███████║███████╗   ██║   ███████║ ╚███╔╝  "
echo " ██║  ██║██╔══██║   ██║   ██╔══██║╚════██║   ██║   ██╔══██║ ██╔██╗  "
echo " ██████╔╝██║  ██║   ██║   ██║  ██║███████║   ██║   ██║  ██║██╔╝ ██╗ "
echo " ╚═════╝ ╚═╝  ╚═╝   ╚═╝   ╚═╝  ╚═╝╚══════╝   ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝ "
echo ""

#echo -n 'Preparing your environment ...'; 
#timeout 60 bash -c 'until cqlsh -e "describe cluster" >/dev/null 2>&1; do sleep 2; echo -n "."; done'; 
#echo ' done!'

#echo "Choose Astra DB or Cassandra on the left panel to start."

echo -n 'Starting a Cassandra cluster ...'; 
timeout 60 bash -c 'until cqlsh localhost 9042 -e "describe cluster" >/dev/null 2>&1; do sleep 1; echo -n "."; done'
#sleep 2
timeout 60 bash -c 'until cqlsh localhost 9043 -e "describe cluster" >/dev/null 2>&1; do sleep 1; echo -n "."; done'
#sleep 2
#timeout 60 bash -c 'until ( cqlsh localhost 9042 -e "select count(*) as peers from system.peers;" | grep "(1 rows)" ) >/dev/null 2>&1; do sleep 1; echo -n "."; done'
#sleep 2

timeout 60 bash -c 'dc_count=0; until [ $dc_count -eq 2 ] >/dev/null 2>&1; do sleep 1; dc_count=$( docker exec -i -t Cassandra-1 bash -c "nodetool status" | grep -e "Datacenter" -c ); echo -n "."; done'

echo ' DONE!'
echo "Cassandra successfully started."

echo ""

sleep 2



      
