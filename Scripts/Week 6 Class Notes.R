#Week 6 Intro - GG Plots ----
library(ggplot2)
library(tidyverse)
#don't overload packages 

surveys <- read_csv("data/portal_data_joined.csv")

view(surveys)
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

#the ! is.na function  is removing the na from the dataset 

surveys_wide

summary(surveys$weight)

surveys_cw <- surveys %>% 
  mutate(weight_cat = case_when(
    weight<=20.00 ~ "small", 
    weight >20 & weight<48 ~ "medium", 
    T ~ "large"))

#syntax of case_when is column, condition, value

surveys_cw

surveys_cw %>%
  group_by(weight_cat) %>%
  summarize(min = min(weight, na.rm = T),
            max = max(weight, na.rm = T))
#this code still has the na's in it, and if you wanted to create a 4th category that has the na's elsewhere:

surveys_cw <- surveys %>% 
  mutate(weight_cat = case_when(
    weight<=20.00 ~ "small", 
    weight >20 & weight<48 ~ "medium", 
    weight >= 48 ~ "large"))

head(surveys_cw)

surveys_cw %>%
  group_by(weight_cat) %>%
  filter(is.na(weight))






ggplot(surveys_cw, aes(x = weight_cat, 
                       y = hindfoot_length)) +
  geom_boxplot() +
  geom_jitter(color = "purple")

#  need to name the plot type => geom_boxplot
# aes defines the "aesthetic", or tells the plot what it needs to have/look like 

ggplot(surveys_cw, aes(x = weight_cat, 
                       y = hindfoot_length,
                       color = plot_type)) +
  geom_boxplot() +
  geom_jitter()

#if you put color = plot_type into the geom box plot, it will make the actual boxes the color, not the points

#Challenge ----

ggplot(surveys, aes(x = hindfoot_length, 
                    y = species_id %>%
                      filter(species_id == "NL" | species_id == "PF"))) +
  geom_boxplot() +
  geom_jitter

#get an error saying there's no applicable method for 'filter; applied to an object of class "character"

surveys%>%
  filter(species_id %in% c("NL","PF")) %>%
  ggplot(aes(x = species_id,
             y = hindfoot_length)) +
  geom_jitter(aes(color = plot_type))+
  geom_boxplot()

#dumb dumb don't forget to close your parentheses!!!!  


# Time Series Plots ----

surveys_complete <- read_csv("data/portal_data_joined.csv") %>%
  filter(complete.cases(.))

yearly_counts <- surveys_complete %>%
  count(year, species_id)

head(yearly_counts)
#this gives you data to plot for the year, species id, and then the total count of data points 

g = ggplot(data =yearly_counts)
class(g)

#this is telling us it's a gg plot but you haven't added any rules to make the plot yet

g + geom_point(aes(x = year, y = n)) +
  geom_path(aes(x = year, y = n))

#don't forget to link the pieces of your code with a + or a %>% when you hit enter and drop something down!!

#this function is trying to draw a line through every single possible point, so we need to filter the data to target either specific variable or a specific column

g + geom_point(aes(x = year, y = n)) +
  geom_path(aes(x = year, y = n, group = species_id))

g + geom_point(aes(x = year, y = n)) +
  geom_path(aes(x = year, y = n, color = species_id))

#Facetting ---- 
#make multiple panels in a plot where each panel represents a different value on some variable

ggplot(data = yearly_counts)+
  geom_path(mapping = aes(x=year, y = n, group = species_id))+
  NULL+
facet_wrap(~species_id)

#take this plot and break it up by spp ID

# to edit the panels, play with the scales:
#let x vary, let y vary, 

ggplot(data = yearly_counts)+
  geom_path(mapping = aes(x=year, y = n, group = species_id))+
  NULL+
  facet_wrap(~species_id, scales = "free_y") %>%
  filter(species_id == "NL" | "BA")

yearly_counts2 %>%
  filter(species_id %in% c("BA" | "DM"))
ggplot(data = yearly_counts)+
  geom_path(mapping = aes(x=year, y = n, group = species_id))+
  NULL+
  facet_wrap(~species_id, scales = "free_y") %>%
  filter(species_id == "NL" | "BA")
