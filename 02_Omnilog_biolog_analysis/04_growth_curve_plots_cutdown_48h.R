library('ggplot2')

data01_1 <- read.csv("Biolog/data/3_melted_48h_cutdown/738_1_1_PM1_melted_48h_cutdown.csv")
data01_2 <- read.csv("Biolog/data/3_melted_48h_cutdown/738_1_2_PM1_melted_48h_cutdown.csv")
data01_3 <- read.csv("Biolog/data/3_melted_48h_cutdown/738_1_3_PM1_melted_48h_cutdown.csv")

data02_1 <- read.csv("Biolog/data/3_melted_48h_cutdown/SC2_1_1_PM1_melted_48h_cutdown.csv")
data02_2 <- read.csv("Biolog/data/3_melted_48h_cutdown/SC2_1_2_PM1_melted_48h_cutdown.csv")
data02_3 <- read.csv("Biolog/data/3_melted_48h_cutdown/SC2_1_3_PM1_melted_48h_cutdown.csv")

data03_1 <- read.csv("Biolog/data/3_melted_48h_cutdown/SC3_1_1_PM1_melted_48h_cutdown.csv")
data03_2 <- read.csv("Biolog/data/3_melted_48h_cutdown/SC3_1_2_PM1_melted_48h_cutdown.csv")
data03_3 <- read.csv("Biolog/data/3_melted_48h_cutdown/SC3_1_3_PM1_melted_48h_cutdown.csv")

data04_1 <- read.csv("Biolog/data/3_melted_48h_cutdown/SC4_1_1_PM1_melted_48h_cutdown.csv")
data04_2 <- read.csv("Biolog/data/3_melted_48h_cutdown/SC4_1_2_PM1_melted_48h_cutdown.csv")
data04_3 <- read.csv("Biolog/data/3_melted_48h_cutdown/SC4_1_3_PM1_melted_48h_cutdown.csv")

data05_1 <- read.csv("Biolog/data/3_melted_48h_cutdown/SC5_1_1_PM1_melted_48h_cutdown.csv")
data05_2 <- read.csv("Biolog/data/3_melted_48h_cutdown/SC5_1_2_PM1_melted_48h_cutdown.csv")
data05_3 <- read.csv("Biolog/data/3_melted_48h_cutdown/SC5_1_3_PM1_melted_48h_cutdown.csv")

data06_1 <- read.csv("Biolog/data/3_melted_48h_cutdown/SC6_1_1_PM1_melted_48h_cutdown.csv")
data06_2 <- read.csv("Biolog/data/3_melted_48h_cutdown/SC6_1_2_PM1_melted_48h_cutdown.csv")
data06_3 <- read.csv("Biolog/data/3_melted_48h_cutdown/SC6_1_3_PM1_melted_48h_cutdown.csv")


# Create a PDF file for saving the plot
pdf(file='~/Documents/Work/1-Post-doc_Strathy-iUK-GSK/15_BIV_GSK_sequencing/Biolog/JTM/DATA_2021/bactExtract/growth_curves_R/2_plot/All_cutdown.pdf', width=40, height=3)

# Create the plot with the first dataset
p1a <- ggplot(data01_1, aes(y = Value, x = Hour)) +
  geom_jitter(alpha = 0.2) +
  facet_wrap(Type ~ ., scales = 'free_x', nrow = 1, ncol = 26, dir = 'h')


# Add lines for additional datasets
p1b <- p1a +
  geom_point(data = data01_2, aes(y = Value, x = Hour), color = "red") +
  geom_point(data = data01_3, aes(y = Value, x = Hour), color = "blue") +
  geom_jitter(alpha = 0.2) +
  xlab("Hour") +   # Change x-axis label
  ylab("Relative growth")    # Change y-axis label

# Create the plot with the first dataset
p2a <- ggplot(data02_1, aes(y = Value, x = Hour)) +
  geom_jitter(alpha = 0.2) +
  facet_wrap(Type ~ ., scales = 'free_x', nrow = 1, ncol = 26, dir = 'h')

# Add lines for additional datasets
p2b <- p2a +
  geom_point(data = data02_2, aes(y = Value, x = Hour), color = "red") +
  geom_point(data = data02_3, aes(y = Value, x = Hour), color = "blue") +
  geom_jitter(alpha = 0.2) +
  xlab("Hour") +   # Change x-axis label
  ylab("Relative growth")    # Change y-axis label

# Create the plot with the first dataset
p3a <- ggplot(data03_1, aes(y = Value, x = Hour)) +
  geom_jitter(alpha = 0.2) +
  facet_wrap(Type ~ ., scales = 'free_x', nrow = 1, ncol = 26, dir = 'h')

# Add lines for additional datasets
p3b <- p3a +
  geom_point(data = data03_2, aes(y = Value, x = Hour), color = "red") +
  geom_point(data = data03_3, aes(y = Value, x = Hour), color = "blue") +
  geom_jitter(alpha = 0.2) +
  xlab("Hour") +   # Change x-axis label
  ylab("Relative growth")    # Change y-axis label

# Create the plot with the first dataset
p4a <- ggplot(data04_1, aes(y = Value, x = Hour)) +
  geom_jitter(alpha = 0.2) +
  facet_wrap(Type ~ ., scales = 'free_x', nrow = 1, ncol = 26, dir = 'h')


# Add lines for additional datasets
p4b <- p4a +
  geom_point(data = data04_2, aes(y = Value, x = Hour), color = "red") +
  geom_point(data = data04_3, aes(y = Value, x = Hour), color = "blue") +
  geom_jitter(alpha = 0.2) +
  xlab("Hour") +   # Change x-axis label
  ylab("Relative growth")    # Change y-axis label

# Create the plot with the first dataset
p5a <- ggplot(data05_1, aes(y = Value, x = Hour)) +
  geom_jitter(alpha = 0.2) +
  facet_wrap(Type ~ ., scales = 'free_x', nrow = 1, ncol = 26, dir = 'h')

# Add lines for additional datasets
p5b <- p5a +
  geom_point(data = data05_2, aes(y = Value, x = Hour), color = "red") +
  geom_point(data = data05_3, aes(y = Value, x = Hour), color = "blue") +
  geom_jitter(alpha = 0.2) +
  xlab("Hour") +   # Change x-axis label
  ylab("Relative growth")    # Change y-axis label

# Create the plot with the first dataset
p6a <- ggplot(data06_1, aes(y = Value, x = Hour)) +
  geom_jitter(alpha = 0.2) +
  facet_wrap(Type ~ ., scales = 'free_x', nrow = 1, ncol = 26, dir = 'h')

# Add lines for additional datasets
p6b <- p6a +
  geom_point(data = data06_2, aes(y = Value, x = Hour), color = "red") +
  geom_point(data = data06_3, aes(y = Value, x = Hour), color = "blue") +
  geom_jitter(alpha = 0.2) +
  xlab("Hour") +   # Change x-axis label
  ylab("Relative growth")    # Change y-axis label

# Print the plot
print(p1b)
print(p2b)
print(p3b)
print(p4b)
print(p5b)
print(p6b)

# Close the PDF device
dev.off()