# Load necessary libraries
library(dplyr)
library(stringr)

# Read the list of selected conditions
selected_conditions <- read.csv("~/Documents/Work/1-Post-doc_Strathy-iUK-GSK/15_BIV_GSK_sequencing/Paper_final/Draft_back_from_Hoski)10-06-24/scripts/Biolog/selected_conditions.csv", header = FALSE)
conditions <- as.character(selected_conditions[1, ])

# Read the main data
data <- read.csv("~/Documents/Work/1-Post-doc_Strathy-iUK-GSK/15_BIV_GSK_sequencing/Paper_final/Draft_back_from_Hoski)10-06-24/scripts/Biolog/data/5_bactExtract_files/2024-05-16_growthParameters_all_data.csv")

# Filter the rows where 'Wells' column contains any of the selected conditions
filtered_data <- data %>%
  filter(str_detect(Wells, paste(conditions, collapse = "|")))

# Save the filtered data to a new CSV file
write.csv(filtered_data, "~/Documents/Work/1-Post-doc_Strathy-iUK-GSK/15_BIV_GSK_sequencing/Paper_final/Draft_back_from_Hoski)10-06-24/scripts/Biolog/data/6_selected_reasonable_growth/filtered_data.csv", row.names = FALSE)

# Read the filtered data
filtered_data <- read.csv("~/Documents/Work/1-Post-doc_Strathy-iUK-GSK/15_BIV_GSK_sequencing/Paper_final/Draft_back_from_Hoski)10-06-24/scripts/Biolog/data/6_selected_reasonable_growth/filtered_data.csv")

# Remove rows where 'OD.max_val' is less than 50
filtered_data <- filtered_data %>%
  filter(OD.max_val >= 50)

# Select only the "Wells" and "OD.r" columns
selected_data <- filtered_data %>%
  select(Wells, OD.r)

# Rename the "Wells" column to "Strain"
colnames(selected_data)[colnames(selected_data) == "Wells"] <- "Strain"

# Define the patterns to keep
patterns_to_keep <- c("738", "SC2", "SC3", "SC4", "SC5", "SC6")

# Create a regex pattern to match any of the specified substrings
pattern <- paste(patterns_to_keep, collapse = "|")

# Remove all text in the "Strain" column that isn't specified
selected_data$Strain <- str_extract(selected_data$Strain, pattern)

# Save the final data to a new CSV file
write.csv(selected_data, "~/Documents/Work/1-Post-doc_Strathy-iUK-GSK/15_BIV_GSK_sequencing/Paper_final/Draft_back_from_Hoski)10-06-24/scripts/Biolog/data/6_selected_reasonable_growth/final_data.csv", row.names = FALSE)
