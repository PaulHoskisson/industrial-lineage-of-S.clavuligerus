install.packages("dplyr")
library(dplyr)

######### 738

df1 <- read.csv("Biolog/data/1_raw/738_1_1.csv")
df2 <- read.csv("Biolog/data/1_raw/738_1_2.csv")
df3 <- read.csv("Biolog/data/1_raw/738_1_3.csv")

# Load your data frames (assuming they are already loaded as df1, df2, df3)
# Make sure the data frames have the same columns in the same order

# Get the column names
col_names <- names(df1)

# Create an empty list to store the interleaved columns
interleaved_cols <- list()

# Interleave columns
for (col in col_names) {
  interleaved_cols[[paste0(col, "_df1")]] <- df1[[col]]
  interleaved_cols[[paste0(col, "_df2")]] <- df2[[col]]
  interleaved_cols[[paste0(col, "_df3")]] <- df3[[col]]
}

# Convert the list to a data frame
combined_df <- as.data.frame(interleaved_cols)

# Remove the specified columns
combined_df <- combined_df %>% select(-Hour_df2, -Hour_df3)

# Save the combined data frame to a new CSV file
write.csv(combined_df, "Biolog/data/4_combined_interleaved_samples/combined_data_738_interleaved.csv", row.names = FALSE)

######### SC2

df1 <- read.csv("Biolog/data/1_raw/SC2_1_1.csv")
df2 <- read.csv("Biolog/data/1_raw/SC2_1_2.csv")
df3 <- read.csv("Biolog/data/1_raw/SC2_1_3.csv")

# Load your data frames (assuming they are already loaded as df1, df2, df3)
# Make sure the data frames have the same columns in the same order

# Get the column names
col_names <- names(df1)

# Create an empty list to store the interleaved columns
interleaved_cols <- list()

# Interleave columns
for (col in col_names) {
  interleaved_cols[[paste0(col, "_df1")]] <- df1[[col]]
  interleaved_cols[[paste0(col, "_df2")]] <- df2[[col]]
  interleaved_cols[[paste0(col, "_df3")]] <- df3[[col]]
}

# Convert the list to a data frame
combined_df <- as.data.frame(interleaved_cols)

# Remove the specified columns
combined_df <- combined_df %>% select(-Hour_df2, -Hour_df3)

# Save the combined data frame to a new CSV file
write.csv(combined_df, "Biolog/data/4_combined_interleaved_samples/combined_data_SC2_interleaved.csv", row.names = FALSE)

######### SC3
df1 <- read.csv("Biolog/data/1_raw/SC3_1_1.csv")
df2 <- read.csv("Biolog/data/1_raw/SC3_1_2.csv")
df3 <- read.csv("Biolog/data/1_raw/SC3_1_3.csv")

# Load your data frames (assuming they are already loaded as df1, df2, df3)
# Make sure the data frames have the same columns in the same order

# Get the column names
col_names <- names(df1)

# Create an empty list to store the interleaved columns
interleaved_cols <- list()

# Interleave columns
for (col in col_names) {
  interleaved_cols[[paste0(col, "_df1")]] <- df1[[col]]
  interleaved_cols[[paste0(col, "_df2")]] <- df2[[col]]
  interleaved_cols[[paste0(col, "_df3")]] <- df3[[col]]
}

# Convert the list to a data frame
combined_df <- as.data.frame(interleaved_cols)

# Remove the specified columns
combined_df <- combined_df %>% select(-Hour_df2, -Hour_df3)

# Save the combined data frame to a new CSV file
write.csv(combined_df, "Biolog/data/4_combined_interleaved_samples/combined_data_SC3_interleaved.csv", row.names = FALSE)

######### SC4
df1 <- read.csv("Biolog/data/1_raw/SC4_1_1.csv")
df2 <- read.csv("Biolog/data/1_raw/SC4_1_2.csv")
df3 <- read.csv("Biolog/data/1_raw/SC4_1_3.csv")

# Load your data frames (assuming they are already loaded as df1, df2, df3)
# Make sure the data frames have the same columns in the same order

# Get the column names
col_names <- names(df1)

# Create an empty list to store the interleaved columns
interleaved_cols <- list()

# Interleave columns
for (col in col_names) {
  interleaved_cols[[paste0(col, "_df1")]] <- df1[[col]]
  interleaved_cols[[paste0(col, "_df2")]] <- df2[[col]]
  interleaved_cols[[paste0(col, "_df3")]] <- df3[[col]]
}

# Convert the list to a data frame
combined_df <- as.data.frame(interleaved_cols)

# Remove the specified columns
combined_df <- combined_df %>% select(-Hour_df2, -Hour_df3)

# Save the combined data frame to a new CSV file
write.csv(combined_df, "Biolog/data/4_combined_interleaved_samples/combined_data_SC4_interleaved.csv", row.names = FALSE)

######### SC5
df1 <- read.csv("Biolog/data/1_raw/SC5_1_1.csv")
df2 <- read.csv("Biolog/data/1_raw/SC5_1_2.csv")
df3 <- read.csv("Biolog/data/1_raw/SC5_1_3.csv")

# Load your data frames (assuming they are already loaded as df1, df2, df3)
# Make sure the data frames have the same columns in the same order

# Get the column names
col_names <- names(df1)

# Create an empty list to store the interleaved columns
interleaved_cols <- list()

# Interleave columns
for (col in col_names) {
  interleaved_cols[[paste0(col, "_df1")]] <- df1[[col]]
  interleaved_cols[[paste0(col, "_df2")]] <- df2[[col]]
  interleaved_cols[[paste0(col, "_df3")]] <- df3[[col]]
}

# Convert the list to a data frame
combined_df <- as.data.frame(interleaved_cols)

# Remove the specified columns
combined_df <- combined_df %>% select(-Hour_df2, -Hour_df3)

# Save the combined data frame to a new CSV file
write.csv(combined_df, "Biolog/data/4_combined_interleaved_samples/combined_data_SC5_interleaved.csv", row.names = FALSE)

######### SC6
df1 <- read.csv("Biolog/data/1_raw/SC6_1_1.csv")
df2 <- read.csv("Biolog/data/1_raw/SC6_1_2.csv")
df3 <- read.csv("Biolog/data/1_raw/SC6_1_3.csv")

# Load your data frames (assuming they are already loaded as df1, df2, df3)
# Make sure the data frames have the same columns in the same order

# Get the column names
col_names <- names(df1)

# Create an empty list to store the interleaved columns
interleaved_cols <- list()

# Interleave columns
for (col in col_names) {
  interleaved_cols[[paste0(col, "_df1")]] <- df1[[col]]
  interleaved_cols[[paste0(col, "_df2")]] <- df2[[col]]
  interleaved_cols[[paste0(col, "_df3")]] <- df3[[col]]
}

# Convert the list to a data frame
combined_df <- as.data.frame(interleaved_cols)

# Remove the specified columns
combined_df <- combined_df %>% select(-Hour_df2, -Hour_df3)

# Save the combined data frame to a new CSV file
write.csv(combined_df, "Biolog/data/4_combined_interleaved_samples/combined_data_SC6_interleaved.csv", row.names = FALSE)

