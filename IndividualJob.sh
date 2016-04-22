#!/bin/sh
#
# Will Flanagan - April 2016
# Please feel free to improve *and* commit to git!
# https://github.com/UTKLgroup/SLURM
#
# These are the individual jobs which are launched by the control files as:
# ./IndividualJob.sh (number)
#

# Initialize variables
i=$1
SECONDS=0

#Make working directory for the job and move necessary files there.
WORKDIR=$PWD/TestNeutronJobs/Job$i
mkdir -p $WORKDIR
cp MINERsim $WORKDIR
cp MINERsim.in $WORKDIR
cp Watt_neutron_pdf.gdat $WORKDIR

# Move to the job directory.
cd $WORKDIR

# Change the seed.
# This kludgy line works only if the .in file still has "222698" as the seed variable.
# Can someone think of a better way to ensure that our jobs have unique seeds?
sed -i "s/222698/$i/g" MINERsim.in

# Execute the Geant4 executable
./MINERsim MINERsim.in

# Put something in the log file so that we know if jobs finished and how long they took.
# Can someone think of a better way to do this? Or can someone think of other information
# that we should be saving?
duration=$SECONDS
echo "$(($duration / 60)) minutes and $(($duration % 60)) seconds elapsed." > LogFile.txt
