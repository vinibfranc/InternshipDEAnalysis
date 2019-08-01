#!/bin/bash
set -e
set -u
set -o pipefail

cd ..
cd samples

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
# Run Trim Galore
TrimGalore-0.6.0/trim_galore
export PATH=/home/lmmc-219/Vinicius/real_analysis/InternshipDEAnalysis/tools/TrimGalore-0.6.0:$PATH

# View quality before trimming
fastqc *.fastq

# Trim sequences
# TO-DO

# View quality after trimming
# TO-DO