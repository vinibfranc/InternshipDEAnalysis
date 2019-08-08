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
rawCountTable <- read.table("mr_count_table.txt", header=TRUE, sep="\t", row.names=1)
sampleInfo <- read.table("mr_design.csv", header=TRUE, sep=",", row.names=1)

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

## Plot a histogram for pseudo-counts in control and heat conditions
hist(pseudoCounts[,"control"])
hist(pseudoCounts[,"heat"])

## Plot a boxplot for pseudo-counts
boxplot(pseudoCounts, col="gray", las=3)

##### Compare between samples #####

## MA-plot between control and heat conditions
par(mfrow=c(1,2))
# A values
avalues_comp1 <- (pseudoCounts[,1] + pseudoCounts[,2])/2
# M values
mvalues_comp1 <- (pseudoCounts[,1] - pseudoCounts[,2])
plot(avalues_comp1, mvalues_comp1, xlab="A", ylab="M", pch=19, main="control vs heat")
abline(h=0, col="red")

## MA-plot between control and heat conditions
# A values
avalues_comp2 <- (pseudoCounts[,2] + pseudoCounts[,1])/2
# M values
mvalues_comp2 <- (pseudoCounts[,2] - pseudoCounts[,1])
plot(avalues_comp2, mvalues_comp2, xlab="A", ylab="M", pch=19, main="heat vs control")
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

dgeFull <- DGEList(dgeFull$counts[apply(dgeFull$counts, 1, sum) != 0, ],
                   group=dgeFull$samples$group)
head(dgeFull$counts)

dgeFull <- calcNormFactors(dgeFull, method="TMM")
dgeFull$samples

head(dgeFull$counts)

eff.lib.size <- dgeFull$samples$lib.size*dgeFull$samples$norm.factors
normCounts <- cpm(dgeFull)
pseudoNormCounts <- log2(normCounts + 1)
boxplot(pseudoNormCounts, col="gray", las=3)