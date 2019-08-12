#!/bin/bash
set -e
set -u
set -o pipefail

mkdir -p orthofinder/proteins
cd orthofinder/proteins

#  Download Metarhizium anisopliae ARSEF 549 protein fasta file
wget ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/000/814/975/GCA_000814975.1_MAN_1.0/GCA_000814975.1_MAN_1.0_protein.faa.gz
gunzip GCA_000814975.1_MAN_1.0_protein.faa.gz
mv GCA_000814975.1_MAN_1.0_protein.faa metarhizium_anisopliae.faa

#  Download Metarhizium robertsii ARSEF 23 fasta file
wget ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/187/425/GCF_000187425.2_MAA_2.0/GCF_000187425.2_MAA_2.0_protein.faa.gz
gunzip GCF_000187425.2_MAA_2.0_protein.faa.gz
mv GCF_000187425.2_MAA_2.0_protein.faa metarhizium_robertsii.faa

cd ..

orthofinder -f proteins/ -S diamond