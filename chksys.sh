#!/bin/bash

# chksys -- Simple script to check on system resources.

clear

echo "Linux Version"
uname -a 
echo "        "

echo "Memory Usage:"
/usr/bin/free -h

echo $'\n'$"Disk Usage:"
/bin/df -h 

echo $'\n'$"Uptime:"
/usr/bin/uptime

exit