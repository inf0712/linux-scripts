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

