#!/bin/bash

#depends_build	bin:cmake:cmake

# may also depend on tcl and tcllib for the tcl wrapping; make this a default variant?

# configure.args \
#	-DCMAKE_INCLUDE_PATH:PATH=${prefix}/include \						#****
#	-DCMAKE_LIBRARY_PATH:PATH=${prefix}/lib \							#****
#	-DCMAKE_INSTALL_NAME_DIR:STRING=${prefix}/lib \						#****
#	-DCMAKE_EXE_LINKER_FLAGS:STRING="-rpath ${prefix}/lib" \
#	-DVTK_INSTALL_PREFIX:PATH=${prefix} \   							#****

cd ~/src/kitware/VTK_build

export prefix="/opt/local"
#export LDFLAGS="-L${prefix}/lib"
#export CXXFLAGS="-I${prefix}/include" 
cmake \
	-DBUILD_SHARED_LIBS:BOOL=ON \
	-DBUILD_EXAMPLES:BOOL=ON \
	-DBUILD_TESTING:BOOL=ON \
   	-DCMAKE_BUILD_TYPE:STRING=RelWithDebInfo \
	-DCMAKE_INCLUDE_PATH:PATH=${prefix}/include \
	-DCMAKE_INSTALL_PREFIX:PATH=${prefix} \
	-DCMAKE_LIBRARY_PATH:PATH=${prefix}/lib \
	-DVTK_INSTALL_PREFIX:PATH=${prefix} \
    \
	-DVTK_USE_RPATH:BOOL=ON \
	-DCMAKE_INSTALL_NAME_DIR:STRING="${prefix}/lib/vtk-5.2" \
	\
    -DVTK_DATA_ROOT:PATH=${prefix}/share/VTKData \
	-DVTK_USE_CARBON:BOOL=OFF \
	-DVTK_USE_COCOA:BOOL=ON \
	-DVTK_USE_INFOVIS:BOOL=ON \
	-DVTK_USE_PARALLEL:BOOL=OFF \
	-DVTK_USE_RENDERING:BOOL=ON \
	-DVTK_USE_VIEWS:BOOL=ON \
	-DVTK_USE_X:BOOL=OFF \
	-DVTK_WRAP_JAVA:BOOL=OFF \
	-DVTK_WRAP_PYTHON:BOOL=OFF \
	-DVTK_WRAP_TCL:BOOL=ON \
    -VTK_TCL_TK_STATIC:BOOL=OFF \
	-DTCL_TCLSH:FILEPATH=/usr/bin/tclsh \
	-DTCL_INCLUDE_PATH:PATH=/System/Library/Frameworks/Tcl.framework/Headers \
	-DTCL_LIBRARY:FILEPATH=/System/Library/Frameworks/tcl.framework \
	-DPYTHON_EXECUTABLE:FILEPATH=/opt/local/bin/python2.5 \
	../VTK


exit


# -----
# Uninstall

cd ~/src/kitware/VTK_build
for f in `cat install_manifest.txt`; do echo $f; sudo rm $f; done
sudo rm -rf /opt/local/lib/vtk-5.2
sudo rm -rf /opt/local/include/vtk-5.2


# ----------------------------------------------------------
# TCL System Resources (not macport install)
#
#TCL_INCLUDE_PATH:PATH=/System/Library/Frameworks/Tcl.framework/Headers
#TCL_LIBRARY:FILEPATH=/System/Library/Frameworks/tcl.framework
#TCL_TCLSH:FILEPATH=/usr/bin/tclsh
#//Build with static Tcl/Tk support. TCL_LIBRARY and TK_LIBRARY
#VTK_TCL_TK_STATIC:BOOL=OFF
#//Wrap VTK classes into the TCL language.
#VTK_WRAP_TCL:BOOL=ON
# ----------------------------------------------------------


#	-DVTK_TCL_LIBRARY_DIR:FILEPATH=${prefix}/lib/tcl8.5 \


#	-DVTK_REQUIRED_EXE_LINKER_FLAGS:STRING=-rpath ${prefix}/lib \



# TCL_INCLUDE_PATH:PATH=/System/Library/Frameworks/Tcl.framework/Headers 
# TCL_INCLUDE_PATH:PATH=/System/Library/Frameworks/Tcl.framework/Headers
# TCL_LIBRARY:FILEPATH=/System/Library/Frameworks/tcl.framework
# TCL_TCLSH:FILEPATH=/opt/local/bin/tclsh
# VTK_TCL_LIBRARY_DIR:FILEPATH=/opt/local/lib/tcl8.5

