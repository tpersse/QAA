#!/bin/bash
#SBATCH --account=bgmp
#SBATCH --partition=bgmp
#SBATCH --cpus-per-task=8
#SBATCH --nodes=1
#SBATCH --time=10:00:00
#SBATCH --output=lengths%j.out
#SBATCH --error=lengths%j.err
#SBATCH --mail-user='tpersse@uoregon.edu'
#SBATCH --mail-type=END,FAIL

/usr/bin/time -v zcat 28_4D_R1trimmed.fastq.gz | sed -n '2~4p' | awk '{print length($0)}' > 28_R1.txt

/usr/bin/time -v zcat 28_4D_R2trimmed.fastq.gz | sed -n '2~4p' | awk '{print length($0)}' > 28_R2.txt

/usr/bin/time -v zcat 3_2B_R1trimmed.fastq.gz | sed -n '2~4p' | awk '{print length($0)}' > 3_R1.txt

/usr/bin/time -v zcat 3_2B_R2trimmed.fastq.gz | sed -n '2~4p' | awk '{print length($0)}' > 3_R2.txt