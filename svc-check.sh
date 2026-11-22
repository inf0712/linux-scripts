#!/bin/bash

echo "========== SERVICE-CHECK =========="

read -p "Enter the Service you want to check: " service

if systemctl is-active --quiet "$service"; 
then
	echo "Service is running"
else
	echo "Warning! Service is not Running"
fi
