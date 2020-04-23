#!/system/bin/sh

if [ "$1" = "on" ]
then
    if [ $(settings get global airplane_mode_on) = '0' ]
    then
	      settings put global airplane_mode_on 1
	      am broadcast -a android.intent.action.AIRPLANE_MODE --ez state true
    fi
else
    if [ $(settings get global airplane_mode_on) = '1' ]
    then
	      settings put global airplane_mode_on 0
	      am broadcast -a android.intent.action.AIRPLANE_MODE --ez state false
    fi
fi
sleep 4
