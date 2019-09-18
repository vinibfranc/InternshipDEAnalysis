#!/bin/bash
set -e
set -u
set -o pipefail

# mkdir -p "functional_annotation/e6"
# cd functional_annotation/e6

# wget http://ekhidna2.biocenter.helsinki.fi/barcosel/tmp//7kMrYcrHcRK/PANZ_1.html
# wget http://ekhidna2.biocenter.helsinki.fi/barcosel/tmp//7kMrYcrHcRK/PANZ_2.html
# wget http://ekhidna2.biocenter.helsinki.fi/barcosel/tmp//7kMrYcrHcRK/PANZ_3.html
# wget http://ekhidna2.biocenter.helsinki.fi/barcosel/tmp//7kMrYcrHcRK/PANZ_4.html
# wget http://ekhidna2.biocenter.helsinki.fi/barcosel/tmp//7kMrYcrHcRK/PANZ_5.html
# wget http://ekhidna2.biocenter.helsinki.fi/barcosel/tmp//7kMrYcrHcRK/PANZ_6.html
# wget http://ekhidna2.biocenter.helsinki.fi/barcosel/tmp//7kMrYcrHcRK/PANZ_7.html
# wget http://ekhidna2.biocenter.helsinki.fi/barcosel/tmp//7kMrYcrHcRK/PANZ_8.html
# wget http://ekhidna2.biocenter.helsinki.fi/barcosel/tmp//7kMrYcrHcRK/PANZ_9.html
# wget http://ekhidna2.biocenter.helsinki.fi/barcosel/tmp//7kMrYcrHcRK/PANZ_10.html
# wget http://ekhidna2.biocenter.helsinki.fi/barcosel/tmp//7kMrYcrHcRK/PANZ_11.html
# wget http://ekhidna2.biocenter.helsinki.fi/barcosel/tmp//7kMrYcrHcRK/anno.out
# wget http://ekhidna2.biocenter.helsinki.fi/barcosel/tmp//7kMrYcrHcRK/DE.out
# wget http://ekhidna2.biocenter.helsinki.fi/barcosel/tmp//7kMrYcrHcRK/GO.out
# wget http://ekhidna2.biocenter.helsinki.fi/barcosel/tmp/4018eebc94c8fb3828801372809dc4921db36c0842b9978a253f0d54/input.fasta

mkdir -p "functional_annotation/anisopliae_arsef549"
cd functional_annotation/arsef549

wget http://ekhidna2.biocenter.helsinki.fi/barcosel/tmp//vwStRJ9m8rM/PANZ_1.html
wget http://ekhidna2.biocenter.helsinki.fi/barcosel/tmp//vwStRJ9m8rM/PANZ_2.html
wget http://ekhidna2.biocenter.helsinki.fi/barcosel/tmp//vwStRJ9m8rM/PANZ_3.html
wget http://ekhidna2.biocenter.helsinki.fi/barcosel/tmp//vwStRJ9m8rM/PANZ_4.html
wget http://ekhidna2.biocenter.helsinki.fi/barcosel/tmp//vwStRJ9m8rM/PANZ_5.html
wget http://ekhidna2.biocenter.helsinki.fi/barcosel/tmp//vwStRJ9m8rM/PANZ_6.html
wget http://ekhidna2.biocenter.helsinki.fi/barcosel/tmp//vwStRJ9m8rM/PANZ_7.html
wget http://ekhidna2.biocenter.helsinki.fi/barcosel/tmp//vwStRJ9m8rM/PANZ_8.html
wget http://ekhidna2.biocenter.helsinki.fi/barcosel/tmp//vwStRJ9m8rM/PANZ_9.html
wget http://ekhidna2.biocenter.helsinki.fi/barcosel/tmp//vwStRJ9m8rM/PANZ_10.html
wget http://ekhidna2.biocenter.helsinki.fi/barcosel/tmp//vwStRJ9m8rM/PANZ_11.html
wget http://ekhidna2.biocenter.helsinki.fi/barcosel/tmp//vwStRJ9m8rM/anno.out
wget http://ekhidna2.biocenter.helsinki.fi/barcosel/tmp//vwStRJ9m8rM/DE.out
wget http://ekhidna2.biocenter.helsinki.fi/barcosel/tmp//vwStRJ9m8rM/GO.out
wget http://ekhidna2.biocenter.helsinki.fi/barcosel/tmp/6236059f4924ee1fc656014d5670d0afa745b5c7f92943acce784bf8/input.fasta

cd ../..

mkdir -p "functional_annotation/robertsii_arsef23"
cd functional_annotation/robertsii_arsef23

wget http://ekhidna2.biocenter.helsinki.fi/barcosel/tmp//p7AbnuITpPg/PANZ_1.html
wget http://ekhidna2.biocenter.helsinki.fi/barcosel/tmp//p7AbnuITpPg/PANZ_2.html
wget http://ekhidna2.biocenter.helsinki.fi/barcosel/tmp//p7AbnuITpPg/PANZ_3.html
wget http://ekhidna2.biocenter.helsinki.fi/barcosel/tmp//p7AbnuITpPg/PANZ_4.html
wget http://ekhidna2.biocenter.helsinki.fi/barcosel/tmp//p7AbnuITpPg/PANZ_5.html
wget http://ekhidna2.biocenter.helsinki.fi/barcosel/tmp//p7AbnuITpPg/PANZ_6.html
wget http://ekhidna2.biocenter.helsinki.fi/barcosel/tmp//p7AbnuITpPg/PANZ_9.html
wget http://ekhidna2.biocenter.helsinki.fi/barcosel/tmp//p7AbnuITpPg/PANZ_10.html
wget http://ekhidna2.biocenter.helsinki.fi/barcosel/tmp//p7AbnuITpPg/PANZ_11.html
wget http://ekhidna2.biocenter.helsinki.fi/barcosel/tmp//p7AbnuITpPg/PANZ_12.html
wget http://ekhidna2.biocenter.helsinki.fi/barcosel/tmp//p7AbnuITpPg/anno.out
wget http://ekhidna2.biocenter.helsinki.fi/barcosel/tmp//p7AbnuITpPg/DE.out
wget http://ekhidna2.biocenter.helsinki.fi/barcosel/tmp//p7AbnuITpPg/GO.out
wget http://ekhidna2.biocenter.helsinki.fi/barcosel/tmp/41230a2570301c66ca8454395804ee4a6f65e50982d9d01423740c9c/input.fasta

cd ../../all_files_to_upload
# Convert column with only GO code to GO:code
awk -F'\t' -vOFS='\t' '{ $4 = "GO:" $4 }1' anisopliae_arsef_549.tsv > anisopliae_arsef_549_formatted.tsv
awk -F'\t' -vOFS='\t' '{ $4 = "GO:" $4 }1' robertsii_arsef_23.tsv > robertsii_arsef_23_formatted.tsv