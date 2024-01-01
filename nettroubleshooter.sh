#!/bin/bash

# Network Diagnosis Script

echo "===== Network Diagnosis ====="

# Check Internet connectivity
echo -e "\n[1] Checking Internet connectivity..."
ping -c 4 8.8.8.8
if [ $? -eq 0 ]; then
    echo "Internet is reachable."
else
    echo "Internet is unreachable."
fi

# Check DNS resolution
echo -e "\n[2] Checking DNS resolution..."
ping -c 4 google.com
if [ $? -eq 0 ]; then
    echo "DNS is resolving."
else
    echo "DNS resolution issue."
fi

# Check local network connectivity (replace router's IP)
router_ip="192.168.1.1"
echo -e "\n[3] Checking local network connectivity to the router ($router_ip)..."
ping -c 4 $router_ip
if [ $? -eq 0 ]; then
    echo "Local network connectivity to the router is fine."
else
    echo "Local network connectivity issue to the router."
fi

# Check open ports on a remote server (replace with a remote server IP)
remote_server="example.com"
echo -e "\n[4] Checking open ports on a remote server ($remote_server)..."
nc -zvw 2 $remote_server 80
if [ $? -eq 0 ]; then
    echo "Port 80 is open on the remote server."
else
    echo "Port 80 is closed on the remote server."
fi

# Check if a specific service is running (replace with the service name)
service_name="NetworkManager"
echo -e "\n[5] Checking if $service_name service is running..."
systemctl is-active $service_name
if [ $? -eq 0 ]; then
    echo "$service_name service is running."
else
    echo "$service_name service is not running."
fi

echo 

# Check if any VPN processes are running
vpn_processes=("openvpn" "strongswan" "ikev2" "openconnect" "wireguard" "tinc")
echo -e "\n[6] Checking if $vpn_processes is running..."

for process in "${vpn_processes[@]}"; do
    if pgrep -x "$process" > /dev/null; then
        echo "VPN ($process) is running."
    fi
done

echo

echo -e "\n===== End of Network Diagnosis ====="
echo
