#Part 1 - Set Up ----

library("tidyverse")

surveys <- read_csv('data/portal_data_joined.csv')

#Part 2 - Filter ----
surveys <- na.omit(surveys)

view(surveys)

str(surveys)

surveys %>% filter(weight>30 & weight<60)
#this pipe is the only way to filter surveys by weight in one line of code

#Part 3 - Show the first 6 Rows ---- 
head(surveys)
#This lets you see the six rows, 6 is the automatic default for the head fxn

#Part 4 - Biggest Critters ----
biggest_critters <- surveys

view(biggest_critters)

biggest_critters %>% group_by(species_id, sex)

?summarize

summarize(biggest_critters, weight(max))
