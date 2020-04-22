#!/system/bin/sh

if [ "$1" = "on" ]
then
	settings put global airplane_mode_on 1
	am broadcast -a android.intent.action.AIRPLANE_MODE --ez state true
else
	settings put global airplane_mode_on 0
	am broadcast -a android.intent.action.AIRPLANE_MODE --ez state false
fi
