#!/bin/bash

install() {
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
}

APP=homebrew && install
APP=spaceship && install


