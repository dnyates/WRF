#!/bin/bash -l
### Job Name
#PBS -N CasperReal
### Charging account
#PBS -A p48500028
#PBS -l walltime=30:00
#PBS -q casper
#PBS -j oe
#PBS -l select=2:ncpus=128:mpiprocs=128

echo "start time: " `date`
mpiexec -n 256 -ppn 128 ./real.exe  &> real.out
echo "end time: " `date`
