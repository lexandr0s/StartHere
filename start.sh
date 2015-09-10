#!/bin/sh

DIR=`pwd`
GITPULL="git pull"
GITPUSH="git push origin master"
GITSTATUS="git status"
REPLIST="apps cdk driver flash"

case "$1" in
	clone)
		if [ -d "apps" ]; then
			echo "apps already cloned"
		else
			if [ "$2" = "dev" ]; then
				# dev
				git clone git@github.com:lexandr0s/apps apps
				else
				# usr
				git clone https://github.com/lexandr0s/apps apps
			fi
			echo "git clone" apps
		fi
		if [ -d "cdk" ]; then
                	echo "cdk already cloned"
                else
                        echo "git clone cdk"
	                if [ "$2" = "dev" ]; then
                                # dev
                                git clone git@github.com:lexandr0s/ddt-cdk cdk
                                else
                                # usr
                                git clone https://github.com/lexandr0s/ddt-cdk cdk
                        fi
                fi
                if [ -d "driver" ]; then
                        echo "driver already cloned"
                else
                        echo "git clone driver"
                        if [ "$2" = "dev" ]; then
                                # dev
                                git clone git@github.com:lexandr0s/ddt-driver driver
                                else
                                # usr
                                git clone https://github.com/lexandr0s/ddt-driver driver
                        fi
                fi
                if [ -d "flash" ]; then
                        echo "flash already cloned"
                else
                        echo "git clone flash"
                        if [ "$2" = "dev" ]; then
                                # dev
                                git clone git@github.com:lexandr0s/flash flash
                                else
                                # usr
                                git clone https://github.com/lexandr0s/flash flash
                        fi
                fi
		;;
	pull)
		for f in  $REPLIST ; do
			cd $DIR/$f
			echo "$GITPULL" $f
			$GITPULL
			cd ..
			done
			;;
	push)
		for f in  $REPLIST ; do
			cd $DIR/$f
			echo "$GITPUSH" $f
			$GITPUSH
			cd ..
			done
			;;
	status)
		for f in  $REPLIST ; do
			cd $DIR/$f
			echo "$GITSTATUS" $f
			$GITSTATUS
			cd ..
			done
			;;
	*)
		if [ -d cdk ]; then
			echo "Usage: {clone | pull | push | status}"
			exit 1
		else
			$0 clone
		fi
		;;
esac
