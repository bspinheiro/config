#!/bin/bash
clear
APP='aliases'
ZRC='~/.zshrc'
sleep 1

patch() {
  for $FILE in *.*.patch; do
    PATCH=$(echo $FILE|cut -d"." -f2)
    echo $'\nAliasing '"$PATCH..."
    cat $FILE >> $ZRC
    sleep .5	
  done 
}

patch

echo "kill $PPID" > ._$APP
osascript -e 'tell application "Terminal" to close first window' & exit
