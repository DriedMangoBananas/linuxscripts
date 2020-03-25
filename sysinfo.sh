#!/bin/bash

# sysinfo -- Simple script to check system info.

clear

echo -e $'\n'$"\e[0;32mVersion \e[0m"
uname -srvo 

echo -e $'\n'$"\e[0;32mPublicIP and PrivateIP \e[0m"
curl ifconfig.me; echo " "; myip=
while IFS=$': \t' read -a line ;do
    [ -z "${line%inet}" ] && ip=${line[${#line[1]}>4?1:2]} &&
        [ "${ip#127.0.0.1}" ] && myip=$ip
  done< <(LANG=C /sbin/ifconfig);echo $myip

echo -e $'\n'$"\e[0;32mMemory Usage \e[0m"
/usr/bin/free -h 

echo -e $'\n'$"\e[0;32mDisk Usage \e[0m"
/bin/df -h /dev/sd[a-z][1-9] 2>/dev/null

echo -e $'\n'$"\e[0;32mUptime \e[0m"
/usr/bin/uptime

echo -e $'\n'$"\e[0;32mPower \e[0m"
acpi -bat

exit