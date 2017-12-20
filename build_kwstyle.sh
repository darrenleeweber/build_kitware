#!/bin/bash

if [ `uname | grep Darwin` ]; then
	echo "This script will run on darwin (Mac OS X)";
else
	echo "This script will only run on darwin (Mac OS X)";
	exit 1
fi

if [ -d ~/src/kitware/KWStyle ]; then
	mkdir -p ~/src/kitware/KWStyle_build
	cd ~/src/kitware/KWStyle_build

	# make the command line tools
	rm -rf *
	ccmake ../KWStyle
	make
	sudo make install
else
	echo "No directory ~/src/kitware/KWStyle"
	echo "Get the source from cvs"
fi 

