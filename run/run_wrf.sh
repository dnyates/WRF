#!/bin/bash
#
# LSF Batch Script to Run NWM Calibration Simulations
#
#PBS -N wrf_chem
##PBS -A NRAL0017
#PBS -A P48500028
#PBS -l walltime=12:00:00
#PBS -q main
#PBS -j oe
##PBS -m abe
##PBS -M yates@ucar.edu
#PBS -l select=19:ncpus=64:mpiprocs=128

### Select 70 nodes with 36 CPUs, for 2400+120 MPI processes
###PBS -l select=75:ncpus=32:mpiprocs=32

echo "start time: " `date`
###mpiexec -n 256 -ppn 128 ./wrf.exe  &> job.out
mpiexec -n 1216 -ppn 64 ./wrf.exe  &> wrf.out

### Select 70 nodes with 36 CPUs, for 2400+120 MPI processes
###PBS -l select=75:ncpus=32:mpiprocs=32+6:ncpus=8:mpiprocs=8

###mpiexec_mpt ./wrf.exe
mv rsl.* rsl_save
