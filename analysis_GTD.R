library(dplyr)
library(ggplot2)
library(readr)

#Role1

# Read the dataset (adjust path if needed)
terror_data <- read_csv("globalterrorismdb_0718dist.csv")

# Select only relevant columns for target type analysis
target_data <- terror_data %>%
  select(iyear, country_txt, region_txt, targtype1_txt) %>%
  filter(!is.na(targtype1_txt))  # remove missing target types

# Preview
head(target_data)

#Role2