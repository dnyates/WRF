#!/bin/bash
#
# LSF Batch Script to Run NWM Calibration Simulations
#
#PBS -N conver_emiss 
##PBS -A NRAL0017
#PBS -A P48500028
#PBS -l walltime=12:00:00
#PBS -q main
#PBS -j oe
##PBS -m abe
##PBS -M yates@ucar.edu
#PBS -l select=2:ncpus=128:mpiprocs=128

echo "start time: " `date`
rm -f rsl.*

# need to have namelist.input file here
# need to have wrfinput_d01 file here
# need to have wrf_gocart_backg here
# e.g., ln -sf RF-T-2000-07-01-000000-g1-gocartBG.bin wrf_gocart_backg
# need to have emissopt3_d01 here
# e.g., ln -sf WRF-T-2000-07-01-000000-g1-ab.bin emissopt3_d01
# (may need to have emissfire_d01 here as well)
# e.g., ln -sf WRF-T-2000-07-01-000000-g1-bb.bin emissfire_d01

mpiexec -n 256 -ppn 128 ../chem/convert_emiss.exe  &> job.out
