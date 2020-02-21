#!/bin/bash
#INSTALL_PATH="install_dir"
INSTALL_PATH_ORIGIN="/tmp/.mount_pcsx2-kg2S9Z"
INSTALL_PATH=$(echo "$INSTALL_PATH_ORIGIN" | sed 's,/,\\\/,g')

echo "================================="
cat $1
echo "================================="
sed "s/=[^[]*\/usr\/lib/=$INSTALL_PATH\/usr\/lib/g" $1
echo "================================="
