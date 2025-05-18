#!/bin/sh
#SBATCH --job-name=star_mapping
#SBATCH --cpus-per-task=34
#SBATCH --mem=128gb
#SBATCH --time=1:55:00
#SBATCH --output=/home/ablinkova/hm_rna_seq/rnaseq_map_star/STARR/star.logs
#SBATCH --partition=short
export PATH="/home/ablinkova/.conda/envs/genome/bin/STAR:$PATH"
GENOME_DIR="/projects/mipt_dbmp_biotechnology/GRCh38/"    
READS1="read_1_trimmed.fq.gz"   
READS2="read_2_trimmed.fq.gz"	 
OUTPUT_DIR="STARR"

STAR \
  --runThreadN 32 \
  --runMode alignReads \
  --genomeDir $GENOME_DIR \
  --readFilesIn $READS1 $READS2\
  --readFilesCommand zcat \
  --outFileNamePrefix ${OUTPUT_DIR}/RNA_ \
  --outSAMtype BAM SortedByCoordinate \
  --quantMode GeneCounts

echo "Alignment Done"

