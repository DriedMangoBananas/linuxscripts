

#scandump2.sh
#Get information About a Host and Network and Dump to file


# Find local IP from ifconfig.
localIP=($(sudo ifconfig | grep "inet " | awk '{print $2}' | awk 'END{print}' ))

# Add wildscard.
startIP=`echo $localIP | cut -d "." -f1-3`
searchIP=`echo "$startIP.*"`
echo "Search IP is: $searchIP"
sleep 1

read -p '[ ? ] Enter Search IP: ' ip
read -p '[ ? ] Save results as: ' file
echo "[ i ] Results will be saved as $file.txt"
echo "[ i ] Nmap will ask for sudo then scan the IP $ip..."
nmap $ip -v0 -sV -n -oN $file.txt
echo [ ✔ ] Scan complete. Showing results...
sleep 1
echo                                  
echo Now showing acive connections on host 
echo 
netstat -plunt >> $file.txt
sleep 1
cat "$file.txt"
exit 0
