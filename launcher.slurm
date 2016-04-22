#!/bin/bash
#
# Simple SLURM script for submitting multiple serial
# jobs (e.g. parametric studies) using a script wrapper
# to launch the jobs.
#
# To use, build the launcher executable and your
# serial application(s) and place them in your WORKDIR
# directory.  Then, edit the CONTROL_FILE to specify 
# each executable per process.
#
# Will Flanagan - March 2016
# Please feel free to improve *and* commit to git!
# https://github.com/UTKLgroup/SLURM
#
# This script is adopted from:
# https://github.com/TACC/launcher/blob/master/extras/batch-scripts/launcher.slurm
# which was found while perusing this documentation:
# https://www.tacc.utexas.edu/research-development/tacc-software/the-launcher
# On the TACC file system, this example script can also be found here:
# /opt/apps/launcher/3.0.1/extras/batch-scripts/launcher.slurm
#
# You can launch this script with:
# sbatch launcher.slurm
#
# You can monitor you job with:
# squeue -u $USER
#
#-------------------------------------------------------
#-------------------------------------------------------
# 
#         <------ Setup Parameters ------>
#
#SBATCH -p normal          # queue (partition) -- normal, development, etc.
#SBATCH -n 48              # total number of mpi tasks requested
#SBATCH -t 26:00:00
#          <------ Account String ----->
# <--- (Use this ONLY if you have MULTIPLE accounts) --->
#SBATCH -A Neutrino-Interaction
#------------------------------------------------------
module load launcher
export LAUNCHER_PLUGIN_DIR=$LAUNCHER_DIR/plugins
export LAUNCHER_RMI=SLURM
export LAUNCHER_JOB_FILE=ControlFile

$LAUNCHER_DIR/paramrun
