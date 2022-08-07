#!/bin/bash
ip_address=($(sudo cat /var/log/auth.log | grep "Invalid user\|closed\|error\|inavlid" | awk '{print $10}'))
month=($(sudo cat /var/log/auth.log | grep "Invalid user\|closed\|error\|inavlid" | awk '{print $1}'))
day=($(sudo cat /var/log/auth.log | grep "Invalid user\|closed\|error\|inavlid" | awk '{print $2}')) 

ips_list=()
month_list=()
day_list=()

for ip in $ip_address; do
        ips_list+=($ip)
done

for date in ${month}; do
        month_list+=($date)
done
for date in ${day}; do
        day_list+=($date)
done

countries=()
for ip in ${ip_address}; do
        country=$(curl ipinfo.io/$ip/country)
        countries+=($country)
        echo ${country}
done

for ip in ${!countries[@]}; do
        echo "${ips_list[$ip]} ${countries[$ip]} ${month_list[$ip]} ${day_list[$ip]}" >> /var/webserver_log/unauthorized.log
done
