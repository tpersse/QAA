#!/bin/bash
#SBATCH --account=bgmp
#SBATCH --partition=bgmp
#SBATCH --cpus-per-task=8
#SBATCH --nodes=1
#SBATCH --time=10:00:00
#SBATCH --output=match1%j.out
#SBATCH --error=match1%j.err
#SBATCH --mail-user='tpersse@uoregon.edu'
#SBATCH --mail-type=END,FAIL

/usr/bin/time -v python samparse.py -f Aligned_28_4D.Aligned.out.sam -o 28_4D_count.txt