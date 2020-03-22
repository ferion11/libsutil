#!/bin/bash

PACKAGE_MASK="/var/db/repos/gentoo/profiles/package.mask"

#don't work for long list of removal
sed -n '/removal in/ {n;p}' "${PACKAGE_MASK}" | while read -r line ; do
	echo "=============="
	LINE_SLASH=$(sed 's,/,\\\/,g' <<< "$line")
	sed -n "/${LINE_SLASH}/{x;p;d;}; x" "${PACKAGE_MASK}"
	echo "$line"
done
