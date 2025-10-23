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
