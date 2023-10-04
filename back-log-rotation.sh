#!/bin/bash

# Automated Backup, Log Rotation, and Software Update 

# Directory paths
source_dir="/var/log/secure"
backup_dir="/root/backup-dir"
log_dir="/var/log/maillogs"

# Backup files (replace /path/to/source with the actual source directory)
echo "Creating backup..."
backup_filename="log_rotation$(date +'%Y-%m-%d').tar.gz"
tar -czvf "$backup_dir/$backup_filename" "$source_dir"

# Rotate log files (replace /path/to/logs with the actual log directory)
echo "Rotating log files..."
find "$log_dir" -type f -name "*.log" -exec mv {} {}.old \;
find "$log_dir" -type f -name "*.old" -exec gzip {} \;

# Update system packages
echo "Updating packages..."
dnf update -y

echo "Backup, log rotation, and software update completed successfully."
