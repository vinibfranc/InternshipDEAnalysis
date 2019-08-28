#!/bin/bash
set -e
set -u
set -o pipefail

mkdir -p "functional_annotation/e6"
cd functional_annotation/e6

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

mkdir -p "functional_annotation/arsef549"
cd functional_annotation/arsef549

wget http://ekhidna2.biocenter.helsinki.fi/barcosel/tmp//ACV26ZqppdX/PANZ_1.html
wget http://ekhidna2.biocenter.helsinki.fi/barcosel/tmp//ACV26ZqppdX/PANZ_2.html
wget http://ekhidna2.biocenter.helsinki.fi/barcosel/tmp//ACV26ZqppdX/PANZ_3.html
wget http://ekhidna2.biocenter.helsinki.fi/barcosel/tmp//ACV26ZqppdX/PANZ_4.html
wget http://ekhidna2.biocenter.helsinki.fi/barcosel/tmp//ACV26ZqppdX/PANZ_5.html
wget http://ekhidna2.biocenter.helsinki.fi/barcosel/tmp//ACV26ZqppdX/PANZ_6.html
wget http://ekhidna2.biocenter.helsinki.fi/barcosel/tmp//ACV26ZqppdX/PANZ_7.html
wget http://ekhidna2.biocenter.helsinki.fi/barcosel/tmp//ACV26ZqppdX/PANZ_8.html
wget http://ekhidna2.biocenter.helsinki.fi/barcosel/tmp//ACV26ZqppdX/PANZ_9.html
wget http://ekhidna2.biocenter.helsinki.fi/barcosel/tmp//ACV26ZqppdX/PANZ_10.html
wget http://ekhidna2.biocenter.helsinki.fi/barcosel/tmp//ACV26ZqppdX/PANZ_11.html
wget http://ekhidna2.biocenter.helsinki.fi/barcosel/tmp//ACV26ZqppdX/anno.out
wget http://ekhidna2.biocenter.helsinki.fi/barcosel/tmp//ACV26ZqppdX/DE.out
wget http://ekhidna2.biocenter.helsinki.fi/barcosel/tmp//ACV26ZqppdX/GO.out
wget http://ekhidna2.biocenter.helsinki.fi/barcosel/tmp/6236059f4924ee1fc656014d5670d0afa745b5c7f92943acce784bf8/input.fasta

mkdir -p "functional_annotation/robertsii_arsef23"
cd functional_annotation/robertsii_arsef23

wget http://ekhidna2.biocenter.helsinki.fi/barcosel/tmp//Sbdu11fBlnP/PANZ_1.html
wget http://ekhidna2.biocenter.helsinki.fi/barcosel/tmp//Sbdu11fBlnP/PANZ_2.html
wget http://ekhidna2.biocenter.helsinki.fi/barcosel/tmp//Sbdu11fBlnP/PANZ_3.html
wget http://ekhidna2.biocenter.helsinki.fi/barcosel/tmp//Sbdu11fBlnP/PANZ_4.html
wget http://ekhidna2.biocenter.helsinki.fi/barcosel/tmp//Sbdu11fBlnP/PANZ_5.html
wget http://ekhidna2.biocenter.helsinki.fi/barcosel/tmp//Sbdu11fBlnP/PANZ_6.html
wget http://ekhidna2.biocenter.helsinki.fi/barcosel/tmp//Sbdu11fBlnP/PANZ_7.html
wget http://ekhidna2.biocenter.helsinki.fi/barcosel/tmp//Sbdu11fBlnP/PANZ_8.html
wget http://ekhidna2.biocenter.helsinki.fi/barcosel/tmp//Sbdu11fBlnP/PANZ_9.html
wget http://ekhidna2.biocenter.helsinki.fi/barcosel/tmp//Sbdu11fBlnP/PANZ_10.html
wget http://ekhidna2.biocenter.helsinki.fi/barcosel/tmp//Sbdu11fBlnP/PANZ_11.html
wget http://ekhidna2.biocenter.helsinki.fi/barcosel/tmp//Sbdu11fBlnP/PANZ_12.html
wget http://ekhidna2.biocenter.helsinki.fi/barcosel/tmp//Sbdu11fBlnP/anno.out
wget http://ekhidna2.biocenter.helsinki.fi/barcosel/tmp//Sbdu11fBlnP/DE.out
wget http://ekhidna2.biocenter.helsinki.fi/barcosel/tmp//Sbdu11fBlnP/GO.out
wget http://ekhidna2.biocenter.helsinki.fi/barcosel/tmp/41230a2570301c66ca8454395804ee4a6f65e50982d9d01423740c9c/input.fasta