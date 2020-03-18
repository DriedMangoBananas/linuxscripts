#!/bin/bash

# chksys -- Simple script to check on system resources.

clear

echo $'\n'$"Linux Version"
uname -srvo 

echo $'\n'$"Memory Usage:"
/usr/bin/free -h

echo $'\n'$"Disk Usage:"
/bin/df -h 

echo $'\n'$"Uptime:"
/usr/bin/uptime

exit