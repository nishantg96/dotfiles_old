#! /bin/bash
eth_dev=$(ip --brief address show | awk '$1 ~ /^ *e/ {print$1}')
wlan_dev=$(ip --brief address show | awk '$1 ~ /^ *wl/ {print$1}')

eth_ip=$(ip address show dev $eth_dev | awk '$1 == "inet" {gsub(/\/.*$/, "", $2); print $2}')
wlan_ip=$(ip address show dev $wlan_dev | awk '$1 == "inet" {gsub(/\/.*$/, "", $2); print $2}')
notify-send -u normal "ETH : $eth_ip 
WLAN : $wlan_ip"