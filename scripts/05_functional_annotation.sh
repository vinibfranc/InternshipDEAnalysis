#!/bin/bash
set -e
set -u
set -o pipefail

mkdir -p "../functional_annotation"
cd ../functional_annotation

wget http://ekhidna2.biocenter.helsinki.fi/barcosel/tmp//7kMrYcrHcRK/PANZ_1.html
wget http://ekhidna2.biocenter.helsinki.fi/barcosel/tmp//7kMrYcrHcRK/PANZ_2.html
wget http://ekhidna2.biocenter.helsinki.fi/barcosel/tmp//7kMrYcrHcRK/PANZ_3.html
wget http://ekhidna2.biocenter.helsinki.fi/barcosel/tmp//7kMrYcrHcRK/PANZ_4.html
wget http://ekhidna2.biocenter.helsinki.fi/barcosel/tmp//7kMrYcrHcRK/PANZ_5.html
wget http://ekhidna2.biocenter.helsinki.fi/barcosel/tmp//7kMrYcrHcRK/PANZ_6.html
wget http://ekhidna2.biocenter.helsinki.fi/barcosel/tmp//7kMrYcrHcRK/PANZ_7.html
wget http://ekhidna2.biocenter.helsinki.fi/barcosel/tmp//7kMrYcrHcRK/PANZ_8.html
wget http://ekhidna2.biocenter.helsinki.fi/barcosel/tmp//7kMrYcrHcRK/PANZ_9.html
wget http://ekhidna2.biocenter.helsinki.fi/barcosel/tmp//7kMrYcrHcRK/PANZ_10.html
wget http://ekhidna2.biocenter.helsinki.fi/barcosel/tmp//7kMrYcrHcRK/PANZ_11.html
wget http://ekhidna2.biocenter.helsinki.fi/barcosel/tmp//7kMrYcrHcRK/anno.out
wget http://ekhidna2.biocenter.helsinki.fi/barcosel/tmp//7kMrYcrHcRK/DE.out
wget http://ekhidna2.biocenter.helsinki.fi/barcosel/tmp//7kMrYcrHcRK/GO.out
wget http://ekhidna2.biocenter.helsinki.fi/barcosel/tmp/4018eebc94c8fb3828801372809dc4921db36c0842b9978a253f0d54/input.fasta