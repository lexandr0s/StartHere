#!/bin/sh

DIR=`pwd`
GITPULL="git pull"
REPLIST="apps cdk driver flash"

case "$1" in
  clone)
    echo -n "clone git"
    for f in  $REPLIST ; do
      # usr
      #git clone https://github.com/Duckbox-Developers/$f $f
      # dev
      git clone git@github.com:Duckbox-Developers/$f $f
      echo "git clone" $f
    done
    sudo $DIR/prepare4cdk.sh
    ;;
  pull)
    for f in  $REPLIST ; do
      cd $DIR/$f
      echo "git pull" $f
      $GITPULL
      cd ..
    done
    ;;
  *)
  if [ -d cdk ]; then
    echo "Usage: {clone | pull}"
    exit 1
  else
    $0 clone
  fi
esac
