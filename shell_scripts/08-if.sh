#!/bin/bash

## Check script needs to be a root user or not
if [ $USER != root ]; then 
	echo "You should run as root user"
	exit 2
fi

read -p 'Enter action [start|stop]: ' action

if [ -z "$action" ];then 
	echo "You should give atleast one option"
	exit 1
fi

if [ $action = start ]; then 
	echo "You selected start action"
elif [ $action = stop ]; then 
	echo "You selected stop action"
else
	echo "You slected wrong option"
	exit 1
fi

