library('ggplot2')

data01_1 <- read.csv("Biolog/data/2_melted_48h/738_1_1_PM1_melted_48h.csv")
data01_2 <- read.csv("Biolog/data/2_melted_48h/738_1_2_PM1_melted_48h.csv")
data01_3 <- read.csv("Biolog/data/2_melted_48h/738_1_3_PM1_melted_48h.csv")

data02_1 <- read.csv("Biolog/data/2_melted_48h/SC2_1_1_PM1_melted_48h.csv")
data02_2 <- read.csv("Biolog/data/2_melted_48h/SC2_1_2_PM1_melted_48h.csv")
data02_3 <- read.csv("Biolog/data/2_melted_48h/SC2_1_3_PM1_melted_48h.csv")

data03_1 <- read.csv("Biolog/data/2_melted_48h/SC3_1_1_PM1_melted_48h.csv")
data03_2 <- read.csv("Biolog/data/2_melted_48h/SC3_1_2_PM1_melted_48h.csv")
data03_3 <- read.csv("Biolog/data/2_melted_48h/SC3_1_3_PM1_melted_48h.csv")

data04_1 <- read.csv("Biolog/data/2_melted_48h/SC4_1_1_PM1_melted_48h.csv")
data04_2 <- read.csv("Biolog/data/2_melted_48h/SC4_1_2_PM1_melted_48h.csv")
data04_3 <- read.csv("Biolog/data/2_melted_48h/SC4_1_3_PM1_melted_48h.csv")

data05_1 <- read.csv("Biolog/data/2_melted_48h/SC5_1_1_PM1_melted_48h.csv")
data05_2 <- read.csv("Biolog/data/2_melted_48h/SC5_1_2_PM1_melted_48h.csv")
data05_3 <- read.csv("Biolog/data/2_melted_48h/SC5_1_3_PM1_melted_48h.csv")

data06_1 <- read.csv("Biolog/data/2_melted_48h/SC6_1_1_PM1_melted_48h.csv")
data06_2 <- read.csv("Biolog/data/2_melted_48h/SC6_1_2_PM1_melted_48h.csv")
data06_3 <- read.csv("Biolog/data/2_melted_48h/SC6_1_3_PM1_melted_48h.csv")


# Create a PDF file for saving the plot
pdf(file='~/Documents/Work/1-Post-doc_Strathy-iUK-GSK/15_BIV_GSK_sequencing/Biolog/JTM/DATA_2021/bactExtract/growth_curves_R/2_plot/738_all_48h.pdf', width=36, height=24)

# Create the plot with the first dataset
p <- ggplot(data01_1, aes(y = Value, x = Hour)) +
  geom_jitter(alpha = 0.2) +
  facet_wrap(Type ~ ., scales = 'free_x', nrow = 8, ncol = 12, dir = 'h')


# Add lines for additional datasets
p <- p +
  geom_point(data = data01_2, aes(y = Value, x = Hour), color = "red") +
  geom_point(data = data01_3, aes(y = Value, x = Hour), color = "blue") +
  geom_jitter(alpha = 0.2)

# Print the plot
print(p)

# Close the PDF device
dev.off()

# Create a PDF file for saving the plot
pdf(file='~/Documents/Work/1-Post-doc_Strathy-iUK-GSK/15_BIV_GSK_sequencing/Biolog/JTM/DATA_2021/bactExtract/growth_curves_R/2_plot/SC2_all_48h.pdf', width=36, height=24)

# Create the plot with the first dataset
p <- ggplot(data02_1, aes(y = Value, x = Hour)) +
  geom_jitter(alpha = 0.2) +
  facet_wrap(Type ~ ., scales = 'free_x', nrow = 8, ncol = 12, dir = 'h')


# Add lines for additional datasets
p <- p +
  geom_point(data = data02_2, aes(y = Value, x = Hour), color = "red") +
  geom_point(data = data02_3, aes(y = Value, x = Hour), color = "blue") +
  geom_jitter(alpha = 0.2)

# Print the plot
print(p)

# Close the PDF device
dev.off()

# Create a PDF file for saving the plot
pdf(file='~/Documents/Work/1-Post-doc_Strathy-iUK-GSK/15_BIV_GSK_sequencing/Biolog/JTM/DATA_2021/bactExtract/growth_curves_R/2_plot/SC3_all_48h.pdf', width=36, height=24)

# Create the plot with the first dataset
p <- ggplot(data03_1, aes(y = Value, x = Hour)) +
  geom_jitter(alpha = 0.2) +
  facet_wrap(Type ~ ., scales = 'free_x', nrow = 8, ncol = 12, dir = 'h')


# Add lines for additional datasets
p <- p +
  geom_point(data = data03_2, aes(y = Value, x = Hour), color = "red") +
  geom_point(data = data03_3, aes(y = Value, x = Hour), color = "blue") +
  geom_jitter(alpha = 0.2)

# Print the plot
print(p)

# Close the PDF device
dev.off()

# Create a PDF file for saving the plot
pdf(file='~/Documents/Work/1-Post-doc_Strathy-iUK-GSK/15_BIV_GSK_sequencing/Biolog/JTM/DATA_2021/bactExtract/growth_curves_R/2_plot/SC4_all_48h.pdf', width=36, height=24)

# Create the plot with the first dataset
p <- ggplot(data04_1, aes(y = Value, x = Hour)) +
  geom_jitter(alpha = 0.2) +
  facet_wrap(Type ~ ., scales = 'free_x', nrow = 8, ncol = 12, dir = 'h')


# Add lines for additional datasets
p <- p +
  geom_point(data = data04_2, aes(y = Value, x = Hour), color = "red") +
  geom_point(data = data04_3, aes(y = Value, x = Hour), color = "blue") +
  geom_jitter(alpha = 0.2)

# Print the plot
print(p)

# Close the PDF device
dev.off()

# Create a PDF file for saving the plot
pdf(file='~/Documents/Work/1-Post-doc_Strathy-iUK-GSK/15_BIV_GSK_sequencing/Biolog/JTM/DATA_2021/bactExtract/growth_curves_R/2_plot/SC5_all_48h.pdf', width=36, height=24)

# Create the plot with the first dataset
p <- ggplot(data05_1, aes(y = Value, x = Hour)) +
  geom_jitter(alpha = 0.2) +
  facet_wrap(Type ~ ., scales = 'free_x', nrow = 8, ncol = 12, dir = 'h')


# Add lines for additional datasets
p <- p +
  geom_point(data = data05_2, aes(y = Value, x = Hour), color = "red") +
  geom_point(data = data05_3, aes(y = Value, x = Hour), color = "blue") +
  geom_jitter(alpha = 0.2)

# Print the plot
print(p)

# Close the PDF device
dev.off()

# Create a PDF file for saving the plot
pdf(file='~/Documents/Work/1-Post-doc_Strathy-iUK-GSK/15_BIV_GSK_sequencing/Biolog/JTM/DATA_2021/bactExtract/growth_curves_R/2_plot/SC6_all_48h.pdf', width=36, height=24)

# Create the plot with the first dataset
p <- ggplot(data06_1, aes(y = Value, x = Hour)) +
  geom_jitter(alpha = 0.2) +
  facet_wrap(Type ~ ., scales = 'free_x', nrow = 8, ncol = 12, dir = 'h')


# Add lines for additional datasets
p <- p +
  geom_point(data = data06_2, aes(y = Value, x = Hour), color = "red") +
  geom_point(data = data06_3, aes(y = Value, x = Hour), color = "blue") +
  geom_jitter(alpha = 0.2)

# Print the plot
print(p)

# Close the PDF device
dev.off()