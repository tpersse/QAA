#!/bin/bash
#SBATCH --account=bgmp
#SBATCH --partition=bgmp
#SBATCH --cpus-per-task=8
#SBATCH --time=00:45:00
#SBATCH --mail-user='tpersse@uoregon.edu'
#SBATCH --mail-type=END,FAIL

/usr/bin/time -v STAR --runMode genomeGenerate \
--readFilesCommand zcat \
--runThreadN 8 \
--genomeDir /projects/bgmp/tpersse/bioinformatics/Bi623/Assignments/QAA/STARGenome_out/ \
--genomeFastaFiles /projects/bgmp/tpersse/bioinformatics/Bi623/Assignments/QAA/Mus_musculus.GRCm39.dna.primary_assembly.fa \
--sjdbGTFfile /projects/bgmp/tpersse/bioinformatics/Bi623/Assignments/QAA/Mus_musculus.GRCm39.104.gtf



exit