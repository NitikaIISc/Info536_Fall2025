# Global Terrorism Database Collaborative Analysis

# Load necessary libraries
library(dplyr)
library(ggplot2)

# Load the dataset
gtd_data <- read.csv("globalterrorismdb_0718dist.csv", 
                     stringsAsFactors = FALSE)

# Basic data exploration
glimpse(gtd_data)
View(gtd_data)

unique(gtd_data$country_txt)

gtd_data_clean <- gtd_data %>% 
  filter(!is.na(country_txt) & country_txt != "NA")

attacks_by_country <- gtd_data_clean %>%
  group_by(country_txt)

View(attacks_by_country)


