# Global Terrorism Database Collaborative Analysis

# Load necessary libraries
library(dplyr)
library(ggplot2)

# Download and unzip data file 
url <- "https://www.kaggle.com/api/v1/datasets/download/START-UMD/gtd"
destfile <- "data.zip"

# Download the ZIP file
download.file(url, destfile, mode = "wb")

# Unzip the file to a directory (e.g., 'data')
unzip(destfile, exdir = getwd())

#Remove the zipfile
file.remove(destfile)


# Load the dataset
gtd_data <- read.csv("globalterrorismdb_0718dist.csv", 
                     stringsAsFactors = FALSE)

# Basic data exploration
glimpse(gtd_data)

names(gtd_data)

# we can see we have 2 columns which can help us answer 
# Group 2	Fatalities per Region Group 2: Ankur, Bharath Cherukuru, Bharath Naveen
# nkill and region_txt

# Select relevant columns and clean data
gtd_clean <- gtd_data %>%
  select(region_txt, nkill) %>%              # region name and number killed
  filter(!is.na(region_txt)) %>%             # remove missing regions
  mutate(nkill = ifelse(is.na(nkill), 0, nkill))


# Summarize total fatalities per region
fatalities_per_region <- gtd_clean %>%
  group_by(region_txt) %>%
  summarise(total_fatalities = sum(nkill, na.rm = TRUE)) %>%
  arrange(desc(total_fatalities))

# View the summary
print(fatalities_per_region)


# This is the visualization part
library(ggplot2)
ggplot(fatalities_per_region, aes(x= reorder(region_txt, total_fatalities), 
                                  y= total_fatalities)) + geom_bar(stat = "identity" , fill = "dodgerblue") + coord_flip() + labs(title = "Total fatalities per region", x= "region", y="total fatalities") + theme_minimal()

