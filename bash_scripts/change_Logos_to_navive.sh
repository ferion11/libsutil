#!/bin/bash

#------- making the start script -------
IFS_TMP=$IFS
IFS=$'\n'
LOGOS_EXE=$(find $HOME/.wine32 -name Logos.exe |  grep "Logos\/Logos.exe")
rm -rf $HOME/Desktop/Logos.sh

cat > $HOME/Desktop/Logos.sh << EOF
#!/bin/bash
# Save IFS
IFS_TMP=\$IFS
IFS=$'\n'

WINEPREFIX=$HOME/.wine32 LC_ALL=C wine "$LOGOS_EXE"

# restore IFS
IFS=\$IFS_TMP
EOF

chmod +x $HOME/Desktop/Logos.sh
IFS=$IFS_TMP
#------------------------------
