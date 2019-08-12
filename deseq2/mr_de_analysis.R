# This R script will analyzed data when there is no replicate
# There script is inspired by this post
#http://seqanswers.com/forums/showthread.php?t=31036

if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

BiocManager::install("DESeq2")

# Counts-Matrix
raw_count <- read.delim("mr_count_table.txt", header=TRUE, row.names=1)
countdata1 <- round(raw_count)

#write.csv(countdata1, "final_filtered_data - Copy - Copy.csv")
head(countdata1)

# Remove all gene which has 0 value in all sample
all <- apply(countdata1, 1, function(x) all(x==0) )
newdata <- countdata1[!all,]
write.csv(newdata, file = "count_0_filter.csv")
head (newdata)

# remove uninformative genes keep only genes that are expressed in at least 200 count in 20 samples
dat <- newdata[rowSums(newdata > 20) >= 1,]

write.csv(dat, file = "rpkm.csv_0_filter_atleat_200_count.csv")
head (dat)

final_count <- read.csv("rpkm.csv_0_filter_atleat_200_count.csv", header=TRUE, row.names=1)

library(DESeq2)

# Convert to matrix
countdata <- as.matrix(final_count)
head(countdata)
(condition <- factor(c("control")))


(condition <- factor(c("heat")))
# Create a coldata frame and instantiate the DESeqDataSet. See ?DESeqDataSetFromMatrix
(coldata <- data.frame(row.names=colnames(countdata)))

dds <- DESeqDataSetFromMatrix(countData=countdata, colData=coldata, design=~condition)
dds
#set control as reference level
dds$condition <- relevel(dds$condition, "control")
dds <- DESeq(dds)


# Regularized log transformation for clustering/heatmaps, etc
rld <- rlogTransformation(dds)
head(assay(rld))
hist(assay(rld))
write.csv(resdata, file="rld.csv")


res <- data.frame(
  assay(rld), 
  avgLogExpr = ( assay(rld)[,2] + assay(rld)[,1] ) / 2,
  rLogFC = assay(rld)[,2] - assay(rld)[,1] )


head( res[ order(res$rLogFC), ] )
write.csv(res, file="DEG.xlsx")