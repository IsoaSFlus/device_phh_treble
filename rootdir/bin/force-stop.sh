#!/bin/sh
# arg1 for package name arg2 for seconds to count down 
#su

pkg=''
sec='0'

if [[ "$2" != "" ]]
then
    sec="$2"
fi

pm list packages | grep "$1"

if [[ `pm list packages | grep "$1" | wc -l` -eq "1" ]]
then
    sleep $sec
    pkg=`pm list packages | grep "$1" | sed 's/package://'`
    am force-stop "${pkg}"
    svc wifi disable
    am force-stop com.termux
else
    echo "Invalid package!"
fi

