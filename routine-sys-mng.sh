#!/bin/bash

# Script to automate routine system maintenance tasks 

# Update package repositories and upgrade installed packages
echo "Updating package repositories and upgrading installed packages..."
 yum update -y

# Clean up package cache and remove old kernels
echo "Cleaning up package cache and removing old kernels..."
 yum clean all
 package-cleanup --oldkernels --count=1 -y

# Clean up temporary files
echo "Cleaning up temporary files..."
 rm -rf /tmp/*
 rm -rf /var/tmp/*

# Create a backup of important files or directories
echo "Creating backup..."
backup_dir="/root/backup-dir"
source_dir="/var/log/messages"
backup_filename="backup_file$(date +'%Y-%m-%d').tar.gz"
tar -czvf "$backup_dir/$backup_filename" "$source_dir"

echo "Maintenance tasks completed successfully."
