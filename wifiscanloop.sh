#!/bin/bash
for (( ; ; ))
do
   sed -n 3p /proc/net/wireless  && sleep 1
done
