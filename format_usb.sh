#!/bin/bash

# Find USB device path
device_path=$(lsblk -lpo NAME,TYPE,RM | grep '1 disk' | awk '{print $1}' | head -n 1)

# Check if a USB device path is found
if [ -z "$device_path" ]; then
    echo "No USB device found. Exiting..."
    exit 1
fi

echo "Detected USB device at $device_path"

# Confirm with the user before formatting the device
read -p "This will format $device_path. Are you sure you want to continue? (y/n): " confirm
if [ "$confirm" != "y" ]; then
    echo "Operation cancelled. Exiting..."
    exit 0
fi

# Format the device with FAT32 filesystem
echo "Formatting $device_path with FAT32 filesystem..."
sudo mkfs.vfat -F 32 "$device_path"

# Check if formatting was successful
if [ $? -eq 0 ]; then
    echo "Format completed successfully."
else
    echo "Format failed. Please check the device and try again."
    exit 1
fi
