#!/bin/bash

# Prompt the user to enter the device path (e.g., /dev/sdb1)
read -p "Enter the device path (e.g., /dev/sdb1): " device_path

# Check if the device path is provided
if [ -z "$device_path" ]; then
    echo "Device path is not provided. Exiting..."
    exit 1
fi

# Check if the device exists
if ! [ -b "$device_path" ]; then
    echo "Device does not exist. Exiting..."
    exit 1
fi

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
fi

