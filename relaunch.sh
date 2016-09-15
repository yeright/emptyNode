#!/bin/bash
# restart node application - please run as node user (node)

folder=`pwd`
PID=`ps aux | grep 'expose-gc' | grep -v "grep" | grep "\. $folder" | awk '{print $2}' `

if [ "$PID" != "" ]; then
	echo "Closing node process..."
	kill -s 2 $PID
	sleep 3s
	#echo "Killing any remaining processes..."
	#kill -9 $PID
fi
echo "Restarting..."
nohup node --expose-gc . $folder >> logs/console.log 2>> logs/consoleError.log &
sleep 1s
echo "Complete..."
exit 0
