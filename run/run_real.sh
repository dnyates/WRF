#!/bin/bash
#
# LSF Batch Script to Run NWM Calibration Simulations
#
#PBS -N  real_chem
##PBS -A NRAL0017
#PBS -A P48500028
#PBS -l walltime=12:00:00
#PBS -q main
#PBS -j oe
##PBS -m abe
##PBS -M yates@ucar.edu
#PBS -l select=2:ncpus=128:mpiprocs=128

echo "start time: " `date`
mpiexec -n 256 -ppn 128 ./real.exe  &> real.out
