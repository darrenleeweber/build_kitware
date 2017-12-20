#!/bin/bash


# Uninstall VTK

cd ~/src/kitware/VTK_build
for f in `cat install_manifest.txt`; do echo $f; sudo rm $f; done
sudo rm -rf /opt/local/lib/vtk-5.2
sudo rm -rf /opt/local/include/vtk-5.2
sudo rm -f /opt/local/bin/vtk*

