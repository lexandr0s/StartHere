#!/bin/sh

DIR=`pwd`
GITPULL="git pull"
REPLIST="apps cdk driver flash"

case "$1" in
  clone)
    echo -n "clone git"
    for f in  $REPLIST ; do
      if [ $2 = "dev" ]; then
        # dev
        git clone git@github.com:Duckbox-Developers/$f $f
      else
        # usr
        git clone git://github.com/Duckbox-Developers/$f $f
      fi
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
