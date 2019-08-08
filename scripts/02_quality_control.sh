#!/bin/bash
set -e
set -u
set -o pipefail

cd ../samples
# View quality before trimming
#fastqc *.fastq -t 4
# Quality report before alignment
#multiqc .

if [[ $1 == "ma_e6" ]]
then
    # Trimming sequences
    mkdir -p q24_ma
    trim_galore --quality 24 --phred33 --cores 4 --fastqc_args "-t 4" SRR1536287_144h_rep1.fastq -o q24_ma
    trim_galore --quality 24 --phred33 --cores 4 --fastqc_args "-t 4" SRR1536288_144h_rep2.fastq -o q24_ma
    trim_galore --quality 24 --phred33 --cores 4 --fastqc_args "-t 4" SRR1536285_48h_rep1.fastq -o q24_ma
    trim_galore --quality 24 --phred33 --cores 4 --fastqc_args "-t 4" SRR1536286_48h_rep2.fastq -o q24_ma
    trim_galore --quality 24 --phred33 --cores 4 --fastqc_args "-t 4" SRR1536283_control_rep1.fastq -o q24_ma
    trim_galore --quality 24 --phred33 --cores 4 --fastqc_args "-t 4" SRR1536284_control_rep2.fastq -o q24_ma

    # Quality report after alignment
    cd q24
    multiqc .
elif [[ $1 == "mr_arsef" ]]
then
    # Trimming sequences
    mkdir -p q30_mr
    trim_galore --quality 30 --phred33 --cores 4 --fastqc_args "-t 4" SRR1063454_control.fastq -o q30_mr
    trim_galore --quality 30 --phred33 --cores 4 --fastqc_args "-t 4" SRR1063457_heat.fastq -o q30_mr

    # Quality report after alignment
    cd q30_mr
    multiqc .
else
    echo "Error!"
fi
