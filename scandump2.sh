#!/bin/bash

#scandump2.sh
#Get information About a Host and Network and Dump to file

# Find local IP from ifconfig.
localIP=($(sudo ifconfig | grep "inet " | awk '{print $2}' | awk 'END{print}' ))

# Add wildcard.
startIP=`echo $localIP | cut -d "." -f1-3`
searchIP=`echo "$startIP.*"`
echo "Search IP is: $searchIP"
sleep 1

# Read user input for nmap scan
read -p '[ ? ] Enter Search IP or range: ' ip
read -p '[ ? ] Save results as: ' file
echo "[ i ] Results will be saved as $file.txt"
echo "[ i ] Scanning the IP $ip..."
nmap $ip -v0 -sV -n -oN $file.txt
echo "[ i ] Scan complete. Showing results..."
sleep 1
echo >> $file.txt 

# Quick netstat scan on host                               
echo "Now showing active connections on host" >> $file.txt
echo >> $file.txt 
netstat -plunt >> $file.txt
sleep 1
cat "$file.txt"
exit 0
