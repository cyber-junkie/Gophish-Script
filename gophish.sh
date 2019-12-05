#!/bin/bash
#
#Script to initialized gophish
#
 
#Setting some variables
 
procname=Gophish
proc=gophish
appDir=/opt/gophish/
logfile=/var/log/gophish/gophish.log
errorfile=/var/log/gophish/gophish.error
 
start() {
        echo 'Starting '${procname}'....'
        cd ${appDir}
        nohup ./$proc >>$logfile 2>>$errorfile &
        sleep 1
}
 
stop() {
        echo 'Stopping '${procname}'....'
        pid=$(pidof ${proc})
        kill ${pid}
        sleep 1
}
 
status() {
        pid=$(pidof ${proc})
        if [[ "$pid" != "" ]]; then
                echo ${procname}' is running....'
        else
                echo ${procname}' is not running....'
        fi
}
 
case $1 in
                start|stop|status) "$1" ;;
esac