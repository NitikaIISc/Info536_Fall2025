# Global Terrorism Database Collaborative Analysis

# Load necessary libraries
library(dplyr)
library(ggplot2)

# Load the dataset
gtd_data <- read.csv("globalterrorismdb_0718dist.csv")

# keep key columns
gtd_clean <- gtd_data %>%
  select(eventid, iyear, country_txt, success, attacktype1_txt) %>%
  filter(!is.na(success))

# Cleaned data exploration
glimpse(gtd_clean)



# calculate attack success rate by year
success_rate_year <- gtd_clean %>%
  group_by(iyear) %>%
  summarise(
    total_attacks = n(),
    successful = sum(success == 1),
    unsuccessful = sum(success == 0),
    success_rate = round(successful / total_attacks * 100, 2),
    unsuccess_rate = round(unsuccessful / total_attacks * 100, 2)
  )

