user-info(){
	date=&(date)
	runtime=$(uptime)
	username=$(whoami)
	System_name=$(hostname)
	kernel=$(uname)
	kernel_release=$(uname -r)
	current_directory=$(pwd)

	echo "===== DISPLAY SYSTEM INFO ====="

	echo "Date: $date"
	echo "System's Current Uptime: $runtime"
	echo "Current Username: $username"
	echo "System Name: $System_name"
	echo "Kernal Name: $kernel"
	echo "Kernal Release Version: $kernel_release"
	echo "Current Working Directory: $current_directory"

}

disk-view(){
	disk_use=$(df -h /)

	echo "=== CURRENT DISK STATE ==="

	echo "$disk_use"

}

check-svc(){
	if systemctl is-active --quiet "$service";
then
        echo "Service is running"
else
        echo "Warning! Service is not Running"
fi
}

echo "========== USER-DETAILS =========="
user-info
echo "-----------------------------------"

echo "========== USER-DETAILS =========="
disk-view
echo "-----------------------------------"


echo "========== SERVICE-CHECK =========="

read -p "Enter the Service you want to check: " service

check-svc
echo "-------------------------------------"
