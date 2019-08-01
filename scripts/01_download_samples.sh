#!/bin/bash
set -e
set -u
set -o pipefail

sudo apt-get install sra-toolkit

cd ..
mkdir -p samples
cd samples

# Metarhizium anisopliae E6 transcriptome - I-144h (144 h tick cuticle infection condition)
fastq-dump SRR1536287
fastq-dump SRR1536288

# Metarhizium anisopliae E6 transcriptome - I-48h (48 h tick cuticle infection condition)
fastq-dump SRR1536285
fastq-dump SRR1536286

# Metarhizium anisopliae E6 transcriptome - C-48h (Control condition)
fastq-dump SRR1536283
fastq-dump SRR1536284

# Rename files
mv SRR1536287.fastq SRR1536287_144h.fastq
mv SRR1536288.fastq SRR1536288_144h.fastq
mv SRR1536285.fastq SRR1536285_48h.fastq
mv SRR1536286.fastq SRR1536286_48h.fastq
mv SRR1536283.fastq SRR1536283_control.fastq
mv SRR1536284.fastq SRR1536284_control.fastq
