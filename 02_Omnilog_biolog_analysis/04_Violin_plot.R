# Load required library
library(ggplot2)

# Read the data
data03 <- read.csv("tutorial_data/4_BactExtract_data/growth_rates.csv")
data03$Strain <- as.factor(data03$Strain)
head(data03)

# Define the expression for the y-axis label with appropriate size and bold formatting
y_label <- expression("Specific growth rate " * mu * " (h"^{-1}*")")

# Generate the violin plot
p_violin <- ggplot(data03, aes(x = Strain, y = OD.r)) + 
  geom_violin(fill = "white") +
  geom_jitter(width = 0.2, size = 1.5) +         # Add jittered points
  labs(x = "Strain (n=3)",                   # Change x-axis label
       y = y_label) +                        # Change Y-axis label
  scale_x_discrete(labels = c("M1152", "Y1P062", "Y1P126", "Y1P188")) + # Change x-axis labels
  scale_y_continuous(limits = c(0, 0.2)) +      # Set Y-axis limits
  coord_cartesian(ylim = c(0, 0.25)) +
  theme_minimal() +  # Use minimal theme by default
  theme(
    text = element_text(size = 24),
    axis.line.x.bottom = element_line(size = 1),
    axis.line.y.left = element_line(size = 1),
    plot.background = element_rect(fill = "white"),
    panel.background = element_rect(fill = "#ECECEC"),
    panel.grid.major = element_line(color = "black"),
    panel.grid.minor = element_blank(),
    axis.line = element_line(color = "black"),
    axis.text = element_text(color = "black", size = 24),  # Removed bold from axis text
    axis.title = element_text(color = "black"),  # Removed bold from axis titles
    axis.title.x = element_text(size = 24),    # X-axis title size 24
    axis.title.y = element_text(size = 24),    # Y-axis title size 24
    axis.text.x = element_text(size = 24),     # X-axis text size 24
    axis.text.y = element_text(size = 24),      # Y-axis text size 24
    panel.border = element_blank() # Remove border around plot
  )

# Save the violin plot to a file with custom theme
ggsave("tutorial_data/3_plots/Violin.png", plot = p_violin, width = 10, height = 6, units = "in", dpi = 300)

# Display the violin plot
print(p_violin)
