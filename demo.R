library(tidyverse)

# Import data set
bio_df <- readxl::read_xlsx('data/SSMI Data Sheet Spray Trial 1.xlsx')

# Understanding our data structure
bio_df
View(bio_df)
str(bio_df)

# Selecting columns
bio_df %>% 
  select(Mating_status:Eggs) %>% 
  str()

# Filtering 
bio_df %>% 
  filter(Death == 0)

# Grouping
bio_df %>% 
  select(Mating_status, Survival) %>% 
  group_by(Mating_status) 

# Summarizing data base on groups
bio_df %>% 
  select(Mating_status, Survival) %>% 
  group_by(Mating_status) %>% 
  summarise(mean_survivial = mean(Survival))

bio_df %>% count(Treatment)

# Converting the cateogorical variables to factor
bio_df <- bio_df %>% 
  mutate(Sex = factor(Sex)) %>% 
  mutate(Population = factor(Population)) %>% 
  mutate(Cage_Number = factor(Cage_Number)) %>% 
  mutate(Treatment = factor(Treatment)) %>% 
  mutate(Mating_status = factor(Mating_status)) %>% 
  mutate(Eggs = as.numeric(Eggs))

# Other ways to subset
bio_df[1, 1] # first row, first column
bio_df[1:5, 2:4] # rows 1-5, columns 2-4
bio_df[, -1] # Everything but first column
bio_df$Population # Pick columns by name

# Base R plotting
# Continuous variables will be in scatter plot
plot(x = bio_df$Day, y = bio_df$Percent_survival) 

# Categorical has boxplot on default
plot(x = bio_df$Sex, y = bio_df$Percent_survival)

# R has many base plotting functions. Google "R some_plot_you_want_to_make"

# ggplot
library(ggplot2)

# Note the package is called ggplot2, but the function to generate plotting
# data is called ggplot.

demoplot <- bio_df %>% 
  ggplot(mapping = aes(x = Day, y = Survival)) 

demoplot + 
  geom_point()

# You will need to "+" geom_graphical element.
# It still gets me from time to time and I always forget what the problem is.


# Now we can re-use our plot object
demoplot +
  geom_smooth()

demoplot +
  geom_point(aes(color = Sex))

demoplot +
  geom_point(aes(color = Mating_status)) +
  facet_wrap(~ Treatment)

demoplot +
  geom_point(aes(color = Percent_survival)) +
  facet_wrap(Mating_status ~ Treatment)

demoplot +
  geom_point(aes(color = Percent_survival, shape = Sex), size = 3) +
  facet_wrap(Mating_status ~ Treatment)

# Have Fun!


