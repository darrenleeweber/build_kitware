#!/bin/bash

if [ $# -lt 1 ]; then
    echo "$0 'search term' ['search term' ...]"
    exit 1
fi

vtkExamplePath="/opt/local/share/vtk/examples"
vtkTestingPath="/opt/local/share/vtk/testing"

for term in $@; do
    echo
    echo "---------------------------------------------------------------------"
    echo "Search term: ${term}"
    for vtkPath in "${vtkExamplePath}" "${vtkTestingPath}" ; do
        if [ ! -d ${vtkPath} ]; then
            echo "Path not found: ${vtkPath}"
            echo "Modify script at $0"
            continue
        fi
        echo
        echo "Searching VTK files in: ${vtkPath}"
        grep -l -E -i -r --include='*.cxx' --regexp=${term} ${vtkPath}
        grep -l -E -i -r --include='*.tcl' --regexp=${term} ${vtkPath}
        grep -l -E -i -r --include='*.py'  --regexp=${term} ${vtkPath}
    done
done

