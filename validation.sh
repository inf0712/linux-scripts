#!/bin/bash

read -p "Enter the service name: " service

if [[ -z $service ]]; then
	echo "Service name cannot be empty"
else 
	if systemctl is-active --quiet $service; then
		echo "$service is running"
	else
		echo "$service is disabled"
	fi
fi
