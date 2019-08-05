#!/bin/bash
set -e
set -u
set -o pipefail

cd ..
mkdir -p tools
cd tools

##### Download samples #####

#sudo apt-get install sra-toolkit
wget http://ftp-trace.ncbi.nlm.nih.gov/sra/sdk/2.9.6-1/sratoolkit.2.9.6-1-ubuntu64.tar.gz
tar xzvf sratoolkit.2.9.6-1-ubuntu64.tar.gz
#export PATH=$PATH:/home/vinibfranc/Estagio/Analysis/InternshipDEAnalysis/tools/sratoolkit.2.9.6-1-ubuntu64/bin:$PATH 
#export PATH=/home/lmmc-219/Vinicius/real_analysis/InternshipDEAnalysis/tools/sratoolkit.2.9.6-1-ubuntu64/bin:$PATH

##### FASTQC installation #####

sudo apt-get install fastqc
# Dependencies installation
sudo apt-get install python3
sudo apt-get install python3-pip
pip3 install --upgrade cutadapt
sudo apt-get install curl

##### Trim Galore installation #####

curl -fsSL https://github.com/FelixKrueger/TrimGalore/archive/0.6.0.tar.gz -o trim_galore.tar.gz
tar xvzf trim_galore.tar.gz
#export PATH=/home/vinibfranc/Estagio/Analysis/InternshipDEAnalysis/tools/TrimGalore-0.6.0:$PATH
#export PATH=/home/lmmc-219/Vinicius/real_analysis/InternshipDEAnalysis/tools/TrimGalore-0.6.0:$PATH
# Used to permit multiple cores inside TrimGalore
sudo apt-get install -y pigz

##### STAR installation #####
sudo apt-get install g++
sudo apt-get install make

wget https://github.com/alexdobin/STAR/archive/2.7.1a.tar.gz
tar xvzf 2.7.1a.tar.gz
#export PATH=/home/vinibfranc/Estagio/Analysis/InternshipDEAnalysis/tools/STAR-2.7.1a/bin/Linux_x86_64:$PATH
#export PATH=/home/lmmc-219/Vinicius/real_analysis/InternshipDEAnalysis/tools/STAR-2.7.1a/bin/Linux_x86_64:$PATH