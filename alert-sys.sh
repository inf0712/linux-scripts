#!/bin/bash

read -p "Enter the current CPU utilisation: " cpu
read -p "Enter the current Memory utilisation: " mem
read -p "Enter the current Disk utilisation: " disk

if [ "$cpu" -le 50 ]; then
       echo "CPU Utilisation is Normal"
elif [ "$cpu" -gt 50 ] && [ "$cpu" -le  80 ]; then
	echo "WARNING! CPU utilization is above 50 "
else	
	echo "CRITICAL! CPU usage above 80%"
	echo "Current use - $cpu"
fi

echo "============================"


if [ "$mem" -le 50 ]; then
       echo "Memory Utilisation is Normal"
elif [ "$mem" -gt 50 ] && [ "$mem" -le  80 ]; then
        echo "WARNING! Memory utilization is above 50"
else
        echo "CRITICAL! Memory usage above 80%"
        echo "Current use - $mem"
fi

echo "============================"


if [ "$disk" -le 50 ]; then
       echo "Disk Utilisation is Normal"
elif [ "$disk" -gt 50 ] && [ "$disk" -le  80 ]; then
        echo "WARNING! Disk utilization is above 50 "
else
        echo "CRITICAL! Disk usage above 80%"
        echo "Current use - $disk"
fi

echo "============================"

