#!/bin/bash
#SBATCH --account=bgmp
#SBATCH --partition=bgmp
#SBATCH --cpus-per-task=8
#SBATCH --nodes=1
#SBATCH --time=10:00:00
#SBATCH --output=trimmo%j.out
#SBATCH --error=trimmo%j.err
#SBATCH --mail-user='tpersse@uoregon.edu'
#SBATCH --mail-type=END,FAIL

/usr/bin/time -v trimmomatic PE 28_4D_R1.fastq 28_4D_R2.fastq \
28_4D_R1trimmed.fastq.gz 28_4D_R1_untrimmed.fastq.gz \
28_4D_R2trimmed.fastq.gz 28_4D_R2_untrimmed.fastq.gz \
LEADING:3 TRAILING:3 SLIDINGWINDOW:5:15 MINLEN:35