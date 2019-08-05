#!/bin/bash
set -e
set -u
set -o pipefail

REF="../reference_genome"
mkdir -p $REF/index
FILES="../samples/q24"
mkdir -p "../star"

# cd $REF

# # Download Metarhizium anisopliae ARSEF 549 genome (FASTA file)
# wget ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/000/814/975/GCA_000814975.1_MAN_1.0/GCA_000814975.1_MAN_1.0_genomic.fna.gz
# gunzip GCA_000814975.1_MAN_1.0_genomic.fna.gz

# # Download Metarhizium anisopliae ARSEF 549 annotation (GTF file)
# wget ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/000/814/975/GCA_000814975.1_MAN_1.0/GCA_000814975.1_MAN_1.0_genomic.gff.gz
# gunzip GCA_000814975.1_MAN_1.0_genomic.gff.gz

# cd ../scripts

# # Build index
# STAR --runThreadN 4 --runMode genomeGenerate --genomeDir ../reference_genome/index \
#      --genomeFastaFiles ../reference_genome/GCA_000814975.1_MAN_1.0_genomic.fna --genomeSAindexNbases 11 \
#      --sjdbGTFfile ../reference_genome/GCA_000814975.1_MAN_1.0_genomic.gff --sjdbOverhang 75-1

# Run mapping
STAR --runThreadN 4 --genomeDir ../reference_genome/index \
    --readFilesIn ../samples/q24/SRR1536283_control_rep1_trimmed.fq \
    --outFileNamePrefix ../star/SRR1536283_control_rep1 --outSAMtype BAM Unsorted

STAR --runThreadN 4 --genomeDir ../reference_genome/index \
    --readFilesIn ../samples/q24/SRR1536284_control_rep2_trimmed.fq \
    --outFileNamePrefix ../star/SRR1536284_control_rep2 --outSAMtype BAM Unsorted

STAR --runThreadN 4 --genomeDir ../reference_genome/index \
    --readFilesIn ../samples/q24/SRR1536285_48h_rep1_trimmed.fq \
    --outFileNamePrefix ../star/SRR1536285_48h_rep1 --outSAMtype BAM Unsorted

STAR --runThreadN 4 --genomeDir ../reference_genome/index \
    --readFilesIn ../samples/q24/SRR1536286_48h_rep2_trimmed.fq \
    --outFileNamePrefix ../star/SRR1536286_48h_rep2 --outSAMtype BAM Unsorted

STAR --runThreadN 4 --genomeDir ../reference_genome/index \
    --readFilesIn ../samples/q24/SRR1536287_144h_rep1_trimmed.fq \
    --outFileNamePrefix ../star/SRR1536287_144h_rep1_trimmed --outSAMtype BAM Unsorted

STAR --runThreadN 4 --genomeDir ../reference_genome/index \
    --readFilesIn ../samples/q24/SRR1536288_144h_rep2_trimmed.fq \
    --outFileNamePrefix ../star/SRR1536288_144h_rep2 --outSAMtype BAM Unsorted