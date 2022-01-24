#!/bin/bash
# Script to make VPN over SSH connection to a VPS using sshuttle

# redirect stdout/stderr to a logfile for monitoring connections
exec &>>~/Desktop/logfile.txt

# Record date of connection
date

# make connection
sshuttle --dns -r paul@ipaddress  0.0.0.0/0 
