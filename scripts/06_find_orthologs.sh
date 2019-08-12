#!/bin/bash
set -e
set -u
set -o pipefail

mkdir -p orthofinder/proteins
cd orthofinder/proteins

#  Download Metarhizium anisopliae E6 protein fasta file
wget ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/000/739/145/GCA_000739145.1_Metarhizium_anisopliae/GCA_000739145.1_Metarhizium_anisopliae_protein.faa.gz
gunzip GCA_000739145.1_Metarhizium_anisopliae_protein.faa.gz
mv GCA_000739145.1_Metarhizium_anisopliae_protein.faa metarhizium_anisopliae.faa

#  Download Metarhizium robertsii ARSEF 23 fasta file
wget ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/187/425/GCF_000187425.2_MAA_2.0/GCF_000187425.2_MAA_2.0_protein.faa.gz
gunzip GCF_000187425.2_MAA_2.0_protein.faa.gz
mv GCF_000187425.2_MAA_2.0_protein.faa metarhizium_robertsii.faa

cd ..

orthofinder -f proteins/ -S diamond