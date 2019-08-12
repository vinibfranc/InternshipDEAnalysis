if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

BiocManager::install("NOISeq")
library(NOISeq)

raw_count <- read.delim("mr_count_table.txt", header=TRUE, row.names=1)
head(raw_count)

myfactors = data.frame(condition = c("control", "heat"), Run = c(rep("R1", 1), rep("R2", 1)))
myfactors

my_data <- readData(raw_count, myfactors)

noiseq(my_data, k = 0.5, norm = c("rpkm","uqua","tmm","n"), 
       replicates = c("no"), 
       factor="condition", conditions=NULL, pnr = 0.2, nss = 5, v = 0.02, lc = 0)

# mydata <- addData(my_data)
# myexplodata <- dat(mydata, type = "biodetection")