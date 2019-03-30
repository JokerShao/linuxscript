#!/bin/bash
# AUTHOR:   joker
# FILE:     run.sh
# ROLE:     a cpu frequency monitor
# CREATED:  2018-03-03 12:01:04
# MODIFIED: 2018-03-03 14:32:14

if [ $# == 0 ];then
	# default mode, show information on screen
	# press control-C to exit
	watch -n 0 "cat /proc/cpuinfo | grep 'MHz'"
elif [ $# == 1 ]; then
	if [ $1 == 0 ]; then
		watch -n 0 "cat /proc/cpuinfo | grep 'MHz'"
	elif [ $1 == 1 ]; then
		if [ -f "cpufreq.txt" ]; then
			rm "cpufreq.txt"
		fi
		while [[ 1 ]]; do
			clear
			echo "record mode, cpu frequency will write to cpufreq.txt"
			cat /proc/cpuinfo | grep MHz
			cat /proc/cpuinfo | grep MHz >> cpufreq.txt
			echo " " >> cpufreq.txt
			sleep 0.1
		done
	else
		echo 'arg wrong'
	fi
else
	echo 'arg wrong'
fi


