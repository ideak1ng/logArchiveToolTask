#!/bin/bash

check_exit_status(){
if [ $? -ne 0 ] 
then
	echo "Something went wrong!"
	exit 1
fi
}

# copy log-archive to /usr/local/bin/log-archive
sudo cp log-archive.sh /usr/local/bin/log-archive
check_exit_status

# change owner of the file to root and give execute permission to group and others
sudo chown root:root /usr/local/bin/log-archive && sudo chmod go+x /usr/local/bin/log-archive
check_exit_status

echo "log-archive was successfully installed!!!"
