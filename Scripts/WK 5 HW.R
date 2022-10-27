library(tidyverse)
#don't overload packages 

setwd("C:\Users\alexm\OneDrive\Documents\GitHub\r-davis-in-class-project-amj94") 
#always set based on the session => set wd => program directory

surveys <- read_csv("data/portal_data_joined.csv")


surveys_wide <- surveys %>% filter(!is.na(hindfoot_length)) %>% group_by(genus, plot_type)

surveys_wide

surveys_wide %>% summarize(mean_hindfoot = mean(hindfoot_length)) 

head(surveys_wide)

#%>% pivot_wider(names_from = "plot_type", values_from = mean_hindfoot) %>% arrange(Control)

surveys_wide <- surveys %>% 
  filter(!is.na(hindfoot_length)) %>% 
  group_by(genus, plot_type) %>% 
  summarise(mean_hindfoot = mean(hindfoot_length)) %>% 
  pivot_wider(names_from = plot_type, values_from = mean_hindfoot) %>% 
  arrange(Control)

surveys_wide

summary(surveys$weight)

surveys_cw <- surveys %>% mutate(weight_cat = case_when(weight<=20.00 ~ "small", weight >20 & weight<48 ~ "mediuum", T ~ "large"))

#syntax of case_when is column, condition, value

surveys_cw %>%
  group_by(weight_cat) %>%
  summarize(min = min(weight, na.rm = T),
            max = max(weight, na.rm = T))





