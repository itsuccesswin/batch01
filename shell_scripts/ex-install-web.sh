#!/bin/bash

## check whether root orr not

case $USER in 
	root)
		echo "Installing Web Server"
		yum install httpd -y &>/dev/null
		;;
	*) 
		echo "You are not permitted to install a package"
		exit 1
esac