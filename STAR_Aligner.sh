#!/bin/bash

#SBATCH --account=bgmp
#SBATCH --partition=bgmp
#SBATCH --cpus-per-task=8
#SBATCH --nodes=1
#SBATCH --time=05:00:00
#SBATCH --output=AlignmentSTAR%j.out
#SBATCH --error=AlignmentSTAR%j.err
#SBATCH --mail-user='tpersse@uoregon.edu'
#SBATCH --mail-type=END,FAIL

/usr/bin/time -v STAR --runMode alignReads \
--readFilesCommand zcat \
--runThreadN 8 \
--outFilterMultimapNmax 3 \
--outSAMunmapped Within KeepPairs \
--alignIntronMax 1000000 --alignMatesGapMax 1000000 \
--readFilesIn /projects/bgmp/tpersse/bioinformatics/Bi623/Assignments/QAA/3_2B_R1trimmed.fastq.gz /projects/bgmp/tpersse/bioinformatics/Bi623/Assignments/QAA/3_2B_R2trimmed.fastq.gz \
--genomeDir /projects/bgmp/tpersse/bioinformatics/Bi623/Assignments/QAA/STARGenome_out/ \
--outFileNamePrefix Aligned_3_2b.




exit
