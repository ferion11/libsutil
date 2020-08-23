#!/bin/bash
# the sleeping version

BED_COMMAND="sleep 10"
(
	BED_COMMAND_PID=""
	while [ -z "$BED_COMMAND_PID" ]
	do
		BED_COMMAND_PID=$(ps -xopid,cmd | grep "$BED_COMMAND" | grep -v grep | cut -d " " -f1)
	done
	sleep 2
	kill -SIGKILL "$BED_COMMAND_PID"
) &

eval "$BED_COMMAND"
