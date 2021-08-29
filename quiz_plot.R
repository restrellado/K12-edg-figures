
# Load packages -----------------------------------------------------------
set.seed(538)
library(tidyverse)


# Build dataset -----------------------------------------------------------

quiz_scores <- tibble(name = c(rep("student_1", 5),
                               rep("student_2", 5),
                               rep("student_3", 5)), 
                      quiz = c("Quiz 1", "Quiz 2", "Quiz 3", "Quiz 4", "Quiz 5", 
                               "Quiz 1", "Quiz 2", "Quiz 3", "Quiz 4", "Quiz 5", 
                               "Quiz 1", "Quiz 2", "Quiz 3", "Quiz 4", "Quiz 5"), 
                      score = sample(65:99, 15, replace = TRUE))


# Plot --------------------------------------------------------------------

quiz_scores |> 
  group_by(quiz) |> 
  summarize(mean_quiz_score = round(mean(score))) |> 
  ggplot(aes(x = quiz, y = mean_quiz_score)) + 
  scale_y_continuous(limits = c(0, 100)) + 
  geom_bar(stat = "identity", fill = "#5f239f") + 
  geom_text(aes(label = mean_quiz_score), 
            color = "white", size = 5, hjust = 0.5, vjust = 3) +
  labs(title = "Average Scores for Each Quiz", 
       subtitle = "This is not real data", 
       x = "", 
       y = "Average quiz score") + 
  theme(plot.title = element_text(size = rel(1.5)), 
        plot.subtitle = element_text(size = rel(1.25)), 
        axis.title = element_text(size = rel(1.25)), 
        axis.text.x = element_text(size = rel(1.10)))
