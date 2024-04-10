#!/bin/bash

# Update system
echo "Updating system..."
sudo dnf update -y

# Remove unused packages
echo "Removing unused packages..."
sudo dnf autoremove -y

# Clean DNF cache
echo "Cleaning DNF cache..."
sudo dnf clean all

# Remove orphaned packages
echo "Removing orphaned packages..."
sudo dnf remove $(sudo dnf list extras | awk '{print $1}')

# Remove old kernels, keeping the last 2
echo "Removing old kernels, keeping the last 2..."
sudo dnf remove --oldinstallonly --setopt installonly_limit=2 -y

# Clean /tmp and /var/tmp directories
# Warning: This step is commented out by default. Uncomment if you understand the risks.
#echo "Cleaning /tmp and /var/tmp directories..."
#sudo rm -rf /tmp/*
#sudo rm -rf /var/tmp/*

echo "Cleanup completed successfully."

