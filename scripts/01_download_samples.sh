#!/bin/bash
set -e
set -u
set -o pipefail

cd ..
mkdir -p samples
cd samples

if [[ $1 == "ma_e6" ]]
then
    # Metarhizium anisopliae E6 transcriptome - I-144h (144 h tick cuticle infection condition)
    fasterq-dump -p SRR1536287
    fasterq-dump -p SRR1536288

    # Metarhizium anisopliae E6 transcriptome - I-48h (48 h tick cuticle infection condition)
    fasterq-dump -p SRR1536285
    fasterq-dump -p SRR1536286

    # Metarhizium anisopliae E6 transcriptome - C-48h (Control condition)
    fasterq-dump -p SRR1536283
    fasterq-dump -p SRR1536284

    # Rename files
    mv SRR1536287.fastq SRR1536287_144h_rep1.fastq
    mv SRR1536288.fastq SRR1536288_144h_rep2.fastq
    mv SRR1536285.fastq SRR1536285_48h_rep1.fastq
    mv SRR1536286.fastq SRR1536286_48h_rep2.fastq
    mv SRR1536283.fastq SRR1536283_control_rep1.fastq
    mv SRR1536284.fastq SRR1536284_control_rep2.fastq

elif [[ $1 == "mr_arsef" ]]
then
    # Metarhizium robertsii ARSEF 23 - Control conidia
    fasterq-dump -p SRR1063454

    # Metarhizium robertsii ARSEF 23 - Heat-treated conidia
    fasterq-dump -p SRR1063457

    mv SRR1063454.fastq SRR1063454_control.fastq
    mv SRR1063457.fastq SRR1063457_heat.fastq
else
    echo "Error!"
fi