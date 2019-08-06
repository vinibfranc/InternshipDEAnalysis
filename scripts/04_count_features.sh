#!/bin/bash
set -e
set -u
set -o pipefail

cd ..
mkdir -p htseq
cd star

htseq-count --stranded=no --format=bam --idattr=gene_name \
            SRR1536283_control_rep1Aligned.out.bam SRR1536284_control_rep2Aligned.out.bam \
            SRR1536285_48h_rep1Aligned.out.bam SRR1536286_48h_rep2Aligned.out.bam \
            SRR1536287_144h_rep1Aligned.out.bam SRR1536288_144h_rep2Aligned.out.bam \
            ../reference_genome/GCA_000814975.1_MAN_1.0_genomic.gtf > ../htseq/count_table.txt