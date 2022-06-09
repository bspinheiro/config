#!/bin/bash

setup() {
APPNAME=$(echo $APP | cut -f 2 -d ".")
CFG_STEP=$(expr $CFG_STEP + 1)
echo -n "Step $CFG_STEP of $CFG_TOTAL: $APPNAME..."
(open $APP)
while :
do
  sleep 2
  if [ -f ~/._$APPNAME ];
  then
    break
  fi
done
echo DONE!
rm ~/._$APPNAME
}

download() {
FILE=$(echo $ADR | cut -d "/" -f 8)
echo -n "Downloading $ADR..."
curl -sLo $FILE $ADR 
echo DONE!
} 

unpack() {
tar -xzf $FILE
chmod +x *.command
}

install() {
CFG_TOTAL=$(ls *.*.command | wc -l | cut -f 8 -d " ")
CFG_STEP=0
for APP in *.*.command; do setup; done;
}

ADR='https://github.com/bspinheiro/config/raw/master/cmdpack.tar'
download && unpack && install

#APP=homebrew && install
#APP=spaceship && install
