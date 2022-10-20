# Part 1 - Set Up ----

#In order to set your WD, function is:
# setwd("C:/Users/alexm/OneDrive/Desktop/Grad School/R-Davis/r-davis-in-class-project-amj94-master")

library("tidyverse")

surveysA <- read.csv('data/portal_data_joined.csv')

colnames(surveysA)

str(surveysA)
    
view(surveysA)

# Look at the notes from class 5 => surveys %>% filter(species_id == "NL")
# filter(surveys, species_id == "NL") is another way to get the same code to work for the filter!