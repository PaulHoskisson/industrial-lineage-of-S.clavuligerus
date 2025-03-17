# Load the pheatmap library
library(pheatmap)

# Read the combined results
combined_results <- read.csv('/Users/johnmunnoch/Documents/Work/1-Post-doc_Strathy-iUK-GSK/15_BIV_GSK_sequencing/Biolog/Processing_12-01-24/final_data_for_R.csv')

# Changing column and row names
colnames(combined_results) <- c("DSM738","SC2","SC3","SC4","SC5","SC6")
rownames(combined_results) <- c("A01: Negative Control",
                                "A02: L-Arabinose",
                                "A03: N-Acetyl-D Glucosamine",
                                "A05: Succinic Acid",
                                "A07: L-Aspartic Acid",
                                "B03: Glycerol",
                                "B06: D-Gluconic Acid",
                                "B08: D-Xylose",
                                "B12: L-Glutamic Acid",
                                "C03: D-L-Malic Acid",
                                "C04: D-Ribose",
                                "C10: Maltose",
                                "D01: L-Asparagine",
                                "D03: D-Glucosaminic Acid",
                                "D05: Tween 40",
                                "D06: a-Keto-Glutaric Acid",
                                "E01: L-Glutamine",
                                "E05: Tween 80",
                                "E10: Maltotriose",
                                "E11: 2-DeoxyAdenosine",
                                "E12: Adenosine",
                                "F02: Citric Acid",
                                "F05: Fumaric Acid",
                                "F06: Bromo Succinic Acid",
                                "F12: Inosine",
                                "G05: L-Alanine",
                                "G06: L-Alanyl-Glycine",
                                "G12: L-Malic Acid",
                                "H01: Glycyl-L-Proline",
                                "H06: L-Lyxose")

# Default clustering with heatmap
pheatmap(combined_results,
         main = "",
         angle_col = 45,
         display_numbers = TRUE,
         fontsize = 20,  # Setting font size to 20
         cluster_cols = FALSE,  # Disable clustering for columns
         filename = "~/Documents/Work/1-Post-doc_Strathy-iUK-GSK/15_BIV_GSK_sequencing/Paper_final/Draft_back_from_Hoski)10-06-24/PM1_GSK_combined_results_heatmap_test.tiff",
         width = 12,   # Width of the image in inches
         height = 12,  # Height of the image in inches
         dpi = 300)    # Resolution in dots per inch
