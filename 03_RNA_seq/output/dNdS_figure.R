######### No axis break:
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


ggsave("dN-dS_plot.tiff", ggplot, width = 6, height = 6, dpi = 300)