#!/bin/bash

die() { echo >&2 "$*"; exit 1; };

if [ -d "$1" ]; then
	echo "* Making MD5SUMS file..."
	cd "$1"
	md5sum -- * > MD5SUMS || die "* ERROR: Can't generate MD5SUMS file"
	echo "* MD5SUMS file done"
else
	die "* ERROR: Directory don't exist: $1"
fi
