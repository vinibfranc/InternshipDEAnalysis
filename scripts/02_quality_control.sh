#!/bin/bash
set -e
set -u
set -o pipefail

# cd ..
# cd samples

# FASTQC installation
sudo apt-get install fastqc
# Dependencies installation
sudo apt-get install python3
sudo apt-get install python3-pip
pip3 install --upgrade cutadapt
sudo apt-get install curl

cd ..
mkdir -p tools
cd tools
# Trim Galore installation
curl -fsSL https://github.com/FelixKrueger/TrimGalore/archive/0.6.0.tar.gz -o trim_galore.tar.gz
tar xvzf trim_galore.tar.gz
Run Trim Galore
# TrimGalore-0.6.0/trim_galore
#export PATH=/home/lmmc-219/Vinicius/real_analysis/InternshipDEAnalysis/tools/TrimGalore-0.6.0:$PATH
#export PATH=/home/vinibfranc/Estagio/Analysis/InternshipDEAnalysis/tools/TrimGalore-0.6.0:$PATH
# Used to permit multiple cores inside TrimGalore
sudo apt-get install -y pigz

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