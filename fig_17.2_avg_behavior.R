
# Load packages -----------------------------------------------------------
set.seed(916)
library(tidyverse)


# Build dataset -----------------------------------------------------------

behavior <- tibble(school = c(rep("School A", 5)),
                     year = as.Date(c("2019-03-03", "2019-03-04", "2019-03-05", "2019-03-06", "2019-03-07")), 
                     enr = sample(3:10, 5, replace = TRUE))


# Plot --------------------------------------------------------------------

ggplot(data = behavior, aes(x = year, y = enr)) + 
  geom_line() + 
  #scale_y_continuous(limits = c(5500, 6300)) + 
  geom_text(aes(label = enr), 
            size = 3, hjust = 0.5, vjust = 3) +
  labs(#title = "Figure 5.1: Average Enrollment Over Last Five Years", 
    #subtitle = "Example of a bar chart", 
    #caption = "This is not real data", 
    x = "Date", 
    y = "Behavior Frequency") + 
  theme(plot.title = element_text(size = rel(1.5)), 
        plot.subtitle = element_text(size = rel(1.25)), 
        #plot.caption = element_text(size = rel(1.25)), 
        axis.title = element_text(size = rel(1.25)))

ggsave("output/figure_17_2.png", width = 9600, height = 6000, units = "px", dpi = 1200)