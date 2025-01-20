# Load necessary libraries
library(fredr)

working_dir <- "~/Documents/sahm_rule"
setwd(working_dir)

# Set your FRED API key
fredr_set_key("6352ad3b393d3ab83709630e61d2b14e")

# Read the CSV file
data <- read.csv("./datasets.csv")

# Loop through each row to download and save data
for (i in 1:nrow(data)) {
  # Extract relevant details
  series_id <- as.character(data$Code[i])  # Ensure it's treated as a character
  start_date <- as.Date(data$Date[i])      # Convert to Date type
  print(start_date)
  # Fetch data from FRED
  fred_data <- fredr(series_id = series_id, observation_start = start_date)
  
  # Generate a descriptive file name
  file_name <- paste0("./data/", series_id, ".csv")
  
  # Save to CSV
  write.csv(fred_data, file_name, row.names = FALSE)
}
