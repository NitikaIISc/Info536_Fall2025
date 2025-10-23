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

#Task-1
unique(gtd_data$country_txt)

gtd_data_clean <- gtd_data %>% 
  filter(!is.na(country_txt) & country_txt != "NA")

attacks_by_country <- gtd_data_clean %>%
  group_by(country_txt)

View(attacks_by_country)

#Task -2 Count 

country_attacks <- attacks_by_country %>% summarise(total_attacks = n())%>% 
  arrange(desc(total_attacks))

# Task -3 Visualization
# Subsetting the data for a cleaner Visualization
ggplot(country_attacks[1:10,],aes(x=country_txt,y=total_attacks))+geom_col()+
  labs(title = "Top 10 Countries by Number of Attacks",
       x = "Country",
       y = "Number of Attacks") +
  theme_minimal()

