#!/bin/bash

if [ `uname | grep Darwin` ]; then
	echo "This script will run on darwin (Mac OS X)";
else
	echo "This script will only run on darwin (Mac OS X)";
	exit 1
fi

if [ -d ~/src/kitware/CMake ]; then
	mkdir -p ~/src/kitware/CMake_build
	cd ~/src/kitware/CMake_build

	# make the Qt GUI
	../CMake/bootstrap --qt-gui --prefix=/
	make
	sudo make DESTDIR=tmp install
	sudo rm -rf /Applications/CMake*
	sudo cp -rf tmp/CMake*.app /Applications/

	# make the command line tools
	sudo rm -rf *
	../CMake/bootstrap --prefix=/opt/local
	make
	sudo make install
else
	echo "No directory ~/src/kitware/CMake"
	echo "Get the source from cvs"
fi 

