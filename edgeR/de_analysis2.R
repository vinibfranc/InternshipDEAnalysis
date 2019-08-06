## Install biconductor
if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
BiocManager::install()

## Install packages needed
BiocManager::install("edgeR")
BiocManager::install("gplots")
BiocManager::install("baySeq")

library(edgeR)
library(baySeq)
library(gplots)

# Load data from computer
mtrx_counts <- as.matrix(read.table("count_table_formatted2.txt", header=TRUE, sep="\t", row.names=1))

# Making Groups for the MobData

group <- factor(c("CondC_48h","CondC_48h", "CondI_48h", "CondI_48h", "CondI_144h", "CondI_144h"))
design <- model.matrix(~0+group)
design

# Quick Filtering, Normalization, and Making a DGEList object

# Starting count dimensions
dim(mtrx_counts)

# Filter. At least 100 cpm in atleast 2 samples or discard
dgeFull <- dgeFull[rowSums(cpm(dgeFull)>100) >= 2,]
dim(dgeFull)

# Make the DGEList
cur_DGELIST <- DGEList(counts=dgeFull, group=group)
# Use TMM normalization
cur_DGELIST <- calcNormFactors(cur_DGELIST)

# Visualizing the data
plotMDS(cur_DGELIST, method="bcv", col=as.numeric( cur_DGELIST$samples$group))
legend("topleft", as.character( unique( cur_DGELIST$samples$group )), col=1:3, pch=20)

# Estimating Your Dispersions for GLM
cur_DGELIST <- estimateGLMCommonDisp(cur_DGELIST, design)
cur_DGELIST <- estimateGLMTrendedDisp(cur_DGELIST, design)
cur_DGELIST <- estimateGLMTagwiseDisp(cur_DGELIST, design)

# Fitting and Making Comparisons
fit <- glmFit(cur_DGELIST, design)

# Contrast group C_48h vs I_48h
contrast_C48h_v_I48h <- glmLRT(fit, contrast=makeContrasts(groupCondC_48h-groupCondI_48h, levels=design))

# Contrast group C_48h vs I_144h
contrast_C48h_v_I144h <- glmLRT(fit, contrast=makeContrasts(groupCondC_48h-groupCondI_144h, levels=design))

# Contrast group I_48h vs I_144h
contrast_I48h_v_I144h <- glmLRT(fit, contrast=makeContrasts(groupCondI_48h-groupCondI_144h, levels=design))

topTags(contrast_C48h_v_I48h, n=10)
topTags(contrast_C48h_v_I144h, n=10)
topTags(contrast_I48h_v_I144h, n=10)

##### Smear plot of different comparisons #####

dt_significant <- decideTestsDGE(contrast_C48h_v_I48h, adjust.method="BH", p.value=0.05)
vctr_names_sig <- rownames(cur_DGELIST)[ as.logical(dt_significant)]
plotSmear(contrast_C48h_v_I48h, de.tags=vctr_names_sig, main="C48h vs I48h")
abline(h=c(-2, 2), col="blue")

dt_significant <- decideTestsDGE(contrast_C48h_v_I144h, adjust.method="BH", p.value=0.05)
vctr_names_sig <- rownames(cur_DGELIST)[ as.logical(dt_significant)]
plotSmear(contrast_C48h_v_I144h, de.tags=vctr_names_sig, main="C48h vs I144h")
abline(h=c(-2, 2), col="blue")

dt_significant <- decideTestsDGE(contrast_I48h_v_I144h, adjust.method="BH", p.value=0.05)
vctr_names_sig <- rownames(cur_DGELIST)[ as.logical(dt_significant)]
plotSmear(contrast_I48h_v_I144h, de.tags=vctr_names_sig, main="I48h vs I144h")
abline(h=c(-2, 2), col="blue")

##### HCL of Top Differentially Expressed Genes #####
vctr_names_top <- rownames(topTags(contrast_C48h_v_I48h, n=10))
vctr_names_top <- c(vctr_names_top, rownames(topTags(contrast_C48h_v_I144h, n=10)))
vctr_names_top <- unique(c(vctr_names_top, rownames(topTags(contrast_I48h_v_I144h, n=10))))

vctr_names_top <- rownames(topTags(contrast_C48h_v_I48h, n = 10))
vctr_names_top <- c(vctr_names_top, rownames(topTags(contrast_C48h_v_I144h, n = 10)))
vctr_names_top <- unique(c(vctr_names_top, rownames( topTags(contrast_I48h_v_I144h, n = 10))))

vctr_sig <- as.logical(decideTestsDGE(contrast_C48h_v_I48h, adjust.method="BH", p.value=0.000005))
vctr_sig <- vctr_sig | as.logical(decideTestsDGE(contrast_C48h_v_I144h, adjust.method="BH", p.value=0.000005))
vctr_sig <- vctr_sig | as.logical(decideTestsDGE(contrast_I48h_v_I144h, adjust.method="BH", p.value=0.000005))
vctr_names_hcl <- rownames(cur_DGELIST)[vctr_sig]
length(vctr_names_hcl)

head(vctr_names_hcl)

# Matrix of values
mtrx_significant <- cur_DGELIST$counts[vctr_names_top,]
# Colors for the groups
vctr_colors = as.factor( c( "black", "red", "green" ))
vctr_colors

vctr_sample_colors <- as.character(vctr_colors[as.numeric(cur_DGELIST$samples$group)])
vctr_sample_colors

# Heatmap
X11()
heatmap.2(log2( mtrx_significant + 1), ColSideColors=vctr_sample_colors, key=TRUE, trace="none", col=heat.colors(200), scale="row")
dev.off()