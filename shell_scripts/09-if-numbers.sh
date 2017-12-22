#!/bin/bash

### Print OK -> Load is less than 2
####   WAR -> gt 2 and less than 5
#####  CRI -> gt 5

LOAD=$(uptime | cut -d , -f3 | cut -d : -f2 |cut -d . -f1 | xargs)

if [ $LOAD -ge 5 ]; then 
	echo "CRTITICAL LOAD AVERAGE :: $LOAD"
	exit 2
elif [ $LOAD -ge 2 ]; then 
	echo "WARNING LOAD AVERAGE :: $LOAD "
	exit 1
else
	echo "OK"
	exit 0
fi