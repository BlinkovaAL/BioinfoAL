#!/bin/sh

#SBATCH --job-name=rna_fastqc
#SBATCH --cpus-per-task=40
#SBATCH --mem=50gb
#SBATCH --time=0:30:00       	# Time limit hrs:min:sec
#SBATCH --output=/home/ablinkova/hm_rna_seq/rnaseq_map_star/fastqc/fastqc_slurm.log  # Standard output and error log
#SBATCH --partition=short

cd ~/hm_rna_seq/rnaseq_map_star/fastqc;
ls ~/hm_rna_seq/rnaseq_map_star/raw_data/*.gz | parallel -j4 "fastqc -t 10 -o . {}"

