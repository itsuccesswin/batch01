#!/bin/bash

### Type 1 

case $USER in
	root) echo "You are a root user"
		  ;;
	*) echo "You are not root user" ;;
esac


### Type 2 

ID=$(id -u)
case $ID in 
	0) echo "You are a root user"
	   ;;
	 *) echo "You are not root user" ;;
esac 


### Type 2
WHO=$(whoami)
case $WHO in 
	root) echo "You are a root user"
	   ;;
	*) echo "You are not root user" ;;
esac 
