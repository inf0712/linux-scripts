#!/bin/bash

check-svc(){
	state=$(systemctl show $service -p LoadState --value)

	if [[ "$state"="not-found" || -z "$state" ]]; 
	then
		echo "$service is not found"
		exit 1
	fi

	if systemctl is-active --quiet "$service";
then
        echo "Service is running"
else
        echo "Warning! Service is not Running"
fi       
}



echo "========== SERVICE-CHECK =========="

read -p "Enter the Service you want to check: " service
state=$(systemctl show $service -p LoadState --value)
check-svc
