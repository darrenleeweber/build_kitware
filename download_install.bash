#!/bin/bash

# check out expect for the cvs passwords?

#export PYTHON_LIBRARY
#export PYTHON_INCLUDE_PATH
#export PYTHON_EXECUTABLE

# eg:
#export PYTHONPATH=$PYTHONPATH:/home/barre/VTK-build/Wrapping/Python:/home/barre/VTK-build/bin
#export PYTHONPATH=$PYTHONPATH:/home/barre/KWWidgets-build/Wrapping/Python:/home/barre/KWWidgets-build/bin


export TCL_LIBRARY=/usr/lib/libtcl8.4.so.0
export TK_LIBRARY=/usr/lib/libtk8.4.so.0

export CC=gcc
export CXX=g++

mkdir -p /usr/src/kitware
cd /usr/src/kitware

echo "***********************************"
echo "Checkout CMake 2.6"
echo "Enter 'cmake' at the login prompt"
echo "***********************************"
CVSROOT=:pserver:anonymous@www.cmake.org:/cvsroot/CMake
cvs -d $CVSROOT login
cvs -d $CVSROOT checkout -r CMake-2-6 CMake

echo "***********************************"
echo "Checkout VTK 5.2"
echo "Enter 'vtk' at the login prompt"
echo "***********************************"
vtkVer='VTK-5-2'
CVSROOT=:pserver:anonymous@public.kitware.com:/cvsroot/VTK
cvs -d $CVSROOT login
cvs -d $CVSROOT checkout -r $vtkVer VTK

echo "***********************************"
echo "Checkout VTKData"
echo "Enter 'vtk' at the login prompt"
echo "***********************************"
CVSROOT=:pserver:anonymous@public.kitware.com:/cvsroot/VTKData
cvs -d $CVSROOT login
cvs -d $CVSROOT checkout -r $vtkVer VTKData

echo "***********************************"
echo "Get Qt 4.2.3"
echo "See http://zetcode.com/articles/qt4/"
echo "***********************************"
wget ftp://ftp.trolltech.com/qt/source/qt-x11-opensource-src-4.2.3.tar.gz

echo "***********************************"
echo "Checkout ParaView 3.2.2"
echo "Enter an empty password at the login prompt"
echo "***********************************"
pvVer='ParaView-3-2-2'
CVSROOT=:pserver:anoncvs@www.paraview.org:/cvsroot/ParaView3
cvs -d $CVSROOT login
cvs -d $CVSROOT checkout -r $pvVer ParaView3

echo "***********************************"
echo "Checkout ITK 3.6"
echo "Enter 'insight' at the login prompt"
echo "***********************************"
itkVer='ITK-3-6'
CVSROOT=:pserver:anonymous@www.itk.org:/cvsroot/Insight
cvs -d $CVSROOT login
cvs -d $CVSROOT checkout -r $itkVer Insight

echo "***********************************"
echo "Checkout KWWidgets"
echo "Enter an empty password at the login prompt"
echo "***********************************"
CVSROOT=:pserver:anoncvs@www.kwwidgets.org:/cvsroot/KWWidgets
cvs -d $CVSROOT login
cvs -d $CVSROOT co KWWidgets


# Create build directories.

echo "***********************************"
echo "Build CMake"
echo "***********************************"
cd /usr/src/kitware/CMake

# cmakeInstallDir=/usr/local
# cmakeDataDir=/usr/local/share/cmake-2.6
# cmakeDocDir=/usr/local/doc/cmake-2.6
# cmakeManDir=/usr/local/man

# mkdir -p $cmakeDataDir
# mkdir -p $cmakeDocDir
# mkdir -p $cmakeManDir

# #./bootstrap --help
# ./bootstrap \
#     --prefix=$cmakeInstallDir \
#     --datadir=$cmakeDataDir \
#     --docdir=$cmakeDocDir
cmake .
make
make install


echo "***********************************"
echo "Build Qt"
echo "***********************************"
cd /usr/src/
tar zxvf qt-x11-opensource-src-4.2.3.tar.gz
cd qt-x11-opensource-src-4.2.3
./configure
make
make install

echo "***********************************"
echo "Install and Build MPICH2"
echo "***********************************"
cd /usr/src/mpich2
tar zxvf mpich2-1.0.7.tar.gz
cd mpich2-1.0.7
./configure
make
make install


echo "***********************************"
echo "11. Build VTK"
echo "***********************************"
mkdir -p /usr/src/kitware/VTKBuild
cd /usr/src/kitware/VTKBuild
ccmake /usr/src/kitware/VTK
# make edits to ccmake:
#BUILD_SHARED_LIBS ON
#VTK_WRAP_TCL ON
#VTK_WRAP_PYTHON ON
#VTK_USE_PARALLEL ON
#CMAKE_BUILD_TYPE Release
make
make install

####################
# Currently at this point
####################

echo "***********************************"
echo "Build ParaView"
echo "***********************************"
mkdir -p /usr/src/kitware/ParaViewBuild
cd /usr/src/kitware/ParaViewBuild
ccmake /usr/src/kitware/ParaView3

echo "***********************************"
echo "Build ITK"
echo "***********************************"
mkdir -p /usr/src/kitware/ITKBuild
cd /usr/src/kitware/ITKBuild
export CC=gcc
export CXX=g++
ccmake /usr/src/kitware/Insight
make
make install


echo "***********************************"
echo "Build KWWidgetsBuild"
echo "***********************************"
mkdir -p /usr/src/kitware/KWWidgetsBuild
cd /usr/src/kitware/KWWidgetsBuild
