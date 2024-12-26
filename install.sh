#!/bin/bash

install_to=/usr/local/bin

check_exit_status(){
if [ $? -ne 0 ] 
then
	echo "Something went wrong!"
	exit 1
fi
}

if [ -f $install_to/log-archive ] 
then
	echo "You already have the log-archive installed!"
	echo "Choose what you want to do:"
	echo "1 - Uninstall log-arhcive"
	echo "2 - Reinstall log-archive"
	echo "3 - Exit"
	echo "Type number"

	read action;
	case $action in
		1) sudo rm /usr/local/bin/log-archive && echo "log-archive was successfully uninstalled!" && exit 0;;
		2) sudo rm /usr/local/bin/log-archive;;
		3) exit 0;;
	esac
fi
	

# copy log-archive to /usr/local/bin/log-archive
sudo cp log-archive.sh $install_to/log-archive
check_exit_status

# change owner of the file to root and give execute permission to group and others
sudo chown root:root $install_to/log-archive && sudo chmod go+x $install_to/log-archive
check_exit_status

echo "log-archive was successfully installed!!!"
