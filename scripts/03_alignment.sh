#!/bin/bash
set -e
set -u
set -o pipefail

REF="reference_genome"

if [[ $1 == "ma_e6" ]]
then
    mkdir -p $REF/index_ma
    mkdir -p "star/ma"

    cd $REF

    # Download Metarhizium anisopliae ARSEF 549 genome (FASTA file)
    wget ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/000/814/975/GCA_000814975.1_MAN_1.0/GCA_000814975.1_MAN_1.0_genomic.fna.gz
    gunzip GCA_000814975.1_MAN_1.0_genomic.fna.gz

    # Download Metarhizium anisopliae ARSEF 549 annotation (GTF file)
    wget ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/000/814/975/GCA_000814975.1_MAN_1.0/GCA_000814975.1_MAN_1.0_genomic.gff.gz
    gunzip GCA_000814975.1_MAN_1.0_genomic.gff.gz

    # Convert NCBI GFF to GTF
    gffread GCA_000814975.1_MAN_1.0_genomic.gff -T -o GCA_000814975.1_MAN_1.0_genomic.gtf

    cd ../scripts

    # Build index
    STAR --runThreadN 4 --runMode genomeGenerate --genomeDir ../reference_genome/index_ma \
        --genomeFastaFiles ../reference_genome/GCA_000814975.1_MAN_1.0_genomic.fna --genomeSAindexNbases 11 \
        --sjdbGTFfile ../reference_genome/GCA_000814975.1_MAN_1.0_genomic.gtf --sjdbOverhang 75-1

    # Run mapping
    STAR --runThreadN 4 --genomeDir ../reference_genome/index_ma --sjdbGTFtagExonParentGene=gene_name \
        --readFilesIn ../samples/q24_ma/SRR1536283_control_rep1_trimmed.fq \
        --outFileNamePrefix ../star/ma/SRR1536283_control_rep1 --outSAMtype BAM Unsorted
        #--quantMode TranscriptomeSAM GeneCounts \

    STAR --runThreadN 4 --genomeDir ../reference_genome/index_ma --sjdbGTFtagExonParentGene=gene_name \
        --readFilesIn ../samples/q24_ma/SRR1536284_control_rep2_trimmed.fq \
        --outFileNamePrefix ../star/ma/SRR1536284_control_rep2 --outSAMtype BAM Unsorted

    STAR --runThreadN 4 --genomeDir ../reference_genome/index_ma --sjdbGTFtagExonParentGene=gene_name \
        --readFilesIn ../samples/q24_ma/SRR1536285_48h_rep1_trimmed.fq \
        --outFileNamePrefix ../star/ma/SRR1536285_48h_rep1 --outSAMtype BAM Unsorted

    STAR --runThreadN 4 --genomeDir ../reference_genome/index_ma --sjdbGTFtagExonParentGene=gene_name \
        --readFilesIn ../samples/q24_ma/SRR1536286_48h_rep2_trimmed.fq \
        --outFileNamePrefix ../star/ma/SRR1536286_48h_rep2 --outSAMtype BAM Unsorted

    STAR --runThreadN 4 --genomeDir ../reference_genome/index_ma --sjdbGTFtagExonParentGene=gene_name \
        --readFilesIn ../samples/q24_ma/SRR1536287_144h_rep1_trimmed.fq \
        --outFileNamePrefix ../star/ma/SRR1536287_144h_rep1 --outSAMtype BAM Unsorted

    STAR --runThreadN 4 --genomeDir ../reference_genome/index_ma --sjdbGTFtagExonParentGene=gene_name \
        --readFilesIn ../samples/q24_ma/SRR1536288_144h_rep2_trimmed.fq \
        --outFileNamePrefix ../star/ma/SRR1536288_144h_rep2 --outSAMtype BAM Unsorted

elif [[ $1 == "mr_arsef" ]]
then
    mkdir -p $REF/index_mr
    mkdir -p "../star/mr"

    cd $REF

    # Download Metarhizium robertsii ARSEF 23 genome (FASTA file)
    wget ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/187/425/GCF_000187425.2_MAA_2.0/GCF_000187425.2_MAA_2.0_genomic.fna.gz
    gunzip GCF_000187425.2_MAA_2.0_genomic.fna.gz

    # Download Metarhizium robertsii ARSEF 23 annotation (GTF file)
    wget ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/187/425/GCF_000187425.2_MAA_2.0/GCF_000187425.2_MAA_2.0_genomic.gff.gz
    gunzip GCF_000187425.2_MAA_2.0_genomic.gff.gz

    # Convert NCBI GFF to GTF
    gffread GCF_000187425.2_MAA_2.0_genomic.gff -T -o GCF_000187425.2_MAA_2.0_genomic.gtf

    cd ../scripts

    # Build index
    STAR --runThreadN 4 --runMode genomeGenerate --genomeDir ../reference_genome/index_mr \
        --genomeFastaFiles ../reference_genome/GCF_000187425.2_MAA_2.0_genomic.fna --genomeSAindexNbases 11 \
        --sjdbGTFfile ../reference_genome/GCF_000187425.2_MAA_2.0_genomic.gtf --sjdbOverhang 49-1

    # Run mapping
    STAR --runThreadN 4 --genomeDir ../reference_genome/index_mr --sjdbGTFtagExonParentGene=gene_name \
        --readFilesIn ../samples/q30_mr/SRR1063454_control_trimmed.fq \
        --outFileNamePrefix ../star/mr/SRR1063454_control --outSAMtype BAM Unsorted

    STAR --runThreadN 4 --genomeDir ../reference_genome/index_mr --sjdbGTFtagExonParentGene=gene_name \
        --readFilesIn ../samples/q30_mr/SRR1063457_heat_trimmed.fq \
        --outFileNamePrefix ../star/mr/SRR1063457_heat --outSAMtype BAM Unsorted

else
    echo "Error!"
fi