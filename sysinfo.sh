#!/bin/bash

# sysinfo -- Simple script to check system info.

clear

echo -e $'\n'$"\e[0;32mVersion \e[0m"
uname -srvo 

echo -e $'\n'$"\e[0;32mPublicIP \e[0m"
curl ifconfig.me

echo -e $'\n'$"\e[0;32mMemory \e[0m"
/usr/bin/free -h

echo -e $'\n'$"\e[0;32mDisk \e[0m"
/bin/df -h /dev/sd[a-z][1-9] 2>/dev/null

echo -e $'\n'$"\e[0;32mUptime \e[0m"
/usr/bin/uptime

echo -e $'\n'$"\e[0;32mPower \e[0m"
acpi -bat

exit