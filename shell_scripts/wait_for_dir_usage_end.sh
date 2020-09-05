#!/bin/sh

# wait to all process that is using the ${1} directory to finish
wait_process_using_dir() {
	VERIFICATION_DIR="${1}"
	VERIFICATION_TIME=7
	VERIFICATION_NUM=3

	echo "* Starting winetricks-moded wait_process_using_dir..."
	i=0 ; while true; do
		i=$((i+1))
		echo "-------"
		echo "winetricks-moded: loop with i=${i}"

		echo "winetricks-moded: sleep ${VERIFICATION_TIME}"
		sleep "${VERIFICATION_TIME}"

		PID_LIST="$(fuser "${VERIFICATION_DIR}")"
		echo "winetricks-moded PID_LIST: ${PID_LIST}"

		# double quote make one bug!
		# shellcheck disable=SC2086
		FIST_PID="$(echo ${PID_LIST} | cut -d' ' -f1)"
		echo "winetricks-moded FIST_PID: ${FIST_PID}"
		if [ -n "${FIST_PID}" ]; then
			i=0
			echo "winetricks-moded: tail --pid=${FIST_PID} -f /dev/null"
			tail --pid="${FIST_PID}" -f /dev/null
			continue
		fi

		echo "-------"
		[ "${i}" -lt "${VERIFICATION_NUM}" ] || break
	done
	echo "* End of winetricks-moded wait_process_using_dir."
}

wait_process_using_dir "${1}"
