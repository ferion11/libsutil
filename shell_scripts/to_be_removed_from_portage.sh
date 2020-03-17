#!/bin/bash

PACKAGE_MASK="/var/db/repos/gentoo/profiles/package.mask"

sed -n '/removal in/ {n;p}' "${PACKAGE_MASK}" | while read -r line ; do
	echo "=============="
	LINE_SLASH=$(sed 's,/,\\\/,g' <<< "$line")
	sed -n "/${LINE_SLASH}/{x;p;d;}; x" "${PACKAGE_MASK}"
	echo "$line"
done
