#!/bin/bash

# Variables
log_dir=$1
current_date=$(date +%Y%m%d_%H%M%S )
archived_logs_dir=$HOME/archivedLogs
error_log_file=$archived_logs_dir/errorLogs.log
log_file=$archived_logs_dir/logs.log

# Check to make sure the user has entered exactly 1 argument
if [ $# -ne 1 ]
then
	echo "Wrong usage"
	echo "Usage: log-archive <log-directory>"
	echo "Please try again!"
	exit 128
fi

# Function that checks the exit status code of the previous command and exit if the code is not equal to 0
check_exit_status() {
if [ $? -ne 0 ]
then
	echo "An error has occurred!"
	echo "Check $error_log_file"
	exit 1
fi
}

# Checks if user's directory exists and user have required permissions
if [ ! -d $log_dir ]
then
	echo "Error: Directory $log_dir does not exists"
	exit 1
elif [ ! -r $log_dir ]
then
	echo "Error: You have not read permission for $log_dir!"
	exit 1
fi

# Create archive directory if doesn't exists
mkdir -p $archived_logs_dir
check_exit_status

tar -czvf $archived_logs_dir/logs_archive_$current_date.tar.gz $log_dir >> $log_file 2>> $error_log_file
check_exit_status


echo "[$(date '+%Y-%m-%d %H:%M:%S')] Archive \"logs_archive_$current_date.tar.gz\" successfully created!" >> "$log_file"
echo "Logs was successfully archived to $archived_logs_dir"
echo "Log file path: $log_file"

