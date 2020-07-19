#!/bin/bash

# This script strips water from all xtcs
# Author: Panyue Wang (pywang@ucdavis.edu)

# output prefix
OUTPUT=Q3_tail_stripped

# tpr
TPR=../tprs/Q3_10A_1000ps_1.tpr

# index file
INDEX=../btnk_Q3_water.ndx

NUMBER=1

for run in `ls ../*.xtc | sort -V`; do
    # run MD
    # get rid of extensions
    filename=${run%.xtc}
    echo 16 | gmx trjconv -s $TPR -f ${run} -n $INDEX -o ${OUTPUT}_$NUMBER.xtc
    let NUMBER=$NUMBER+1
done
