#!/bin/bash

### DESC : Start and Stop Tomcat , Restart also 
ACTION=$1

if [ -z "$ACTION" ]; then 
	echo "Usage: $0 {start|stop|restart}"
	exit 1
fi

TOMCAT_DIR=/home/ec2-user/tomcat
START=$TOMCAT_DIR/bin/startup.sh
STOP=$TOMCAT_DIR/bin/shutdown.sh 

case $ACTION in 
	start)
		### Verify whether it is already started
		IS_RUN=$(ps -ef | grep '/home/ec2-user/tomcat' | grep -v grep  | wc -l)
		if [ $IS_RUN -eq 1 ]; then 
			echo "Tomcat is already running"
			exit 0
		fi
		$START &>/dev/null
		if [ $? -eq 0 ]; then 
			echo "Tomcat Started :: SUCCESS"
			exit 0
		else
			echo "Tomcat Started :: FAILURE"
			exit 1
		fi
	;;
	stop) 
		### Verify whether it is already stopped
		IS_RUN=$(ps -ef | grep '/home/ec2-user/tomcat' | grep -v grep  | wc -l)
		if [ $IS_RUN -eq 0 ]; then 
			echo "Tomcat is already stopped"
			exit 0
		fi
		$STOP &>/dev/null
		sleep 10
		IS_RUN=$(ps -ef | grep '/home/ec2-user/tomcat' | grep -v grep  | wc -l)
		if [ $IS_RUN -eq 0 ]; then 
			echo "TOMCAT STOPPED :: SUCCESS"
			exit 0
		else
			echo "TOMCAT STOPPED :: FAILURE"
			exit 1
		fi
	;;
	restart)
		### STOP
		IS_RUN=$(ps -ef | grep '/home/ec2-user/tomcat' | grep -v grep  | wc -l)
		if [ $IS_RUN -eq 1 ]; then 
			$STOP &>/dev/null
			sleep 10
			IS_RUN=$(ps -ef | grep '/home/ec2-user/tomcat' | grep -v grep  | wc -l)
			if [ $IS_RUN -eq 0 ]; then 
				echo "TOMCAT STOPPED :: SUCCESS"
			else
				echo "TOMCAT STOPPED :: FAILURE"
				exit 1
			fi
		fi

		## START
		$START &>/dev/null
		if [ $? -eq 0 ]; then 
			echo "Tomcat Started :: SUCCESS"
		else
			echo "Tomcat Started :: FAILURE"
			exit 1
		fi
	;;
	*) 
		echo "Usage : $0 {start|stop|restart}"	
		exit 2
		;;
esac