## This analysis was based on: http://www.nathalievialaneix.eu/doc/html/solution_edgeR-tomato-withcode.html

## Install biconductor
if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
BiocManager::install()

## Install packages needed
BiocManager::install("edgeR")
BiocManager::install("limma")
BiocManager::install("mixOmics")
BiocManager::install("DESeq2")
BiocManager::install("HTSFilter")

## Loading required package
library(edgeR)
library(limma)
library(RColorBrewer)
library(mixOmics)
library(HTSFilter)

## Get working dir 
directory <- getwd()
dir(directory)

## Load read counts per sample file and the experiment design
rawCountTable <- read.table("ma_count_table_formatted.txt", header=TRUE, sep="\t", row.names=1)
sampleInfo <- read.table("ma_design.csv", header=TRUE, sep=",", row.names=1)

## Look the count data 
head(rawCountTable)

## Count genes included in count file
nrow(rawCountTable)

## Create a DGEList data object containing counts and sample info
dgeFull <- DGEList(rawCountTable, group=sampleInfo$condition)
dgeFull

## Extract pseudo-counts (ie log2(K+1)) for data exploration and quality assessment
pseudoCounts <- log2(dgeFull$counts+1)
head(pseudoCounts)

## Plot a histogram for pseudo-counts in Cond.C_48h.Rep.1
hist(pseudoCounts[,"Cond.C_48h.Rep.1"])
hist(pseudoCounts[,"Cond.C_48h.Rep.2"])
hist(pseudoCounts[,"Cond.I_48h.Rep.1"])
hist(pseudoCounts[,"Cond.I_48h.Rep.2"])
hist(pseudoCounts[,"Cond.I_144h.Rep.1"])
hist(pseudoCounts[,"Cond.I_144h.Rep.2"])

## Plot a boxplot for pseudo-counts
boxplot(pseudoCounts, col="gray", las=3)

##### Compare between samples #####

## MA-plot between C_48h and I_48h
par(mfrow=c(1,3))
# A values
avalues_comp1 <- (pseudoCounts[,1] + pseudoCounts[,2])/2
# M values
mvalues_comp1 <- (pseudoCounts[,1] - pseudoCounts[,2])
plot(avalues_comp1, mvalues_comp1, xlab="A", ylab="M", pch=19, main="C_48h vs I_48h")
abline(h=0, col="red")

## MA-plot between I_48h and I_144hh
# A values
avalues_comp2 <- (pseudoCounts[,2] + pseudoCounts[,3])/2
# M values
mvalues_comp2 <- (pseudoCounts[,2] - pseudoCounts[,3])
plot(avalues_comp2, mvalues_comp2, xlab="A", ylab="M", pch=19, main="I_48h vs I_144h")
abline(h=0, col="red")

## MA-plot between C_48h and I_144h
# A values
avalues_comp3 <- (pseudoCounts[,1] + pseudoCounts[,3])/2
# M values
mvalues_comp3 <- (pseudoCounts[,1] - pseudoCounts[,3])
plot(avalues_comp3, mvalues_comp3, xlab="A", ylab="M", pch=19, main="C_48h vs I_144h")
abline(h=0, col="red")

par(mfrow=c(1,1))
## MDS for pseudo-counts (using limma package)
plotMDS(pseudoCounts)

## Heatmap for pseudo-counts (using mixOmics package)
sampleDists <- as.matrix(dist(t(pseudoCounts)))
sampleDists

cimColor <- colorRampPalette(rev(brewer.pal(9, "Blues")))(16)
X11()
cim(sampleDists, color=cimColor, symkey=FALSE)
dev.off() 

## Remove genes with zero counts for all samples
dgeFull <- DGEList(dgeFull$counts[apply(dgeFull$counts, 1, sum) != 0, ],
                   group=dgeFull$samples$group)
head(dgeFull$counts)

# Estimate the normalization factors
dgeFull <- calcNormFactors(dgeFull, method="TMM")
dgeFull$samples

head(dgeFull$counts)

## Find the normalized counts and use the log2-transformation to inspect them with boxplots and a MDS
eff.lib.size <- dgeFull$samples$lib.size*dgeFull$samples$norm.factors
normCounts <- cpm(dgeFull)
pseudoNormCounts <- log2(normCounts + 1)
boxplot(pseudoNormCounts, col="gray", las=3)

plotMDS(pseudoNormCounts)

group <- factor(c(1,1,2,2,3,3))
design <- model.matrix(~group)

## Estimate common and tagwise dispersion
dgeFull <- estimateCommonDisp(dgeFull, design)
#dgeFull <- estimateTagwiseDisp(dgeFull, design)
dgeFull

## Perform an exact test for the difference in expression between the 3 conditions "C_48h", "I_48h" and "I_144h"
dgeTestFit <- glmQLFit(dgeFull,design)
dgeTest <- glmQLFTest(dgeTestFit,coef=3)
topTags(dgeTest)

## Independent filtering to remove low expressed genes
filtData <- HTSFilter(dgeFull)$filteredData

dgeTestFitFilt <- glmQLFit(dgeFull,design)
dgeTestFilt <- glmQLFTest(dgeTestFitFilt, coef=3)
dgeTestFilt

## Diagnostic plot for multiple testing

## Plot an histogram of unadjusted p-values
hist(dgeTest$table[,"PValue"], breaks=50)

## Plot an histogram of unadjusted p-values after filtering
hist(dgeTestFilt$table[,"PValue"], breaks=50)

## Inspecting the results

## Extract a summary of the differential expression statistics
resNoFilt <- topTags(dgeTest, n=nrow(dgeTest$table))
#head(resNoFilt)

resFilt <- topTags(dgeTestFilt, n=nrow(dgeTest$table))
#head(resFilt)

## Compare the number of differentially expressed genes with and without filtering (risk: 1%)

## Before independent filtering
sum(resNoFilt$table$FDR < 0.01)

## After independent filtering
sum(resFilt$table$FDR < 0.01)

## Extract and sort differentially expressed genes

## Downregulated genes
sigDownReg <- resFilt$table[resFilt$table$FDR<0.01,]
sigDownReg <- sigDownReg[order(sigDownReg$logFC),]
head(sigDownReg)

## Upregulated genes
sigUpReg <- sigDownReg[order(sigDownReg$logFC, decreasing=TRUE),]
head(sigUpReg)

## Write the results in csv files
write.csv(sigDownReg, file="sigDownReg_e6_new.csv")
write.csv(sigUpReg, file="sigUpReg_e6_new.csv")

## Interpreting the DE analysis results

## Create a MA plot with 1% differentially expressed genes
plotSmear(dgeTestFilt,
          de.tags = rownames(resFilt$table)[which(resFilt$table$FDR<0.01)])

## Create a Volcano plot
volcanoData <- cbind(resFilt$table$logFC, -log10(resFilt$table$FDR))
colnames(volcanoData) <- c("logFC", "negLogPval")
head(volcanoData)

plot(volcanoData, pch=19)

## Transform the normalized counts in log-counts-per-million
y <- cpm(dgeFull, log=TRUE, prior.count = 1)
head(y)

## Select 1% differentially expressed genes and produce a heatmap
selY <- y[rownames(resFilt$table)[resFilt$table$FDR<0.01 & 
                                    abs(resFilt$table$logFC)>1.5],]
head(selY)

cimColor <- colorRampPalette(rev(brewer.pal(9, "Blues")))(255)[255:1]

X11()
finalHM <- cim(t(selY), color=cimColor, symkey=FALSE)
dev.off()

## Gene clustering details
plot(finalHM$ddc, leaflab="none")
abline(h=10, lwd=2, col="pink")

## Using this dendrogram, we might want to cut the tree at level h=10
geneClust <- cutree(as.hclust(finalHM$ddc), h=10)
head(geneClust)

## Get the nnumber of clusters
length(unique(geneClust))

## Get the genes in cluster 1
names(which(geneClust==1))
  
