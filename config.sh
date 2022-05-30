#!/bin/bash
APP=homebrew

echo "Setting up $APP..."
(open $APP.command)

while :
do
  sleep 2            # Executed as long as condition is true and/or, up to a disaster-condition if any.
  if [ -f ~/._$APP ];
  then
    break  	     # Abandon the while loop.
  fi
done

echo DONE!
rm ~/._$APP

#osascript -e 'tell application "Terminal" to close first window' & exit
