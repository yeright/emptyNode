#!/bin/bash
# shutdown the node application

folder=`pwd`
PID=`ps aux | grep 'expose-gc' | grep -v "grep" | grep "\. $folder" | awk '{print $2}' `
if [ "$PID" = "" ]; then
	echo "Process does not seem to be running..."
	exit 0
fi
echo "Closing node process..."
kill -s 2 $PID
