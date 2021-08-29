
# Load packages -----------------------------------------------------------
set.seed(916)
library(tidyverse)


# Build dataset -----------------------------------------------------------

quiz_scores <- tibble(grade = rep(c(1:5), 3), 
                      score = sample(65:99, 15, replace = TRUE))


# Plot --------------------------------------------------------------------

quiz_scores |> 
  group_by(grade) |> 
  summarize(mean_quiz_score = round(mean(score))) |> 
  ggplot(aes(x = grade, y = mean_quiz_score)) + 
  scale_y_continuous(limits = c(0, 100)) + 
  geom_bar(stat = "identity") + 
  geom_text(aes(label = mean_quiz_score), 
            color = "white", size = 5, hjust = 0.5, vjust = 3) +
  labs(#title = "Average Scores for Each Quiz", 
       #subtitle = "This is not real data", 
       #caption = "This is not real data", 
       x = "Grade Level", 
       y = "Percent Proficient") + 
  theme(plot.title = element_text(size = rel(1.5)), 
        plot.subtitle = element_text(size = rel(1.25)), 
        plot.caption = element_text(size = rel(1.25)), 
        axis.title = element_text(size = rel(1.25)))

ggsave("output/figure_17_1.png", width = 9600, height = 6000, units = "px", dpi = 1200)