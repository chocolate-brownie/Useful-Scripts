#!/bin/bash

# Get the currently running kernel version
current_kernel=$(uname -r)

# List all installed kernel packages
installed_kernels=$(rpm -qa kernel\*)

# Remove the currently running kernel from the list
# We want to keep this kernel and remove the rest
installed_kernels=$(echo "$installed_kernels" | grep -v "$current_kernel")

# Loop through each installed kernel package and remove it
for kernel_package in $installed_kernels; do
    sudo dnf remove "$kernel_package"
done

# Clean up any leftover dependencies
sudo dnf autoremove

# Update GRUB bootloader configuration
sudo grub2-mkconfig -o /boot/efi/EFI/fedora/grub.cfg

echo "Old kernels have been successfully removed. Please reboot your system for changes to take effect."

