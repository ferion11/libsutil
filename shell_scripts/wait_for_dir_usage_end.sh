#!/bin/bash

wait_process_using_dir() {
	VERIFICATION_DIR="${1}"
	VERIFICATION_TIME=7
	VERIFICATION_TRIES=3

	echo "* Starting wait_process_using_dir..."
	for (( c=1; c<=${VERIFICATION_TRIES}; c++ ))
	do
		PID_LIST="$(fuser "${VERIFICATION_DIR}")"
		echo "PID_LIST: ${PID_LIST}"
		# double quote make one bug!
		# shellcheck disable=SC2086
		FIST_PID="$(echo ${PID_LIST} | cut -d' ' -f1)"
		echo "FIST_PID: ${FIST_PID}"
		if [ -z "${FIST_PID}" ]; then
			echo "sleep ${VERIFICATION_TIME}"
			sleep "${VERIFICATION_TIME}"
		else
			c=1
			echo "tail --pid=${FIST_PID} -f /dev/null"
			tail --pid="${FIST_PID}" -f /dev/null
		fi
		echo "end loop with c=${c}"
	done
	echo "* End of wait_process_using_dir."
}

wait_process_using_dir "/home/admlocal/.wine32"
