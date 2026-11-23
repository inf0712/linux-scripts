#!/bin/bash

services=("ssh" "docker" "cron")

check_service(){
	service="$1"
	if systemctl is-active --quiet $service; then
		echo "$service : RUNNING"
	else
		echo "$service : NOT RUNNING "
	fi	
}
echo "=====    SERVER-MONITOR     ======"
	for service in "${services[@]}"
	do
			check_service "$service"
	done
echo "==================================="	
