# Create the data frame
carbon_utilisation <- data.frame(
  Strain = c("DSM738", "SC2", "SC3", "SC4", "SC5", "SC6"),
  Percentage_carbon_utilisation = c(100.00, 100.00, 96, 84, 28, 64)
)

# Generate plot
p <- ggplot(data = carbon_utilisation, aes(x = Strain, y = Percentage_carbon_utilisation, group = 1)) +
  geom_point(stat = "identity", fill = "White", size = 5) +
  ylab("Percentage carbon utilisation (%) n=33") +  # Fixed typo in y-axis label
  xlab("Strain (n=3)") +
  coord_cartesian(ylim = c(0, 100)) +
  geom_text(aes(label = Percentage_carbon_utilisation), 
            vjust = -0.5,  # Adjust this value to offset vertically
            hjust = 1.2,   # Adjust this value to offset horizontally
            color = "black", size = 3.5) +
  geom_line(colour = "black", size = 1, linetype = "dashed") +
  theme_minimal()  # Use minimal theme by default

# Customize font size, line size, etc. (optional)
p <- p + theme(
  text = element_text(size = 24, color = "black", face = "plain"),  # Use "plain" to unbold all text
  axis.line.x.bottom = element_line(size = 1),
  axis.line.y.left = element_line(size = 1),
  axis.title.x = element_text(size = 24, color = "black", face = "plain"),    # X-axis title unbolded
  axis.title.y = element_text(size = 20, color = "black", face = "plain"),    # Y-axis title unbolded
  axis.text.x = element_text(size = 24, color = "black", face = "plain"),     # X-axis text size 15, unbolded
  axis.text.y = element_text(size = 24, color = "black", face = "plain"),     # Y-axis text unbolded
  plot.title = element_text(size = 24, color = "black", face = "plain"),      # Plot title unbolded
  plot.subtitle = element_text(size = 20, color = "black", face = "plain"),   # Plot subtitle unbolded
  plot.caption = element_text(size = 16, color = "black", face = "plain"),    # Plot caption unbolded
  plot.background = element_rect(fill = "white"),
  panel.background = element_rect(fill = "#ECECEC"),
  panel.grid.major = element_line(color = "black"),
  panel.grid.minor = element_blank(),
  axis.line = element_line(color = "black"),
  axis.title = element_text(color = "black"),
  legend.text = element_text(color = "black"),
  legend.title = element_text(color = "black"),
  panel.border = element_blank() # Remove border around plot
)

# Save the plot to a file with custom theme
ggsave("~/Documents/Work/1-Post-doc_Strathy-iUK-GSK/15_BIV_GSK_sequencing/Paper_final/Draft_back_from_Hoski)10-06-24/scripts/Biolog/plot/Diet_breadth_17-6-24.png", plot = p,
       width = 10, height = 6, units = "in", dpi = 300)

p
