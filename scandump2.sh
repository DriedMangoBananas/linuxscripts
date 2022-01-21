

#scandump2.sh
#Quick information About a Host and Network and Dump to file


# Find local IP from ifconfig.
localIP=($(sudo ifconfig | grep "inet " | awk '{print $2}' | awk 'END{print}' ))

# Add wildcards.
startIP=`echo $localIP | cut -d "." -f1-3`
searchIP=`echo "$startIP.*"`
echo "Search IP is: $searchIP"
sleep 1

# Prompt and run nmap scan on IP or range
read -p '[ ? ] Enter Search IP or range: ' ip
read -p '[ ? ] Save results as: ' file
echo "[ i ] Results will be saved as $file.txt"
echo "[ i ] Nmap run as sudo to scan the IP $ip..."
nmap $ip -v0 -sV -n -oN $file.txt
echo "[ i ] Scan complete. Showing results..."
sleep 1
echo                                  
echo "[ i ] Now showing acive connections on host"
echo 

# Run netstat on host for more information
netstat -plunt >> $file.txt
sleep 1
cat "$file.txt"
exit 0
