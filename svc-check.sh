#!/bin/bash

echo "========== DOCKER-CHECK =========="

if systemctl is-active --quiet docker 
then
	echo "Docker is running"
else
	echo "Warning! Docker is not Running"
fi

echo "========== SSH-CHECK =========="

if systemctl is-active --quiet ssh;
then
	echo "SSH is running"
else
	echo "SSH is currently not Running"
fi
