#!/bin/bash

cd ~/src/kitware/VTK_build/
rm -rf binTmp
cp -rf bin binTmp
cd binTmp

version=5.2

libdestStr="libvtk"
libinstStr="/Users/dweber/src/kitware/VTK_build/binTmp/libvtk"

for dylib in libvtk*.${version}*.dylib; do
    echo ${dylib}
    libdepStr=`otool -L ${dylib} | grep ${libdestStr} | sed s/.dylib.*/.dylib/`
    for libName in ${libdepStr}; do
        echo "...$libName"
		#libInst=`echo ${libName} | sed -e "s|${libdestStr}|${libinstStr}|g"`
        #echo "install_name_tool -change ${libName} ${libInst} ${dylib}"
        #install_name_tool -change ${libName} ${libInst} ${dylib}
    done
    #exit
done



#[ dweber@weber-mbp ~/src/kitware/VTK_build/binTmp ]$ otool -L libvtkCommon.5.2.0.dylib 
#libvtkCommon.5.2.0.dylib:
	#libvtkCommon.5.2.dylib (compatibility version 0.0.0, current version 0.0.0)
	#libvtksys.5.2.dylib (compatibility version 0.0.0, current version 0.0.0)
	#/usr/lib/libSystem.B.dylib (compatibility version 1.0.0, current version 111.1.1)
	#/usr/lib/libstdc++.6.dylib (compatibility version 7.0.0, current version 7.4.0)
	#/usr/lib/libgcc_s.1.dylib (compatibility version 1.0.0, current version 1.0.0)

#[ dweber@weber-mbp ~/src/kitware/VTK_build/binTmp ]$ install_name_tool -id /Users/dweber/src/kitware/VTK_build/binTmp/libvtkCommon.5.2.dylib  -change libvtksys.5.2.dylib /Users/dweber/src/kitware/VTK_build/binTmp/libvtksys.5.2.dylib libvtkCommon.5.2.0.dylib

#[ dweber@weber-mbp ~/src/kitware/VTK_build/binTmp ]$ otool -L libvtkCommon.5.2.0.dylib libvtkCommon.5.2.0.dylib:
	#/Users/dweber/src/kitware/VTK_build/binTmp/libvtkCommon.5.2.dylib (compatibility version 0.0.0, current version 0.0.0)
	#/Users/dweber/src/kitware/VTK_build/binTmp/libvtksys.5.2.dylib (compatibility version 0.0.0, current version 0.0.0)
	#/usr/lib/libSystem.B.dylib (compatibility version 1.0.0, current version 111.1.1)
	#/usr/lib/libstdc++.6.dylib (compatibility version 7.0.0, current version 7.4.0)
	#/usr/lib/libgcc_s.1.dylib (compatibility version 1.0.0, current version 1.0.0)
#[ dweber@weber-mbp ~/src/kitware/VTK_build/binTmp ]$ 

