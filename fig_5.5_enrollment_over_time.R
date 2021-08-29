
# Load packages -----------------------------------------------------------
set.seed(538)
library(tidyverse)


# Build dataset -----------------------------------------------------------

enrollment <- tibble(school = c(rep("School A", 5)),
                     year = as.Date(c("2015-01-01", "2016-01-01", "2017-01-01", "2018-01-01", "2019-01-01")), 
                     enr = sample(5700:5900, 5, replace = TRUE))


# Plot --------------------------------------------------------------------

ggplot(data = enrollment, aes(x = year, y = enr)) + 
  geom_line() + 
  scale_y_continuous(limits = c(5500, 6300)) + 
  geom_text(aes(label = enr), 
            size = 3, hjust = 0.5, vjust = 3) +
  labs(#title = "Figure 5.1: Average Enrollment Over Last Five Years", 
       #subtitle = "Example of a bar chart", 
       #caption = "This is not real data", 
       x = "Year", 
       y = "Enrollment") + 
  theme(plot.title = element_text(size = rel(1.5)), 
        plot.subtitle = element_text(size = rel(1.25)), 
        #plot.caption = element_text(size = rel(1.25)), 
        axis.title = element_text(size = rel(1.25)))

ggsave("output/figure_5_5.png", width = 9000, height = 6000, units = "px", dpi = 1200)