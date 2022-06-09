#!/bin/bash

ADR='https://github.com/bspinheiro/config/raw/master/app.pack'
TMP=$(mktemp -d)
DIR=$(pwd)

setup() {
  APPNAME=$(echo $APP | cut -f 2 -d ".")
  STEP=$(expr $STEP + 1)
  echo -n "Step $STEP of $TOTAL: $APPNAME..."
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
  cd $TMP && curl -sLo $FILE $ADR 
  echo DONE!
} 

unpack() {
  tar -xzf $FILE
  chmod +x *.command
}

install() {
  TOTAL=$(ls *.*.command | wc -l | cut -f 8 -d " ")
  STEP=0
  for APP in *.*.command; do setup; done;
}

cleanup() {
  rm -rf "$TMP"
  cd $DIR	
}

trap cleanup EXIT
trap cleanup SIGINT

download && unpack && install


