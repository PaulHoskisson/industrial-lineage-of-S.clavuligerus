if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

## install software
BiocManager::install("tximport")
BiocManager::install("tximportData")
BiocManager::install("GenomicFeatures")
BiocManager::install("RSQLite")
BiocManager::install("DESeq2")
BiocManager::install("apeglm")
BiocManager::install('EnhancedVolcano')
install.packages("tidyverse")
#Venn diagrams - https://mkempenaar.github.io/gene_expression_analysis/chapter-5.html#venn-diagram
install.packages("VennDiagram")
install.packages("futile.logger")
install.packages("pheatmap")


# load libraries
library("DESeq2")
library("tximport")
library("readr")
library("tximportData")
library("dplyr")
library("magrittr")
library("apeglm")
library("EnhancedVolcano")
library("VennDiagram")
library("pheatmap")
library("ggkegg")
library("ggfx")
library("igraph")
library("tidygraph")
library("ggraph")
library("clusterProfiler")

######### Perform DEseq analysis

# Import conditional files (contain sample name and condition A or B) and provide conditional information
samples_sc2_vs_sc3 <- read.table(file.path("samples_sc2_vs_sc3.txt"), header=TRUE)
samples_sc2_vs_sc3$Condition <- factor(rep(c("A","B"), each=3))

samples_sc2_vs_sc4 <- read.table(file.path("samples_sc2_vs_sc4.txt"), header=TRUE)
samples_sc2_vs_sc4$Condition <- factor(rep(c("A","B"), each=3))

samples_sc2_vs_sc5 <- read.table(file.path("samples_sc2_vs_sc5.txt"), header=TRUE)
samples_sc2_vs_sc5$Condition <- factor(rep(c("A","B"), each=3))

samples_sc2_vs_sc6 <- read.table(file.path("samples_sc2_vs_sc6.txt"), header=TRUE)
samples_sc2_vs_sc6$Condition <- factor(rep(c("A","B"), each=3))

samples_sc4_vs_sc5 <- read.table(file.path("samples_sc4_vs_sc5.txt"), header=TRUE)
samples_sc4_vs_sc5$Condition <- factor(rep(c("A","B"), each=3))

samples_sc5_vs_sc6 <- read.table(file.path("samples_sc5_vs_sc6.txt"), header=TRUE)
samples_sc5_vs_sc6$Condition <- factor(rep(c("A","B"), each=3))

# Add rownames to the data frames
rownames(samples_sc2_vs_sc3) <- samples_sc2_vs_sc3$Run
rownames(samples_sc2_vs_sc4) <- samples_sc2_vs_sc4$Run
rownames(samples_sc2_vs_sc5) <- samples_sc2_vs_sc5$Run
rownames(samples_sc2_vs_sc6) <- samples_sc2_vs_sc6$Run
rownames(samples_sc4_vs_sc5) <- samples_sc4_vs_sc5$Run
rownames(samples_sc5_vs_sc6) <- samples_sc5_vs_sc6$Run

# Select columns "Run" and "Condition" for each sample comparison
samples_sc2_vs_sc3[,c("Run","Condition")]
samples_sc2_vs_sc4[,c("Run","Condition")]
samples_sc2_vs_sc5[,c("Run","Condition")]
samples_sc2_vs_sc6[,c("Run","Condition")]
samples_sc4_vs_sc5[,c("Run","Condition")]
samples_sc5_vs_sc6[,c("Run","Condition")]

# Get paths for all quantification files
files_samples_sc2_vs_sc3 <- file.path("quants/",samples_sc2_vs_sc3$Run,"quant.sf")
files_samples_sc2_vs_sc4 <- file.path("quants/",samples_sc2_vs_sc4$Run,"quant.sf")
files_samples_sc2_vs_sc5 <- file.path("quants/",samples_sc2_vs_sc5$Run,"quant.sf")
files_samples_sc2_vs_sc6 <- file.path("quants/",samples_sc2_vs_sc6$Run,"quant.sf")
files_samples_sc4_vs_sc5 <- file.path("quants/",samples_sc4_vs_sc5$Run,"quant.sf")
files_samples_sc5_vs_sc6 <- file.path("quants/",samples_sc5_vs_sc6$Run,"quant.sf")

# Assign names to the quant file paths based on sample names
names(files_samples_sc2_vs_sc3) <- samples_sc2_vs_sc3$Run
names(files_samples_sc2_vs_sc4) <- samples_sc2_vs_sc4$Run
names(files_samples_sc2_vs_sc5) <- samples_sc2_vs_sc5$Run
names(files_samples_sc2_vs_sc6) <- samples_sc2_vs_sc6$Run
names(files_samples_sc4_vs_sc5) <- samples_sc4_vs_sc5$Run
names(files_samples_sc5_vs_sc6) <- samples_sc5_vs_sc6$Run

# Read in tx2gene file, which contains the mapping of transcript IDs to gene IDs
tx2gene <- read_csv(file.path("tx2gene_01-07-24.csv"))

# Perform tximport on salmon quantification files using tx2gene for gene IDs
txiSC2_vs_SC3 <- tximport(files_samples_sc2_vs_sc3, type="salmon", tx2gene = tx2gene)
txiSC2_vs_SC4 <- tximport(files_samples_sc2_vs_sc4, type="salmon", tx2gene = tx2gene)
txiSC2_vs_SC5 <- tximport(files_samples_sc2_vs_sc5, type="salmon", tx2gene = tx2gene)
txiSC2_vs_SC6 <- tximport(files_samples_sc2_vs_sc6, type="salmon", tx2gene = tx2gene)
txiSC4_vs_SC5 <- tximport(files_samples_sc4_vs_sc5, type="salmon", tx2gene = tx2gene)
txiSC5_vs_SC6 <- tximport(files_samples_sc5_vs_sc6, type="salmon", tx2gene = tx2gene)

# Import the data and clarify it is for DESeq2, indicating the column (Condition) used in differential analysis
ddsTxi_sc2_vs_sc3 <- DESeqDataSetFromTximport(txiSC2_vs_SC3, samples_sc2_vs_sc3, ~Condition)
ddsTxi_sc2_vs_sc4 <- DESeqDataSetFromTximport(txiSC2_vs_SC4, samples_sc2_vs_sc4, ~Condition)
ddsTxi_sc2_vs_sc5 <- DESeqDataSetFromTximport(txiSC2_vs_SC5, samples_sc2_vs_sc5, ~Condition)
ddsTxi_sc2_vs_sc6 <- DESeqDataSetFromTximport(txiSC2_vs_SC6, samples_sc2_vs_sc6, ~Condition)
ddsTxi_sc4_vs_sc5 <- DESeqDataSetFromTximport(txiSC4_vs_SC5, samples_sc4_vs_sc5, ~Condition)
ddsTxi_sc5_vs_sc6 <- DESeqDataSetFromTximport(txiSC5_vs_SC6, samples_sc5_vs_sc6, ~Condition)

# Carry out differential expression analysis using DESeq
dds_sc2_vs_sc3 <- DESeq(ddsTxi_sc2_vs_sc3)
dds_sc2_vs_sc4 <- DESeq(ddsTxi_sc2_vs_sc4)
dds_sc2_vs_sc5 <- DESeq(ddsTxi_sc2_vs_sc5)
dds_sc2_vs_sc6 <- DESeq(ddsTxi_sc2_vs_sc6)
dds_sc4_vs_sc5 <- DESeq(ddsTxi_sc4_vs_sc5)
dds_sc5_vs_sc6 <- DESeq(ddsTxi_sc5_vs_sc6)

# Carry out contrast differential expression analysis, specifying the base, factor being compared, numerator, and denominator
res_SC2vsSC3 <- results(dds_sc2_vs_sc3, contrast=c("Condition","B","A"))
res_SC2vsSC4 <- results(dds_sc2_vs_sc4, contrast=c("Condition","B","A"))
res_SC2vsSC5 <- results(dds_sc2_vs_sc5, contrast=c("Condition","B","A"))
res_SC2vsSC6 <- results(dds_sc2_vs_sc6, contrast=c("Condition","B","A"))
res_SC4vsSC5 <- results(dds_sc4_vs_sc5, contrast=c("Condition","B","A"))
res_SC5vsSC6 <- results(dds_sc5_vs_sc6, contrast=c("Condition","B","A"))

# Perform differential expression analysis with independent filtering turned off to include all results
no_filter_res_SC2vsSC3 <- results(dds_sc2_vs_sc3, independentFiltering = FALSE, contrast=c("Condition","B","A"))
no_filter_res_SC2vsSC4 <- results(dds_sc2_vs_sc4, independentFiltering = FALSE, contrast=c("Condition","B","A"))
no_filter_res_SC2vsSC5 <- results(dds_sc2_vs_sc5, independentFiltering = FALSE, contrast=c("Condition","B","A"))
no_filter_res_SC2vsSC6 <- results(dds_sc2_vs_sc6, independentFiltering = FALSE, contrast=c("Condition","B","A"))
no_filter_res_SC4vsSC5 <- results(dds_sc4_vs_sc5, independentFiltering = FALSE, contrast=c("Condition","B","A"))
no_filter_res_SC5vsSC6 <- results(dds_sc5_vs_sc6, independentFiltering = FALSE, contrast=c("Condition","B","A"))

# Summarize the results
summary(res_SC2vsSC3)
summary(res_SC2vsSC4)
summary(res_SC2vsSC5)
summary(res_SC2vsSC6)
summary(res_SC4vsSC5)
summary(res_SC5vsSC6)

# Making a combined data frame (megaframe)
# Add a prefix to each column header
prefix_SC3 <- "SC2vsSC3_"
prefix_SC4 <- "SC2vsSC4_"
prefix_SC5 <- "SC2vsSC5_"
prefix_SC6 <- "SC2vsSC6_"
prefix_SC45 <- "SC4vsSC5_"
prefix_SC56 <- "SC5vsSC6_"

new_column_names_SC3 <- paste0(prefix_SC3, colnames(res_SC2vsSC3))
new_column_names_SC4 <- paste0(prefix_SC4, colnames(res_SC2vsSC4))
new_column_names_SC5 <- paste0(prefix_SC5, colnames(res_SC2vsSC5))
new_column_names_SC6 <- paste0(prefix_SC6, colnames(res_SC2vsSC6))
new_column_names_SC45 <- paste0(prefix_SC45, colnames(res_SC4vsSC5))
new_column_names_SC56 <- paste0(prefix_SC56, colnames(res_SC5vsSC6))

res_SC2vsSC3_pre <- res_SC2vsSC3
res_SC2vsSC4_pre <- res_SC2vsSC4
res_SC2vsSC5_pre <- res_SC2vsSC5
res_SC2vsSC6_pre <- res_SC2vsSC6
res_SC4vsSC5_pre <- res_SC4vsSC5
res_SC5vsSC6_pre <- res_SC5vsSC6

# Rename columns with the new prefixed column names
colnames(res_SC2vsSC3_pre) <- new_column_names_SC3
colnames(res_SC2vsSC4_pre) <- new_column_names_SC4
colnames(res_SC2vsSC5_pre) <- new_column_names_SC5
colnames(res_SC2vsSC6_pre) <- new_column_names_SC6
colnames(res_SC4vsSC5_pre) <- new_column_names_SC45
colnames(res_SC5vsSC6_pre) <- new_column_names_SC56

# Combine data frames into a single data frame
combined_RNAseq <- cbind(res_SC2vsSC3_pre, res_SC2vsSC4_pre, res_SC4vsSC5_pre, res_SC5vsSC6_pre, res_SC2vsSC5_pre, res_SC2vsSC6_pre)

# Print the column names of the combined data frame
print(colnames(combined_RNAseq))

# Add KEGG results to the start of the data frame
KEGG <- read_csv("KEGG_2_edit.csv")

combined_RNAseq_KEGG <- combined_RNAseq
combined_RNAseq_KEGG$KEGG <- KEGG$KEGG
combined_RNAseq_KEGG$KEGGDefinition <- KEGG$KEGGDefinition

# Output/write the DESeq2 results as CSV files
write.csv(res_SC2vsSC3, "SC2_vs_SC3_deseq2.csv", row.names = TRUE)
write.csv(res_SC2vsSC4, "SC2_vs_SC4_deseq2.csv", row.names = TRUE)
write.csv(res_SC2vsSC5, "SC2_vs_SC5_deseq2.csv", row.names = TRUE)
write.csv(res_SC2vsSC6, "SC2_vs_SC6_deseq2.csv", row.names = TRUE)
write.csv(res_SC4vsSC5, "SC4_vs_SC5_deseq2.csv", row.names = TRUE)
write.csv(res_SC5vsSC6, "SC5_vs_SC6_deseq2.csv", row.names = TRUE)
write.csv(combined_RNAseq_KEGG, "combined_RNA-seq_KEGG.csv", row.names = TRUE)

######### generate a PCA plot

#extract count data
countData1 <- counts(dds_sc2_vs_sc3)
countData2 <- counts(dds_sc2_vs_sc4)
countData3 <- counts(dds_sc2_vs_sc5)
countData4 <- counts(dds_sc2_vs_sc6)
countData5 <- counts(dds_sc4_vs_sc5)
countData6 <- counts(dds_sc5_vs_sc6)

#extract column data
colData1 <- colData(dds_sc2_vs_sc3)
colData2 <- colData(dds_sc2_vs_sc4)
colData3 <- colData(dds_sc2_vs_sc5)
colData4 <- colData(dds_sc2_vs_sc6)
colData5 <- colData(dds_sc4_vs_sc5)
colData6 <- colData(dds_sc5_vs_sc6)

combinedCounts <- cbind(countData1, countData2, countData3, countData4, countData5, countData6)
combinedColData <- rbind(colData1, colData2, colData3, colData4, colData5, colData6)

# write, to edit, to read so each sample has SC2= A, SC3 =B, SC4 =C, D or E as condiation
#write.csv(combinedColData, "combinedColData.csv", row.names = TRUE)
combinedColData <- read_csv(file.path("combinedColData.csv"))

# Combine count matrices and colData
dds_combined <- DESeqDataSetFromMatrix(countData = combinedCounts,
                                       colData = combinedColData,
                                       design = ~ Condition)

# Perform rlog transformation on combined dataset
rld_combined <- rlog(dds_combined)

# Plot PCA
pca <-plotPCA(rld_combined, intgroup = "Condition")
pcaData <-plotPCA(rld_combined, intgroup = "Condition", returnData = TRUE)
ggsave("output/pcaplot.tiff", pca, width = 7.18, height = 3, units = "in")

# Optionally, write PCA data to a CSV file
write.csv(pcaData, file = "PCA_coordinates.csv", row.names = FALSE)

# Load necessary library
library(ggplot2)

# Create a data frame with the provided data (from tree and PCA plot)
samples <- c("SC2", "SC3", "SC4", "SC5", "SC6")
x_data <- c(0, 0, 0.04054, 0.12162, 0.52355)
y_dataPC1 <- c(-13.543113, -11.24558189, -10.23005059, 35.35922516, -10.09977021)
y_dataPC2<- c(-6.034229848, -1.26942573, 1.229297148, -0.651279578, 12.45079478)

dataPC1 <- data.frame(Sample = samples, X = x_data, Y = y_dataPC1)
dataPC2 <- data.frame(Sample = samples, X = x_data, Y = y_dataPC2)

# Create the plot
pC1 <- ggplot(dataPC1, aes(x = X, y = Y)) +
  geom_point() +
  geom_point(size = 5) +  # Increase point size
  geom_text(aes(label = Sample), vjust = -1, hjust = 0.5, size = 6) +
  labs(x = "Phylogenetic distance",
       y = "Transcriptome variance") +
  ylim(-20, 50) +  # Set y-axis limits
  theme_minimal() +
  theme(panel.background = element_rect(fill = "#ECECEC", color = "black", size = 1.5),
        plot.background = element_rect(fill = "white"),
        panel.grid.major = element_line(color = "black"),
        axis.line = element_line(color = "black"),
        axis.title = element_text(size = 24),
        axis.text = element_text(size = 24),
        legend.text = element_text(size = 24),
        legend.title = element_text(size = 24))

pC2 <- ggplot(dataPC2, aes(x = X, y = Y)) +
  geom_point() +
  geom_smooth(method = "lm", col = "blue", se = FALSE) +
  geom_text(aes(label = Sample), vjust = -1, hjust = 0.5, size = 6) +
  labs(x = "Phylogenetic distance",
       y = "Transcriptome variance") +
  ylim(-8, 15) +  # Set y-axis limits
  theme_minimal() +
  theme(panel.background = element_rect(fill = "#ECECEC", color = "black", size = 1.5),
        plot.background = element_rect(fill = "white"),
        panel.grid.major = element_line(color = "black"),
        axis.line = element_line(color = "black"),
        axis.title = element_text(size = 24),
        axis.text = element_text(size = 24),
        legend.text = element_text(size = 24),
        legend.title = element_text(size = 24))

# Display the plot
print(pC1)
print(pC2)

ggsave("output/PC1_trans_vs_phylo_plot.tiff", pC1, width = 6, height = 6, dpi = 300)
ggsave("output/PC2_trans_vs_phylo_plot.tiff", pC2, width = 6, height = 6, dpi = 300)

######### Isolate Differentially Expressed Genes

#this is split into a log2fold change method for venndiagram and using p-values
pval_threshold <- 0.05

#Venn diagram with no independednt filtering
#testing out ways to remove basemean= 0 - https://stackoverflow.com/questions/9977686/how-to-remove-rows-with-any-zero-value
no.res_SC2vsSC3_sub_no_0 <- no_filter_res_SC2vsSC3[no_filter_res_SC2vsSC3$baseMean !=0,]
no.res_SC2vsSC4_sub_no_0 <- no_filter_res_SC2vsSC4[no_filter_res_SC2vsSC4$baseMean !=0,]
no.res_SC2vsSC5_sub_no_0 <- no_filter_res_SC2vsSC5[no_filter_res_SC2vsSC5$baseMean !=0,]
no.res_SC2vsSC6_sub_no_0 <- no_filter_res_SC2vsSC6[no_filter_res_SC2vsSC6$baseMean !=0,]
no.res_SC4vsSC5_sub_no_0 <- no_filter_res_SC4vsSC5[no_filter_res_SC4vsSC5$baseMean !=0,]
no.res_SC5vsSC6_sub_no_0 <- no_filter_res_SC5vsSC6[no_filter_res_SC5vsSC6$baseMean !=0,]

#Pull out row names for each file with a significant pvalue/padj based on threshold
degs.no.res_SC2vsSC3 <- row.names(no.res_SC2vsSC3_sub_no_0[no.res_SC2vsSC3_sub_no_0$padj <= pval_threshold,])
degs.no.res_SC4vsSC5 <- row.names(no.res_SC4vsSC5_sub_no_0[!is.na(no.res_SC4vsSC5_sub_no_0$padj) & no.res_SC4vsSC5_sub_no_0$padj <= pval_threshold, ])
degs.no.res_SC2vsSC5 <- row.names(no.res_SC2vsSC5_sub_no_0[no.res_SC2vsSC5_sub_no_0$padj <= pval_threshold,])
degs.no.res_SC2vsSC6 <- row.names(no.res_SC2vsSC6_sub_no_0[no.res_SC2vsSC6_sub_no_0$padj <= pval_threshold,])
degs.no.res_SC4vsSC5 <- row.names(no.res_SC4vsSC5_sub_no_0[!is.na(no.res_SC4vsSC5_sub_no_0$padj) & no.res_SC4vsSC5_sub_no_0$padj <= pval_threshold, ])
degs.no.res_SC5vsSC6 <- row.names(no.res_SC5vsSC6_sub_no_0[!is.na(no.res_SC5vsSC6_sub_no_0$padj) & no.res_SC5vsSC6_sub_no_0$padj <= pval_threshold, ])

#Pull out row names for each file with a log2fc <-1 and >1
degs.no.res_SC2vsSC3 <- subset(no.res_SC2vsSC3_sub_no_0, log2FoldChange < -1 | log2FoldChange > 1)
degs.no.res_SC2vsSC4 <- subset(no.res_SC2vsSC4_sub_no_0, log2FoldChange < -1 | log2FoldChange > 1)
degs.no.res_SC2vsSC5 <- subset(no.res_SC2vsSC5_sub_no_0, log2FoldChange < -1 | log2FoldChange > 1)
degs.no.res_SC2vsSC6 <- subset(no.res_SC2vsSC6_sub_no_0, log2FoldChange < -1 | log2FoldChange > 1)
degs.no.res_SC4vsSC5 <- subset(no.res_SC4vsSC5_sub_no_0, log2FoldChange < -1 | log2FoldChange > 1)
degs.no.res_SC5vsSC6 <- subset(no.res_SC5vsSC6_sub_no_0, log2FoldChange < -1 | log2FoldChange > 1)

#Pull out row names for each file with a significant pvalue/padj based on threshold
degs.no.res_SC2vsSC3 <- row.names(degs.no.res_SC2vsSC3[degs.no.res_SC2vsSC3$padj <= pval_threshold,])
degs.no.res_SC2vsSC4 <- row.names(degs.no.res_SC2vsSC4[!is.na(degs.no.res_SC2vsSC4$padj) & degs.no.res_SC2vsSC4$padj <= pval_threshold, ])
degs.no.res_SC2vsSC5 <- row.names(degs.no.res_SC2vsSC5[degs.no.res_SC2vsSC5$padj <= pval_threshold,])
degs.no.res_SC2vsSC6 <- row.names(degs.no.res_SC2vsSC6[degs.no.res_SC2vsSC6$padj <= pval_threshold,])
degs.no.res_SC4vsSC5 <- row.names(degs.no.res_SC4vsSC5[!is.na(degs.no.res_SC4vsSC5$padj) & degs.no.res_SC4vsSC5$padj <= pval_threshold, ])
degs.no.res_SC5vsSC6 <- row.names(degs.no.res_SC5vsSC6[!is.na(degs.no.res_SC5vsSC6$padj) & degs.no.res_SC5vsSC6$padj <= pval_threshold, ])

# Filter for degs.no.res:
filtered_SC2vsSC3 <- combined_RNAseq_KEGG[rownames(combined_RNAseq_KEGG) %in% degs.no.res_SC2vsSC3, ]
filtered_SC2vsSC4 <- combined_RNAseq_KEGG[rownames(combined_RNAseq_KEGG) %in% degs.no.res_SC2vsSC4, ]
filtered_SC2vsSC5 <- combined_RNAseq_KEGG[rownames(combined_RNAseq_KEGG) %in% degs.no.res_SC2vsSC5, ]
filtered_SC2vsSC6 <- combined_RNAseq_KEGG[rownames(combined_RNAseq_KEGG) %in% degs.no.res_SC2vsSC6, ]
filtered_SC4vsSC5 <- combined_RNAseq_KEGG[rownames(combined_RNAseq_KEGG) %in% degs.no.res_SC4vsSC5, ]
filtered_SC5vsSC6 <- combined_RNAseq_KEGG[rownames(combined_RNAseq_KEGG) %in% degs.no.res_SC5vsSC6, ]

write.csv(filtered_SC2vsSC3,"DEG_SC2vsSC3_RNA-seq_KEGG.csv", row.names = TRUE)
write.csv(filtered_SC2vsSC4,"DEG_SC2vsSC4_RNA-seq_KEGG.csv", row.names = TRUE)
write.csv(filtered_SC2vsSC5,"DEG_SC2vsSC5_RNA-seq_KEGG.csv", row.names = TRUE)
write.csv(filtered_SC2vsSC6,"DEG_SC2vsSC6_RNA-seq_KEGG.csv", row.names = TRUE)
write.csv(filtered_SC4vsSC5,"DEG_SC4vsSC5_RNA-seq_KEGG.csv", row.names = TRUE)
write.csv(filtered_SC5vsSC6,"DEG_SC5vsSC6_RNA-seq_KEGG.csv", row.names = TRUE)

######### Generate a venn-diagram of the results

#get the NUMBER of genes that overlap between two datasets
deg.no.intersect_3_vs_4 = length(intersect(degs.no.res_SC2vsSC3,degs.no.res_SC2vsSC4))
deg.no.intersect_3_vs_5 = length(intersect(degs.no.res_SC2vsSC3,degs.no.res_SC2vsSC5))
deg.no.intersect_3_vs_6 = length(intersect(degs.no.res_SC2vsSC3,degs.no.res_SC2vsSC6))
deg.no.intersect_4_vs_5 = length(intersect(degs.no.res_SC2vsSC4,degs.no.res_SC2vsSC5))
deg.no.intersect_4_vs_6 = length(intersect(degs.no.res_SC2vsSC4,degs.no.res_SC2vsSC6))
deg.no.intersect_5_vs_6 = length(intersect(degs.no.res_SC2vsSC5,degs.no.res_SC2vsSC6))

#get the list of genes that overlap between two datasets
deg.no.interesect_3_4_genes = Reduce(intersect,list(degs.no.res_SC2vsSC3,degs.no.res_SC2vsSC4))
deg.no.interesect_3_5_genes = Reduce(intersect,list(degs.no.res_SC2vsSC3,degs.no.res_SC2vsSC5))
deg.no.interesect_3_6_genes = Reduce(intersect,list(degs.no.res_SC2vsSC3,degs.no.res_SC2vsSC6))
deg.no.interesect_4_5_genes = Reduce(intersect,list(degs.no.res_SC2vsSC4,degs.no.res_SC2vsSC5))
deg.no.interesect_4_6_genes = Reduce(intersect,list(degs.no.res_SC2vsSC4,degs.no.res_SC2vsSC6))
deg.no.interesect_5_6_genes = Reduce(intersect,list(degs.no.res_SC2vsSC5,degs.no.res_SC2vsSC6))

# get list of genes that overlap in way to do 3+ way vectors (3 data sets)
##https://stackoverflow.com/questions/3695677/how-to-find-common-elements-from-multiple-vectors
deg.no.interesect_3_4_5_genes = Reduce(intersect,list(degs.no.res_SC2vsSC3,degs.no.res_SC2vsSC4,degs.no.res_SC2vsSC5))
deg.no.interesect_3_4_6_genes = Reduce(intersect,list(degs.no.res_SC2vsSC3,degs.no.res_SC2vsSC4,degs.no.res_SC2vsSC6))
deg.no.interesect_3_5_6_genes = Reduce(intersect,list(degs.no.res_SC2vsSC3,degs.no.res_SC2vsSC5,degs.no.res_SC2vsSC6))
deg.no.interesect_4_5_6_genes = Reduce(intersect,list(degs.no.res_SC2vsSC4,degs.no.res_SC2vsSC5,degs.no.res_SC2vsSC6))
deg.no.interesect_3_4_5_6_genes = Reduce(intersect,list(degs.no.res_SC2vsSC3,degs.no.res_SC2vsSC4,degs.no.res_SC2vsSC5,degs.no.res_SC2vsSC6))

#get number of genes in the list and output as number
#https://www.geeksforgeeks.org/count-number-of-list-elements-in-r/
degs.no.area.res_SC2vsSC3 = print(length(degs.no.res_SC2vsSC3))
degs.no.area.res_SC2vsSC4 = print(length(degs.no.res_SC2vsSC4))
degs.no.area.res_SC2vsSC5 = print(length(degs.no.res_SC2vsSC5))
degs.no.area.res_SC2vsSC6 = print(length(degs.no.res_SC2vsSC6))
deg.no.interesect_3_4_5 = print(length(deg.no.interesect_3_4_5_genes))
deg.no.interesect_3_4_6 = print(length(deg.no.interesect_3_4_6_genes))
deg.no.interesect_3_5_6 = print(length(deg.no.interesect_3_5_6_genes))
deg.no.interesect_4_5_6 = print(length(deg.no.interesect_4_5_6_genes))
deg.no.interesect_3_4_5_6 = print(length(deg.no.interesect_3_4_5_6_genes))

# generate venn diagram using the numbers above
# Reference four-set diagram
## https://rdrr.io/cran/VennDiagram/man/draw.quad.venn.html
venn.plot <- draw.quad.venn(
  area1 = degs.no.area.res_SC2vsSC3,
  area2 = degs.no.area.res_SC2vsSC4,
  area3 = degs.no.area.res_SC2vsSC5,
  area4 = degs.no.area.res_SC2vsSC6,
  n12 = deg.no.intersect_3_vs_4,
  n13 = deg.no.intersect_3_vs_5,
  n14 = deg.no.intersect_3_vs_6,
  n23 = deg.no.intersect_4_vs_5,
  n24 = deg.no.intersect_4_vs_6,
  n34 = deg.no.intersect_5_vs_6,
  n123 = deg.no.interesect_3_4_5,
  n124 = deg.no.interesect_3_4_6,
  n134 = deg.no.interesect_3_5_6,
  n234 = deg.no.interesect_4_5_6,
  n1234 = deg.no.interesect_3_4_5_6,
  category = c("SC3", "SC4", "SC5", "SC6"),
  fill = c("orange", "red", "green", "blue"),
  lty = "dashed",
  cex = 2,
  cat.cex = 2,
  cat.col = c("orange", "red", "green", "blue")
);


# Writing to file
tiff(filename = "Venn_diagram_test_logfc", compression = "lzw")
grid.draw(venn.plot);
dev.off();

########### Heatmaps
install.packages("pheatmap")
library("pheatmap")

#subset gene list to use for extracting clav_genes from whole dataset
clav_genes <- c("SCLAV_SC2_20485",
                "SCLAV_SC2_20450",
                "SCLAV_SC2_20445",
                "SCLAV_SC2_20440",
                "SCLAV_SC2_20435",
                "SCLAV_SC2_20430",
                "SCLAV_SC2_20425",
                "SCLAV_SC2_20420",
                "SCLAV_SC2_20415",
                "SCLAV_SC2_20410",
                "SCLAV_SC2_20405",
                "SCLAV_SC2_20400",
                "SCLAV_SC2_20395",
                "SCLAV_SC2_20390",
                "SCLAV_SC2_20385",
                "SCLAV_SC2_20380",
                "SCLAV_SC2_20375",
                "SCLAV_SC2_20370")

#subset of clav genes from deseq2 data
clav_genes_no_filter_res_SC2vsSC3 = subset(no_filter_res_SC2vsSC3, rownames(no_filter_res_SC2vsSC3) %in% clav_genes)
clav_genes_no_filter_res_SC2vsSC4 = subset(no_filter_res_SC2vsSC4, rownames(no_filter_res_SC2vsSC4) %in% clav_genes)
clav_genes_no_filter_res_SC2vsSC5 = subset(no_filter_res_SC2vsSC5, rownames(no_filter_res_SC2vsSC5) %in% clav_genes)
clav_genes_no_filter_res_SC2vsSC6 = subset(no_filter_res_SC2vsSC6, rownames(no_filter_res_SC2vsSC6) %in% clav_genes)


#taking only the logfc_threshold column
keeps <- c("log2FoldChange")
df1 = clav_genes_no_filter_res_SC2vsSC3[keeps]
df2 = clav_genes_no_filter_res_SC2vsSC4[keeps]
df3 = clav_genes_no_filter_res_SC2vsSC5[keeps]
df4 = clav_genes_no_filter_res_SC2vsSC6[keeps]

#combining dataframes
all_SC_clav_genes_no_filter_res = data.frame(df1, df2, df3, df4)

print(all_SC_clav_genes_no_filter_res)

#changing column and row names
colnames(all_SC_clav_genes_no_filter_res) = c("SC2vsSC3","SC2vsSC4","SC2vsSC5","SC2vsSC6")
rownames(all_SC_clav_genes_no_filter_res) = c("pbpA (SCLAV_SC2_20370)",
                                              "gcas (SCLAV_SC2_20375)",
                                              "orf16 (SCLAV_SC2_20380)",
                                              "oppA2 (SCLAV_SC2_20385)",
                                              "orf14 (SCLAV_SC2_20390)",
                                              "orf13 (SCLAV_SC2_20395)",
                                              "cpe (SCLAV_SC2_20400)",
                                              "fd (SCLAV_SC2_20405)",
                                              "cyp (SCLAV_SC2_20410)",
                                              "car (SCLAV_SC2_20415)",
                                              "claR (SCLAV_SC2_20420)",
                                              "oppA1 (SCLAV_SC2_20425)",
                                              "oat2 (SCLAV_SC2_20430)",
                                              "cas2 (SCLAV_SC2_20435)",
                                              "pah2 (SCLAV_SC2_20440)",
                                              "bls2 (SCLAV_SC2_20445)",
                                              "ceaS2 (SCLAV_SC2_20450)",
                                              "ccaR (SCLAV_SC2_20485)")

#removing clustering form heatmap
heatmap_clav_genes_sc2vs3_to_6_noclustering = pheatmap(all_SC_clav_genes_no_filter_res,
                                                       cluster_rows=FALSE,
                                                       cluster_cols = FALSE,
                                                       main = "Claulanic Acid Biosynthetic Gene Cluster, Log2FC",
                                                       angle_col = 45,
                                                       display_numbers = TRUE,
                                                       filename = "output/clav_genes_heatmap.tiff")

#G3P pathway
G3P_pathway = c("SCLAV_SC2_12810",
                "SCLAV_SC2_15845",
                "SCLAV_SC2_05560",
                "SCLAV_SC2_05565",
                "SCLAV_SC2_05570",
                "SCLAV_SC2_18600",
                "SCLAV_SC2_05505",
                "SCLAV_SC2_26795",
                "SCLAV_SC2_07385",
                "SCLAV_SC2_26880")

#subset of clav genes from deseq2 data
G3P_no_filter_res_SC2vsSC3 = subset(no_filter_res_SC2vsSC3, rownames(no_filter_res_SC2vsSC3) %in% G3P_pathway)
G3P_no_filter_res_SC2vsSC4 = subset(no_filter_res_SC2vsSC4, rownames(no_filter_res_SC2vsSC4) %in% G3P_pathway)
G3P_no_filter_res_SC2vsSC5 = subset(no_filter_res_SC2vsSC5, rownames(no_filter_res_SC2vsSC5) %in% G3P_pathway)
G3P_no_filter_res_SC2vsSC6 = subset(no_filter_res_SC2vsSC6, rownames(no_filter_res_SC2vsSC6) %in% G3P_pathway)

#taking only the logfc_threshold column
keeps <- c("log2FoldChange")
df1_2 = G3P_no_filter_res_SC2vsSC3[keeps]
df2_2 = G3P_no_filter_res_SC2vsSC4[keeps]
df3_2 = G3P_no_filter_res_SC2vsSC5[keeps]
df4_2 = G3P_no_filter_res_SC2vsSC6[keeps]

#combining dataframes
all_G3P_no_filter_res = data.frame(df1_2, df2_2, df3_2, df4_2)

#changing column and row names
colnames(all_G3P_no_filter_res) = c("SC2vsSC3","SC2vsSC4","SC2vsSC5","SC2vsSC6")
rownames(all_G3P_no_filter_res) = c("SCLAV_1133 - (SCLAV_SC2_05505)",
                                    "tpiA - (SCLAV_SC2_05560)",
                                    "pga - (SCLAV_SC2_05565)",
                                    "gap1 - (SCLAV_SC2_05570)",
                                    "kdgA - (SCLAV_SC2_07385)",
                                    "Fba - (SCLAV_SC2_12810)",
                                    "agaY - (SCLAV_SC2_15845)",
                                    "SCLAV_3819 - (SCLAV_SC2_18600)",
                                    "tktA - (SCLAV_SC2_26795)",
                                    "gap2 - (SCLAV_SC2_26880)")

#No clustering with heatmap
heatmap_sc2vs3_to_6 = pheatmap(all_G3P_no_filter_res,
                               cluster_rows=FALSE,
                               cluster_cols = FALSE,
                               main = "G3P genes, Log2fc",
                               angle_col = 45,
                               display_numbers = TRUE,
                               filename = "output/G3Pheatmap_no_cluster.tiff")

# Arginine pathway
Arg_path = c("SCLAV_SC2_03875",
             "SCLAV_SC2_03880",
             "SCLAV_SC2_03885",
             "SCLAV_SC2_03890",
             "SCLAV_SC2_03895",
             "SCLAV_SC2_03900",
             "SCLAV_SC2_03905")



#subset of clav genes from deseq2 data
Arg_path_no_filter_res_SC2vsSC3 = subset(no_filter_res_SC2vsSC3, rownames(no_filter_res_SC2vsSC3) %in% Arg_path)
Arg_path_no_filter_res_SC2vsSC4 = subset(no_filter_res_SC2vsSC4, rownames(no_filter_res_SC2vsSC4) %in% Arg_path)
Arg_path_no_filter_res_SC2vsSC5 = subset(no_filter_res_SC2vsSC5, rownames(no_filter_res_SC2vsSC5) %in% Arg_path)
Arg_path_no_filter_res_SC2vsSC6 = subset(no_filter_res_SC2vsSC6, rownames(no_filter_res_SC2vsSC6) %in% Arg_path)

#taking only the logfc_threshold column
keeps <- c("log2FoldChange")
df1_3 = Arg_path_no_filter_res_SC2vsSC3[keeps]
df2_3 = Arg_path_no_filter_res_SC2vsSC4[keeps]
df3_3 = Arg_path_no_filter_res_SC2vsSC5[keeps]
df4_3 = Arg_path_no_filter_res_SC2vsSC6[keeps]

#combining dataframes
all_Arg_path_no_filter_res = data.frame(df1_3, df2_3, df3_3, df4_3)

#changing column and row names
colnames(all_Arg_path_no_filter_res) = c("SC2vsSC3","SC2vsSC4","SC2vsSC5","SC2vsSC6")
rownames(all_Arg_path_no_filter_res) = c("argH - (SCLAV_SC2_03875)",
                                         "argG - (SCLAV_SC2_03880)",
                                         "argR - (SCLAV_SC2_03885)",
                                         "argD - (SCLAV_SC2_03890)",
                                         "argB - (SCLAV_SC2_03895)",
                                         "argJ - (SCLAV_SC2_03900)",
                                         "argC  - (SCLAV_SC2_03905)")

#No clustering with heatmap
heatmap_all_Arg_path_no_filter_res = pheatmap(all_Arg_path_no_filter_res,
                               cluster_rows=FALSE,
                               cluster_cols = FALSE,
                               main = "Arginine pathway genes, Log2FC",
                               angle_col = 45,
                               display_numbers = TRUE,
                               filename = "output/Arg_path_heatmap_no_cluster.tiff")

# Clavam pathway
cvm_path = c("SCLAV_SC2_14150",
             "SCLAV_SC2_14155",
             "SCLAV_SC2_14160",
             "SCLAV_SC2_14165",
             "SCLAV_SC2_14170",
             "SCLAV_SC2_14175",
             "SCLAV_SC2_14180",
             "SCLAV_SC2_14185",
             "SCLAV_SC2_14190",
             "SCLAV_SC2_14195",
             "SCLAV_SC2_14200",
             "SCLAV_SC2_14205",
             "SCLAV_SC2_14210",
             "SCLAV_SC2_14215",
             "SCLAV_SC2_14220",
             "SCLAV_SC2_14225")




#subset of clav genes from deseq2 data
cvm_path_no_filter_res_SC2vsSC3 = subset(no_filter_res_SC2vsSC3, rownames(no_filter_res_SC2vsSC3) %in% cvm_path)
cvm_path_no_filter_res_SC2vsSC4 = subset(no_filter_res_SC2vsSC4, rownames(no_filter_res_SC2vsSC4) %in% cvm_path)
cvm_path_no_filter_res_SC2vsSC5 = subset(no_filter_res_SC2vsSC5, rownames(no_filter_res_SC2vsSC5) %in% cvm_path)
cvm_path_no_filter_res_SC2vsSC6 = subset(no_filter_res_SC2vsSC6, rownames(no_filter_res_SC2vsSC6) %in% cvm_path)

#taking only the logfc_threshold column
keeps <- c("log2FoldChange")
df1_4 = cvm_path_no_filter_res_SC2vsSC3[keeps]
df2_4 = cvm_path_no_filter_res_SC2vsSC4[keeps]
df3_4 = cvm_path_no_filter_res_SC2vsSC5[keeps]
df4_4 = cvm_path_no_filter_res_SC2vsSC6[keeps]

#combining dataframes
all_cvm_path_no_filter_res = data.frame(df1_4, df2_4, df3_4, df4_4)

#changing column and row names
colnames(all_cvm_path_no_filter_res) = c("SC2vsSC3","SC2vsSC4","SC2vsSC5","SC2vsSC6")
rownames(all_cvm_path_no_filter_res) = c("cvm9 - (SCLAV_SC2_14150)",
                                         "t037 - (SCLAV_SC2_14155)",
                                         "cvm6 - (SCLAV_SC2_14160)",
                                         "cvm5 - (SCLAV_SC2_14165)",
                                         "cvm4 - (SCLAV_SC2_14170)",
                                         "cas1 - (SCLAV_SC2_14175)",
                                         "cvm1 - (SCLAV_SC2_14180)",
                                         "cvm2 - (SCLAV_SC2_14185)",
                                         "cvm3 - (SCLAV_SC2_14190)",
                                         "cvm7 - (SCLAV_SC2_14195)",
                                         "cvm11 - (SCLAV_SC2_14200)",
                                         "cvm12 - (SCLAV_SC2_14205)",
                                         "cvm13 - (SCLAV_SC2_14210)",
                                         "cvmH - (SCLAV_SC2_14215)",
                                         "cvmP - (SCLAV_SC2_14220)",
                                         "cvmG - (SCLAV_SC2_14225)")

#No clustering with heatmap
heatmap_sc2vs3_to_6 = pheatmap(all_cvm_path_no_filter_res,
                               cluster_rows=FALSE,
                               cluster_cols = FALSE,
                               main = "Clavam cluster genes, Log2FC",
                               angle_col = 45,
                               display_numbers = TRUE,
                               filename = "output/cvm_path_heatmap_no_cluster.tiff")

# Paralogous_Clav_cluster pathway
Paralogous_Clav_cluster = c("SCLAV_SC2_32440",
                            "SCLAV_SC2_32445",
                            "SCLAV_SC2_32450",
                            "SCLAV_SC2_32455",
                            "SCLAV_SC2_32460",
                            "SCLAV_SC2_32465")

#subset of clav genes from deseq2 data
pclav_path_no_filter_res_SC2vsSC3 = subset(no_filter_res_SC2vsSC3, rownames(no_filter_res_SC2vsSC3) %in% Paralogous_Clav_cluster)
pclav_path_no_filter_res_SC2vsSC4 = subset(no_filter_res_SC2vsSC4, rownames(no_filter_res_SC2vsSC4) %in% Paralogous_Clav_cluster)
pclav_path_no_filter_res_SC2vsSC5 = subset(no_filter_res_SC2vsSC5, rownames(no_filter_res_SC2vsSC5) %in% Paralogous_Clav_cluster)
pclav_path_no_filter_res_SC2vsSC6 = subset(no_filter_res_SC2vsSC6, rownames(no_filter_res_SC2vsSC6) %in% Paralogous_Clav_cluster)

#taking only the logfc_threshold column
keeps <- c("log2FoldChange")
df1_5 = pclav_path_no_filter_res_SC2vsSC3[keeps]
df2_5 = pclav_path_no_filter_res_SC2vsSC4[keeps]
df3_5 = pclav_path_no_filter_res_SC2vsSC5[keeps]
df4_5 = pclav_path_no_filter_res_SC2vsSC6[keeps]

#combining dataframes
all_pclav_path_no_filter_res = data.frame(df1_5, df2_5, df3_5, df4_5)

#changing column and row names
colnames(all_pclav_path_no_filter_res) = c("SC2vsSC3","SC2vsSC4","SC2vsSC5","SC2vsSC6")
rownames(all_pclav_path_no_filter_res) = c("ceaS1 - (SCLAV_SC2_32440)",
                                           "bls1 - (SCLAV_SC2_32445)",
                                           "pah1 - (SCLAV_SC2_32450)",
                                           "oat1 - (SCLAV_SC2_32455)",
                                           "cvm6P_2 - (SCLAV_SC2_32460)",
                                           "cvm7P - (SCLAV_SC2_32465)")

#No clustering with heatmap
heatmap_sc2vs3_to_6 = pheatmap(all_pclav_path_no_filter_res,
                               cluster_rows=FALSE,
                               cluster_cols = FALSE,
                               main = "Paralogous_Clav_cluster genes, Log2FC",
                               angle_col = 45,
                               display_numbers = TRUE,
                               filename = "output/pclav_path_heatmap_no_cluster.tiff")

# Cephamycin_cluster pathway
Cephamycin_cluster = c("SCLAV_SC2_20455",
                       "SCLAV_SC2_20460",
                       "SCLAV_SC2_20465",
                       "SCLAV_SC2_20470",
                       "SCLAV_SC2_20475",
                       "SCLAV_SC2_20480",
                       "SCLAV_SC2_20485",
                       "SCLAV_SC2_20490",
                       "SCLAV_SC2_20495",
                       "SCLAV_SC2_20500",
                       "SCLAV_SC2_20505",
                       "SCLAV_SC2_20510",
                       "SCLAV_SC2_20515",
                       "SCLAV_SC2_20520",
                       "SCLAV_SC2_20525",
                       "SCLAV_SC2_20530",
                       "SCLAV_SC2_20535")

#subset of clav genes from deseq2 data
ceph_path_no_filter_res_SC2vsSC3 = subset(no_filter_res_SC2vsSC3, rownames(no_filter_res_SC2vsSC3) %in% Cephamycin_cluster)
ceph_path_no_filter_res_SC2vsSC4 = subset(no_filter_res_SC2vsSC4, rownames(no_filter_res_SC2vsSC4) %in% Cephamycin_cluster)
ceph_path_no_filter_res_SC2vsSC5 = subset(no_filter_res_SC2vsSC5, rownames(no_filter_res_SC2vsSC5) %in% Cephamycin_cluster)
ceph_path_no_filter_res_SC2vsSC6 = subset(no_filter_res_SC2vsSC6, rownames(no_filter_res_SC2vsSC6) %in% Cephamycin_cluster)

#taking only the logfc_threshold column
keeps <- c("log2FoldChange")
df1_6 = ceph_path_no_filter_res_SC2vsSC3[keeps]
df2_6 = ceph_path_no_filter_res_SC2vsSC4[keeps]
df3_6 = ceph_path_no_filter_res_SC2vsSC5[keeps]
df4_6 = ceph_path_no_filter_res_SC2vsSC6[keeps]

#combining dataframes
all_ceph_path_no_filter_res = data.frame(df1_6, df2_6, df3_6, df4_6)

#changing column and row names
colnames(all_ceph_path_no_filter_res) = c("SC2vsSC3","SC2vsSC4","SC2vsSC5","SC2vsSC6")
rownames(all_ceph_path_no_filter_res) = c("pcbR - SCLAV_SC2_20455",
                                          "pcbC - SCLAV_SC2_20460",
                                          "pcbAB - SCLAV_SC2_20465",
                                          "lat - SCLAV_SC2_20470",
                                          "blp - SCLAV_SC2_20475",
                                          "SCLAV_SC2_20480",
                                          "ccaR - SCLAV_SC2_20485",
                                          "cmcH - SCLAV_SC2_20490",
                                          "cefF - SCLAV_SC2_20495",
                                          "cmcJ - SCLAV_SC2_20500",
                                          "cmcI - SCLAV_SC2_20505",
                                          "cefD - SCLAV_SC2_20510",
                                          "cefE - SCLAV_SC2_20515",
                                          "pcd - SCLAV_SC2_20520",
                                          "cmcT - SCLAV_SC2_20525",
                                          "pbp74 - SCLAV_SC2_20530",
                                          "blaC_2 - SCLAV_SC2_20535")

#No clustering with heatmap
heatmap_sc2vs3_to_6 = pheatmap(all_ceph_path_no_filter_res,
                               cluster_rows=FALSE,
                               cluster_cols = FALSE,
                               main = "Cephamycin_cluster genes, Log2FC",
                               angle_col = 45,
                               display_numbers = TRUE,
                               filename = "output/ceph_path_heatmap_no_cluster.tiff")


# All control points for glucose metabolism
CP = c("SCLAV_SC2_24085",
       "SCLAV_SC2_03940",
       "SCLAV_SC2_20130",
       "SCLAV_SC2_02490",
       "SCLAV_SC2_06455",
       "SCLAV_SC2_21080",
       "SCLAV_SC2_19245",
       "SCLAV_SC2_10870",
       "SCLAV_SC2_05515")

#subset of clav genes from deseq2 data
CP_no_filter_res_SC2vsSC3 = subset(no_filter_res_SC2vsSC3, rownames(no_filter_res_SC2vsSC3) %in% CP)
CP_no_filter_res_SC2vsSC4 = subset(no_filter_res_SC2vsSC4, rownames(no_filter_res_SC2vsSC4) %in% CP)
CP_no_filter_res_SC2vsSC5 = subset(no_filter_res_SC2vsSC5, rownames(no_filter_res_SC2vsSC5) %in% CP)
CP_no_filter_res_SC2vsSC6 = subset(no_filter_res_SC2vsSC6, rownames(no_filter_res_SC2vsSC6) %in% CP)

#taking only the logfc_threshold column
keeps <- c("log2FoldChange")
df1_6 = CP_no_filter_res_SC2vsSC3[keeps]
df2_6 = CP_no_filter_res_SC2vsSC4[keeps]
df3_6 = CP_no_filter_res_SC2vsSC5[keeps]
df4_6 = CP_no_filter_res_SC2vsSC6[keeps]

#combining dataframes
CP_no_filter_res = data.frame(df1_6, df2_6, df3_6, df4_6)

#changing column and row names
colnames(CP_no_filter_res) = c("SC2vsSC3","SC2vsSC4","SC2vsSC5","SC2vsSC6")
rownames(CP_no_filter_res) = c("SCLAV_SC2_24085 - Pyruvate dehydrogenase",
                               "SCLAV_SC2_03940 - Putative isocitrate dehydrogenase",
                               "SCLAV_SC2_20130 - Alpha-ketoglutarate decarboxylase",
                               "SCLAV_SC2_02490 - 6-phosphofructokinase 1",
                               "SCLAV_SC2_06455 - 6-phosphofructokinase 2",
                               "SCLAV_SC2_21080 - 6-phosphofructokinase 3",
                               "SCLAV_SC2_19245 - Fructose 1%2C6-bisphosphatase II",
                               "SCLAV_SC2_10870 - Phosphoenolpyruvate carboxylase",
                               "SCLAV_SC2_05515 - Glucose-6-phosphate 1-dehydrogenase")

#No clustering with heatmap
heatmap_sc2vs3_to_6 = pheatmap(CP_no_filter_res,
                               cluster_rows=FALSE,
                               cluster_cols = TRUE,
                               main = "Control_points, Log2FC",
                               angle_col = 45,
                               display_numbers = TRUE,
                               filename = "output/Control_points_heatmap_no_cluster.tiff")


########### Volcano plots
# Define the specific set of gene names to label
gene_labels <- c("")  # Replace with your specific genes

# Function to create EnhancedVolcano plot with specific labels
create_volcano_plot <- function(res, gene_labels, subtitle) {
  EnhancedVolcano(res,
                  lab = rownames(res),
                  x = 'log2FoldChange',
                  y = 'pvalue',
                  title = NULL,
                  subtitle = subtitle,
                  legendPosition = 'none',
                  caption = NULL,
                  pCutoff = 0.05,
                  FCcutoff = 1.0,
                  pointSize = 2.0,
                  labSize = 3.0,
                  labCol = 'black',
                  labFace = 'bold',
                  boxedLabels = TRUE,
                  colAlpha = 4/5,
                  drawConnectors = TRUE,
                  widthConnectors = 1.0,
                  colConnectors = 'black',
                  max.overlaps = Inf,  # Ensure all labels are displayed
                  selectLab = gene_labels)  # Specify exact labels
}

# Create EnhancedVolcano plots with specific gene labels
P1 = create_volcano_plot(res_SC2vsSC3, gene_labels, bquote(italic("S. clavuligerus") ~ " SC2 - SC3"))
P2 = create_volcano_plot(res_SC2vsSC4, gene_labels, bquote(italic("S. clavuligerus") ~ " SC2 - SC4"))
P3 = create_volcano_plot(res_SC4vsSC5, gene_labels, bquote(italic("S. clavuligerus") ~ " SC4 - SC5"))
P4 = create_volcano_plot(res_SC5vsSC6, gene_labels, bquote(italic("S. clavuligerus") ~ " SC5 - SC6"))
P5 = create_volcano_plot(res_SC2vsSC6, gene_labels, bquote(italic("S. clavuligerus") ~ " SC2 - SC6"))

# Create a grid of the updated plots
library(gridExtra)
library(grid)
# Sets x and Y axis to the same scale
P1_1 = P1 +
  ggplot2::coord_cartesian(xlim=c(-10, 10), ylim=c(-10, 100)) +
  ggplot2::scale_x_continuous(breaks=seq(-10, 10, 1))

P1_2 = P2 +
  ggplot2::coord_cartesian(xlim=c(-10, 10), ylim=c(-10, 100)) +
  ggplot2::scale_x_continuous(breaks=seq(-10, 10, 1))

P1_3 = P3 +
  ggplot2::coord_cartesian(xlim=c(-10, 10), ylim=c(-10, 100)) +
  ggplot2::scale_x_continuous(breaks=seq(-10, 10, 1))

P1_4 = P4 +
  ggplot2::coord_cartesian(xlim=c(-10, 10), ylim=c(-10, 100)) +
  ggplot2::scale_x_continuous(breaks=seq(-10, 10, 1))

P1_5 = P5 +
  ggplot2::coord_cartesian(xlim=c(-10, 10), ylim=c(-10, 100)) +
  ggplot2::scale_x_continuous(breaks=seq(-10, 10, 1))

plot_final = grid.arrange(venn.plot, P1_5, P1_1, P1_2, P1_3, P1_4)
ggsave("output/Venn-volcano.tiff", plot_final, width = 16.5, height = 11.7, units = "in")

######### Generate dN/dS plot - No axis break:
# Install necessary packages if not installed
install.packages("ggbreak")

# Load necessary libraries
library(ggplot2)
library(readxl)

# Read the data
p_dnds <- read_excel("~/Downloads/Paul_dNdS_updated_JTM_edit.xlsx")

# Get unique x positions for vertical lines
x_positions <- 1:length(unique(p_dnds$Strain))  # Positions between the samples

# Plot with vertical gridlines between the samples and removing gridlines on the data points
ggplot(data = p_dnds, aes(x = Strain, y = dNdS, fill = Selection)) + 
  geom_jitter(shape = 21, color = "black", stroke = 1.2, size = 5) +  # Black outline with filled color
  xlab("Strain") +
  ylab("dN/dS ratio") +
  theme_minimal() + 
  theme(
    panel.background = element_rect(fill = "#ECECEC", color = "black", size = 1.5),  # Adds border to the plot
    plot.background = element_rect(fill = "white"),  # Ensures the plot background is clean
    panel.grid.major = element_line(color = "black"),  # Major gridlines for y-axis
    panel.grid.minor = element_blank(),  # Removes minor gridlines
    panel.grid.major.x = element_blank(),  # Removes vertical gridlines from data points
    axis.line = element_line(color = "black"),  # Axis line color
    axis.title = element_text(size = 24),  # Axis title size
    axis.text = element_text(size = 24),  # Axis text size
    legend.text = element_text(size = 24),  # Legend text size
    legend.title = element_text(size = 24)  # Legend title size
  ) +  
  scale_fill_manual(values = c("Neutral selection" = "darkgrey",
                               "Positive selection" = "white",
                               "Purifying selection" = "black"),
                    na.translate = FALSE) +  
  scale_y_continuous(
    limits = c(0, 30),
    expand = expansion(mult = c(0.05, 0.1))  # Adds space to avoid clipping of 150
  ) +
  # Add vertical lines between the categories
  geom_vline(xintercept = x_positions - 0.5, linetype = "solid", color = "black", size = 0.5)

ggsave("output/dN-dS_plot.tiff", width = 12, height = 6, dpi = 300)