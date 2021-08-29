
# Load packages -----------------------------------------------------------
set.seed(538)
library(tidyverse)

# colorblind palette
cbPalette <- c("#999999", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7")

# Build dataset -----------------------------------------------------------

quiz_results <- tibble(student = rep(c(1:30), 3), 
                       quiz = c(rep("Quiz 1", 30), rep("Quiz 2", 30), rep("Quiz 3", 30)), 
                       score_range = sample(c("Below Average", "Average", "Above Average"), 90, replace = TRUE))


# Plot --------------------------------------------------------------------

ggplot(data = quiz_results) + 
  geom_bar(
    aes(x = quiz, fill = score_range)) +
  scale_fill_manual(values=cbPalette) +
  labs(#title = "Figure 5.2: Quiz Score Ranges by Quiz", 
       #subtitle = "Example of a stacked bar chart\nEach quiz was taken by 30 students.", 
       #caption = "This is not real data", 
       x = "", 
       y = "Number of Students", 
       fill = "Score Range") + 
  theme(plot.title = element_text(size = rel(1.5)), 
        plot.subtitle = element_text(size = rel(1.25)), 
        plot.caption = element_text(size = rel(1.25)), 
        axis.title = element_text(size = rel(1.25)))

ggsave("output/figure_5_2.png", width = 9000, height = 6000, units = "px", dpi = 1200)
