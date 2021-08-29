
# Load packages -----------------------------------------------------------
set.seed(916)
library(tidyverse)

# colorblind palette
cbPalette <- c("#999999", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7")

# Build dataset -----------------------------------------------------------

assessments <- tibble(student = rep(c(1:30), 3), 
                      grade = c(rep(6, 30), rep(7, 30), rep(8, 30)), 
                      score_range = sample(c("Not Proficient", "Proficient", "Advanced"), 
                                           90, 
                                           replace = TRUE))

# Relevel factor 

assessments$score_range <- factor(assessments$score_range, levels = c( "Advanced", "Proficient", "Not Proficient"))


# Plot --------------------------------------------------------------------

ggplot(data = assessments) + 
  geom_bar(
    aes(x = grade, fill = score_range), position = "fill") +
  scale_fill_manual(values=cbPalette) +
  scale_y_continuous(labels = scales::percent) +
  labs(#title = "Figure 5.2: Quiz Score Ranges by Quiz", 
       #subtitle = "Example of a stacked bar chart\nEach quiz was taken by 30 students.", 
       #caption = "This is not real data", 
       x = "Grade", 
       y = "Percent of Students", 
       fill = "Score Range") + 
  theme(plot.title = element_text(size = rel(1.5)), 
        plot.subtitle = element_text(size = rel(1.25)), 
        plot.caption = element_text(size = rel(1.25)), 
        axis.title = element_text(size = rel(1.25)))

ggsave("output/figure_17_3.png", width = 9600, height = 6000, units = "px", dpi = 1200)
