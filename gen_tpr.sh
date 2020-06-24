#!/bin/bash

# This script automates all pmf MD of snapshots
# Author: Panyue Wang (pywang@ucdavis.edu)
# Run name
RUN_NAME=MQ1_10A_1500ps

# MDP file
MDP=../../pulling_MQ1_10A_1500ps.mdp

# Topology file
TOPOL=../../../../../MD_files/bottleneck_MQ1_neutral_water.top

# Starting structure
STRUCT=../../bottleneck_MQ1_water_EM_corrected.gro

# Index file
INDEX=../../btnk_MQ1_water.ndx

# mdouts
MD_OUTS=mdouts

# number of runs
RUNS=20
# starting number
START=21
let TOTAL=$RUNS+$START-1
#mkdir $MD_OUTS

for run in $(seq $START $TOTAL)
do
    # create tprs for M
    gmx grompp -f $MDP -c $STRUCT -r $STRUCT -n $INDEX -p $TOPOL -po $MD_OUTS/mdout_${run}.mdp -o ${RUN_NAME}_${run}.tpr

#    mv ${RUN_NAME}_${run}.tpr tpr/
    
    # run MD
    #gmx mdrun -s ${RUN_NAME}_${run}.tpr -deffnm ../${RUN_NAME}_${run}
    
    # move pullf files to a folder
    #mv *pullf.xvg ../force/
done
