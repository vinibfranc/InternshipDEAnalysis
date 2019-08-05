#!/bin/bash
set -e
set -u
set -o pipefail

cd ../samples
# View quality before trimming
fastqc *.fastq -t 4

# Trimming sequences
mkdir q24
trim_galore --quality 24 --phred33 --cores 4 --fastqc_args "-t 4" SRR1536287_144h_rep1.fastq -o q24
trim_galore --quality 24 --phred33 --cores 4 --fastqc_args "-t 4" SRR1536288_144h_rep2.fastq -o q24
trim_galore --quality 24 --phred33 --cores 4 --fastqc_args "-t 4" SRR1536285_48h_rep1.fastq -o q24
trim_galore --quality 24 --phred33 --cores 4 --fastqc_args "-t 4" SRR1536286_48h_rep2.fastq -o q24
trim_galore --quality 24 --phred33 --cores 4 --fastqc_args "-t 4" SRR1536283_control_rep1.fastq -o q24
trim_galore --quality 24 --phred33 --cores 4 --fastqc_args "-t 4" SRR1536284_control_rep2.fastq -o q24

# mkdir q24_clip_ends
# trim_galore --quality 24 --phred33 --clip_R1 3 --three_prime_clip_R1 5 --cores 4 --fastqc_args "-t 4" SRR1536287_144h_rep1.fastq -o q24_clip_ends
# trim_galore --quality 24 --phred33 --clip_R1 3 --three_prime_clip_R1 5 --cores 4 --fastqc_args "-t 4" SRR1536288_144h_rep2.fastq -o q24_clip_ends
# trim_galore --quality 24 --phred33 --clip_R1 3 --three_prime_clip_R1 5 --cores 4 --fastqc_args "-t 4" SRR1536285_48h_rep1.fastq -o q24_clip_ends
# trim_galore --quality 24 --phred33 --clip_R1 3 --three_prime_clip_R1 5 --cores 4 --fastqc_args "-t 4" SRR1536286_48h_rep2.fastq -o q24_clip_ends
# trim_galore --quality 24 --phred33 --clip_R1 3 --three_prime_clip_R1 5 --cores 4 --fastqc_args "-t 4" SRR1536283_control_rep1.fastq -o q24_clip_ends
# trim_galore --quality 24 --phred33 --clip_R1 3 --three_prime_clip_R1 5 --cores 4 --fastqc_args "-t 4" SRR1536284_control_rep2.fastq -o q24_clip_ends