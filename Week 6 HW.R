#Set Up ----
library(tidyverse)
library(dplyr)
library(ggplot2)
gapminder <- read_csv("https://gge-ucd.github.io/R-DAVIS/data/gapminder.csv")


show_col_types = FALSE
#got an error whe loading the package and was told to do this to quiet the error

view(gapminder)

#Problem Solving ----
colnames(gapminder)

#colMeans(gapfinder, group = colnames(lifeEXP), w = FALSE, record = FALSE, big = TRUE)
#can't find function colmeans... gotta capitalize M 

#?mean

#mean(gapminder::lifeEXP, trim=0, na.rm = FALSE)

head(gapminder)
#colMeans(gapminder)
#error - x must be numeric, there are NAs

#?colMeans

#colMeans("gapminder", na.rm = FALSE, dims = 6)
#error - x must be an array of at least two dimensions

#colMeans(gapminder, na.rm = TRUE, dims = 1L)
# x must be numeric 

#mean(gapminder[,5])
#argument is not numeric or logical, returning NA

gapminder %>% group_by(continent,year) %>%filter(continent == Asia) %>% summarise(mean_lifeEXP = mean(lifeExp))
# error filter for ASIA

gapminder %>% group_by(continent == Asiia,year) %>% summarise(mean_lifeEXP = mean(lifeExp))


gapminder %>% group_by(continent,year) %>% summarise(mean_lifeEXP = mean(lifeExp))
