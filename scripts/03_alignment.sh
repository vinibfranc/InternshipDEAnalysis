#!/bin/bash
set -e
set -u
set -o pipefail

sudo apt-get install g++
sudo apt-get install make

cd ../tools
wget https://github.com/alexdobin/STAR/archive/2.7.1a.tar.gz
tar xvzf 2.7.1a.tar.gz
#export PATH=/home/lmmc-219/Vinicius/real_analysis/InternshipDEAnalysis/tools/STAR-2.7.1a/bin/Linux_x86_64:$PATH
#export PATH=/home/vinibfranc/Estagio/Analysis/InternshipDEAnalysis/tools/STAR-2.7.1a/bin/Linux_x86_64:$PATH

