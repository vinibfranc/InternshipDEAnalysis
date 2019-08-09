#!/bin/bash
set -e
set -u
set -o pipefail

if [[ $1 == "ma_e6" ]]
then
    mkdir -p htseq/ma
    cd star/ma

    htseq-count --stranded=no --format=bam --idattr=gene_name \
                SRR1536283_control_rep1Aligned.out.bam SRR1536284_control_rep2Aligned.out.bam \
                SRR1536285_48h_rep1Aligned.out.bam SRR1536286_48h_rep2Aligned.out.bam \
                SRR1536287_144h_rep1Aligned.out.bam SRR1536288_144h_rep2Aligned.out.bam \
                /home/lmmc-219/Vinicius/real_analysis/InternshipDEAnalysis/reference_genome/GCA_000814975.1_MAN_1.0_genomic.gtf > /home/lmmc-219/Vinicius/real_analysis/InternshipDEAnalysis/htseq/ma/count_table.txt

elif [[ $1 == "mr_arsef" ]]
then
    mkdir -p htseq/mr
    touch htseq/mr/count_table.txt
    cd star/mr

    htseq-count --stranded=no --format=bam --idattr=gene_name \
                SRR1063454_controlAligned.out.bam SRR1063457_heatAligned.out.bam \
                /home/lmmc-219/Vinicius/real_analysis/InternshipDEAnalysis/reference_genome/GCF_000187425.2_MAA_2.0_genomic.gtf > /home/lmmc-219/Vinicius/real_analysis/InternshipDEAnalysis/htseq/mr/count_table.txt
else
    echo "Error!"
fi