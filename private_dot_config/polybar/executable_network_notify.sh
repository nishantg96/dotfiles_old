#! /bin/bash

eth_ip=$(ip address show dev enx6ca936e5599c| awk '/inet/ {print $2}' | grep -v ^::1 | grep -v ^127)
wlan_ip=$(ip address show dev wlp0s20f3| awk '/inet/ {print $2}' | grep -v ^::1 | grep -v ^127)
notify-send -u normal "ETH : 
$eth_ip

WLAN :
$wlan_ip"