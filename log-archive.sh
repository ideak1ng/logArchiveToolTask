#!/bin/bash

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
	echo "Check $errorLogFile"
	exit 1
fi
}

# Rename first user's argument for ease of use
logDir=$1

# Checks if user's directory exists
if [ ! -d $logDir ]
then
	echo "Error: Directory $logDir does not exists"
	exit 1
fi

currentDate=$(date +%Y%m%d_%H%M%S )
check_exit_status
archivedLogsDir=$HOME/archivedLogs

# Create archive directory if doesn't exists
mkdir -p $archivedLogsDir
check_exit_status

logFile=$archivedLogsDir/logs.log
errorLogFile=$archivedLogsDir/errorLogs.log


tar -czvf $archivedLogsDir/logs_archive_$currentDate.tar.gz $logDir >> $logFile 2>> $errorLogFile
check_exit_status


echo "[$(date '+%Y-%m-%d %H:%M:%S')] Archive \"logs_archive_$currentDate.tar.gz\" successfully created!" >> "$logFile"
echo "Logs was successfully archived to $archivedLogsDir"
echo "Log file path: $logFile"

