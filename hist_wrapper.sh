#!/bin/bash
#SBATCH --account=bgmp
#SBATCH --partition=bgmp
#SBATCH --cpus-per-task=8
#SBATCH --nodes=1
#SBATCH --time=10:00:00
#SBATCH --output=histgen1%j.out
#SBATCH --error=histgen1%j.err
#SBATCH --mail-user='tpersse@uoregon.edu'
#SBATCH --mail-type=END,FAIL

conda activate bgmp_py39

/usr/bin/time -v python hist_gen.py -f /projects/bgmp/shared/2017_sequencing/demultiplexed/3_2B_control_S3_L008_R2_001.fastq.gz -o /projects/bgmp/tpersse/bioinformatics/Bi623/Assignments/QAA/3_2B_R2hist.png