#!/bin/bash

# Check the kitware web sites to update these release tags
export CMAKE_tag="CMake-2-6-3"
export ITK_tag="ITK-3-12"
export VTK_tag="VTK-5-4-0"
export PARAVIEW_tag="ParaView-3-4-0"

mkdir -p ~/src/kitware
cd ~/src/kitware


rm -rf KWStyle
expect -c "
spawn cvs -d :pserver:anoncvs@public.kitware.com:/cvsroot/KWStyle login;
expect \"CVS password:\";
send \"\r\";
send_user \"\r\nDone CVS login\r\n\";
exit"
cvs -d :pserver:anoncvs@public.kitware.com:/cvsroot/KWStyle co KWStyle


rm -rf CMake
expect -c "
spawn cvs -d :pserver:anonymous@www.cmake.org:/cvsroot/CMake login;
expect \"CVS password:\";
send \"cmake\r\";
send_user \"\r\nDone CVS login\r\n\";
exit"
cvs -d :pserver:anonymous@www.cmake.org:/cvsroot/CMake co -r $CMAKE_tag CMake


rm -rf Insight
rm -rf InsightDocuments
rm -rf InsightApplications
expect -c "
spawn cvs -d :pserver:anonymous@www.itk.org:/cvsroot/Insight login;
expect \"CVS password:\";
send \"insight\r\";
send_user \"\r\nDone CVS login\r\n\";
exit"
cvs -d :pserver:anonymous@www.itk.org:/cvsroot/Insight co -r $ITK_tag Insight
cvs -d :pserver:anonymous@www.itk.org:/cvsroot/Insight co -r $ITK_tag InsightDocuments
cvs -d :pserver:anonymous@www.itk.org:/cvsroot/Insight co -r $ITK_tag InsightApplications


rm -rf VTK
rm -rf VTKData
expect -c "
spawn cvs -d :pserver:anonymous@public.kitware.com:/cvsroot/VTK login;
expect \"CVS password:\";
send \"vtk\r\";
send_user \"\r\nDone CVS login\r\n\";
exit"
cvs -d :pserver:anonymous@public.kitware.com:/cvsroot/VTK co -r $VTK_tag VTK
expect -c "
spawn cvs -d :pserver:anonymous@public.kitware.com:/cvsroot/VTKData login;
expect \"CVS password:\";
send \"vtk\r\";
send_user \"\r\nDone CVS login\r\n\";
exit"
cvs -d :pserver:anonymous@public.kitware.com:/cvsroot/VTKData co -r $VTK_tag VTKData


rm -rf ParaView3
expect -c "
spawn cvs -d :pserver:anoncvs@www.paraview.org:/cvsroot/ParaView3 login;
expect \"CVS password:\";
send \"\r\";
send_user \"\r\nDone CVS login\r\n\";
exit"
cvs -d :pserver:anoncvs@www.paraview.org:/cvsroot/ParaView3 co -r $PARAVIEW_tag ParaView3


rm -rf KWWidgets
expect -c "
spawn cvs -d :pserver:anoncvs@www.kwwidgets.org:/cvsroot/KWWidgets login;
expect \"CVS password:\";
send \"\r\";
send_user \"\r\nDone CVS login\r\n\";
exit"
cvs -d :pserver:anoncvs@www.kwwidgets.org:/cvsroot/KWWidgets co KWWidgets


rm -rf CableSwig
expect -c "
spawn cvs -d :pserver:anonymous@public.kitware.com:/cvsroot/CableSwig login;
expect \"CVS password:\";
send \"\r\";
send_user \"\r\nDone CVS login\r\n\";
exit"
cvs -d :pserver:anonymous@public.kitware.com:/cvsroot/CableSwig co CableSwig

