#!/bin/bash

# This script automates all MD runs of pulling
# Author: Panyue Wang (pywang@ucdavis.edu)

for run in `ls *.tpr | sort -V`; do
    # run MD
    # get rid of extensions
    filename=${run%.tpr}
    gmx mdrun -s ${run} -deffnm ../${filename}
    
    # move pullf files to a folder
    mv ../${filename}_pullf.xvg force/
done
