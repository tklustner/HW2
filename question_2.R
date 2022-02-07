library(tidyverse)
library(dplyr)
library(ggplot2)
library(sf)
library(spData)
library(scales)
library(readr)

#Chloropleth 1

crime_data <- read_csv("year_crime_data.csv")
                  
crime_data <- crime_data %>%
  mutate(BEAT = as.character(BEAT))


#Loading shape file

cca_geom <- read_sf("/Users/timklustner/Downloads/Data and Programming II/Homeworks/HW3/boundaries_chi")


police_beats <- read_sf("/Users/timklustner/Downloads/Data and Programming II/Homeworks/HW3/police_beats")


crime_df <- left_join(crime_data, police_beats, by = c("BEAT" = "beat_num"))

crime_sf <- st_sf(crime_df)

#Plotting Chloropleth 1

ggplot() +
  geom_sf(police_beats) +
  geom_sf(data = crime_sf, aes(fill = BEAT))



#Research question: This plot shows crime incidence overlaid on a map of police 
#beats in Chicago. It would help us see which beats experienced the highest level 
#of reported crime. I'd want to combine this dataset with one on police misconduct 
#allegations and see if beat location, crime prevalence and misconduct were at all 
#connected.


