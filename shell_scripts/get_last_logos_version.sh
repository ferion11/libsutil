#!/bin/bash

wget -q https://wiki.logos.com/The_Logos_8_Beta_Program

echo "-------"
LAST_GOLD="$(cat The_Logos_8_Beta_Program | grep "Gold" | grep Logos_8 | grep td | head -1 | cut -d"\"" -f2 | cut -d"_" -f2)"
echo "LAST_GOLD: ${LAST_GOLD}"
echo "-------"
LAST_VERSION="$(echo $(cat The_Logos_8_Beta_Program | grep ${LAST_GOLD}. | grep -v strong | grep -v Beta | grep -v RC | tail -2 | head -1) | sed 's/<td>//g' | sed 's/<\/td>//g')"
echo "LAST_VERSION: ${LAST_VERSION}"
echo "-------"

rm -rf The_Logos_8_Beta_Program
