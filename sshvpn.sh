#!/bin/bash
# Script to make VPN over SSH connection to a VPS using sshuttle

# redirect stdout/stderr to a logfile for monitoring
exec &>~/Desktop/logfile.txt

# make connection
sshuttle --dns -r paul@ipaddress  0.0.0.0/0 
