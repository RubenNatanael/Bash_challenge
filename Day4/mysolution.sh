#!/bin/bash

process=$1
attemps=3


check_process()
{
    if pgrep -x $1 >/dev/null; then
        #echo "the process is runing"
        return 0;
    else 
        #echo "The process doesn't exists"
        restart_process "$1"
        return 1;
    fi
}
restart_process()
{
    echo "The process is not running. Attemptin to restart"
    attemps=$(( $attemps -1 ))
    if sudo systemctl restart "$1" &>/dev/null; then
        echo "Process $1 restarted succesfully."
    else
        echo "Fail traing to restart the process $1"
    fi
}
if [ $# -eq 0 ]; then
    echo "Please enter a process"
    exit 1;
fi
while true; do

    if [ $attemps -eq 0 ]; then
        echo "Can't restat enymore, the total attemps of restarting are $attemps"
        break
    fi
    check_process "$1"
    
    sleep 2
done