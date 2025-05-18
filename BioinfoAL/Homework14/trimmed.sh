#!/bin/sh

#SBATCH --job-name=fastp_rna
#SBATCH --cpus-per-task=40
#SBATCH --mem=50gb    
#SBATCH --time=0:55:00
#SBATCH --output=/home/ablinkova/hm_rna_seq/rnaseq_map_star/trimmed/fastp_slurm.log
#SBATCH --partition=short

cd ~/hm_rna_seq/rnaseq_map_star/trimmed;
ls ~/hm_rna_seq/rnaseq_map_star/raw_data/*.fastq.gz | parallel -j2 "fastp -w 20 -i {} -I {=s:_001.fq.gz:_002.fq.gz:=} -o read_1_trimmed.fq.gz -O read_2_trimmed.fq.gz --unpaired1 unpaired1_U.fq.gz --unpaired2 unpaired2_U.fq.gz -x -5 -r -f 15 -M 25"

