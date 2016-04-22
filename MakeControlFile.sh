#!/bin/bash

#
# Will Flanagan - April 2016
# Please feel free to improve *and* commit to git!
# https://github.com/UTKLgroup/SLURM
#
# run as:
# ./MakeControlFile.sh > ControlFile
#

for i in `seq 1 48`;
do
  echo ./IndividualJob.sh $i
done 
