#!/bin/bash
#SBATCH -J fkbp12
#SBATCH --partition=defq
#SBATCH --get-user-env
#SBATCH --nodes=1
#SBATCH --tasks-per-node=20
#SBATCH --gres=gpu:4

module load mdynamics/amber/18.19
#Set for the system
GPU_COUNT=1
CPU_COUNT=4
CPU_PER_GPU=1

export CUDA_VISIBLE_DEVICES="0,1,2,3"

name=alk2_fkbp12
inpcrd=$name".inpcrd"
prmtop=$name".prmtop"
restart_01=$name"_01.rst"
restart_02=$name"_02.rst"
restart_02_2=$name"_02_2.rst"
restart_03=$name"_03.rst"
restart_04=$name"_04.rst"

#pmemd.cuda -O -i 01_min.in -o 01_min.out -c $inpcrd -p $prmtop -r $restart_01
#pmemd.cuda -O -i 02_heat.in -o 02_heat.out -p $prmtop -r $restart_02 -c $restart_01 -ref $restart_01
#pmemd.cuda -O -i 02_heat_2.in -o 02_heat_2.out -p $prmtop -r $restart_02_2 -c $restart_02 -ref $restart_02
#mpirun -np 20 pmemd.cuda.MPI -O -i 03_din.in -o 03_din.out -p $prmtop -r $restart_03 -c $restart_02_2 -ref $restart_02_2 -x restart_03.nc
#mpirun -np 20 pmemd.cuda.MPI -O -i 04_din.in -o 04_din.out -p $prmtop -r restart_04 -c $restart_03 -ref $restart_03 -x $restart_04.nc
#mpirun -np 20 pmemd.cuda.MPI -O -i 04_2_din.in -o 04_2_din.out -p $prmtop -r restart_04_2 -c restart_04 -ref restart_04 -x restart_04_2.nc
#mpirun -np 20 pmemd.cuda.MPI -O -i 04_3_din.in -o 04_3_din.out -p $prmtop -r restart_04_3 -c restart_04_2 -ref restart_04_2 -x restart_04_3.nc
mpirun -np 20 pmemd.cuda.MPI -O -i 04_4_din.in -o 04_4_din.out -p $prmtop -r restart_04_4 -c restart_04_3 -ref restart_04_3 -x restart_04_4.nc
#mpirun -np 20 pmemd.cuda.MPI -O -i 04_5_din.in -o 04_5_din.out -p $prmtop -r restart_04_5 -c restart_04_4 -ref restart_04_4 -x restart_04_5.nc
