#!/bin/bash
clear
APP='aliases'
ZRC='~/.zshrc'
sleep 1

echo $'\nPopulating Aliases...'
echo '## Hardware Commands' >> $ZRC 
# echo 'alias wake=''caffeinate -u -t 1'
# alias sleep='pmset sleepnow'
# alias logout="osascript -e 'tell app \"System Events\" to  «event aevtrlgo»'"
# alias reboot="osascript -e 'tell app \"System Events\" to restart'"
# alias shutdown="osascript -e 'tell app \"System Events\" to shut down'"

echo "kill $PPID" > ._$APP
osascript -e 'tell application "Terminal" to close first window' & exit
