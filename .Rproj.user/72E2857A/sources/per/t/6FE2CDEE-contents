library(tidyverse)
library(ggplot2)


# Import data set
bio_df <- readxl::read_xlsx('data/SSMI Data Sheet Spray Trial 1.xlsx')

# Understanding our data structure
bio_df
View(bio_df)
str(bio_df)

# Make sure the data is in a useable form
bio_df <- bio_df %>% 
  mutate(Sex = factor(Sex)) %>% 
  mutate(Population = factor(Population)) %>% 
  mutate(Cage_Number = factor(Cage_Number)) %>% 
  mutate(Treatment = factor(Treatment)) %>% 
  mutate(Mating_status = factor(Mating_status)) %>% 
  mutate(Eggs = as.numeric(Eggs))
  
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
