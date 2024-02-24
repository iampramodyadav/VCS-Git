#!/bin/bash

# This script gathers information about the system and saves it to a file.

# Get the hostname.
hostname=$(hostname)

# Get the IP address.
ip_address=$(ip addr show | grep "inet " | awk '{print $2}')

# Get the operating system.
os=$(uname -s)

# Get the kernel version.
kernel_version=$(uname -r)

# Get the CPU architecture.
cpu_architecture=$(uname -m)

# Get the amount of free memory.
free_memory=$(free -h | grep "Mem:" | awk '{print $4}')

# Get the amount of disk space.
disk_space=$(df -h | grep "/" | awk '{print $4}')

# Save the information to a file.
echo "Hostname: $hostname" > system_info.txt
echo "IP Address: $ip_address" >> system_info.txt
echo "Operating System: $os" >> system_info.txt
echo "Kernel Version: $kernel_version" >> system_info.txt
echo "CPU Architecture: $cpu_architecture" >> system_info.txt
echo "Free Memory: $free_memory" >> system_info.txt
echo "Disk Space: $disk_space" >> system_info.txt

# Print a message to the user.
echo "System information has been saved to system_info.txt."