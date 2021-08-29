
# Load packages -----------------------------------------------------------
set.seed(538)
library(tidyverse)


# Build dataset -----------------------------------------------------------

enrollment <- tibble(school = c(rep("School A", 5),
                               rep("School B", 5),
                               rep("School C", 5)), 
                      year = c("2015", "2016", "2017", "2018", "2019", 
                               "2015", "2016", "2017", "2018", "2019", 
                               "2015", "2016", "2017", "2018", "2019"), 
                      enr = sample(800:900, 15, replace = TRUE))

schools <- enrollment |> 
  group_by(school) |> 
  summarize(mean_enrollment = round(mean(enr))) 

# Plot --------------------------------------------------------------------

ggplot(data = schools, aes(x = school, y = mean_enrollment)) + 
  scale_y_continuous(limits = c(0, 1000)) + 
  geom_bar(stat = "identity") + 
  geom_text(aes(label = mean_enrollment), 
            color = "white", size = 5, hjust = 0.5, vjust = 3) +
  labs(#title = "Figure 5.1: Average Enrollment Over Last Five Years", 
       #subtitle = "Example of a bar chart", 
       #caption = "This is not real data", 
       x = "", 
       y = "Average Enrollment") + 
  theme(plot.title = element_text(size = rel(1.5)), 
        plot.subtitle = element_text(size = rel(1.25)), 
        plot.caption = element_text(size = rel(1.25)), 
        axis.title = element_text(size = rel(1.25)))

ggsave("output/figure_5_1.png", width = 9000, height = 6000, units = "px", dpi = 1200)