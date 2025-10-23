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
