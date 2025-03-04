# install and load necessary packages and libraries 
install.packages("dplyr")
library(dplyr)
install.packages("tidyverse")
library(tidyverse)
install.packages("lubridate")
library(lubridate)
install.packages("ggplot2")
library(ggplot2)
install.packages("janitor")
library(janitor)

## Read all csv files

# Read daily activity data
daily_activity_1 <- read.csv("dailyActivity_merged_1.csv")
daily_activity_2 <- read.csv("dailyActivity_merged_2.csv")

# Read heart rate data
heartrate_1 <- read.csv("heartrate_seconds_merged_1.csv")
heartrate_2 <- read.csv("heartrate_seconds_merged_2.csv")

# Read sleep data (only one file available)
sleep_data <- read.csv("sleepDay_merged.csv")

# Read daily calories (only one file available)
daily_calories <- read.csv("dailyCalories_merged.csv")

# Read hourly intensities
hourly_intensities_1 <- read.csv("hourlyIntensities_merged_1.csv")
hourly_intensities_2 <- read.csv("hourlyIntensities_merged_2.csv")

# Read minute-level sleep data
minute_sleep_1 <- read.csv("minuteSleep_merged_1.csv")
minute_sleep_2 <- read.csv("minuteSleep_merged_2.csv")

## Merge matching files - 8 files out of the 10 -

# Merge daily activity data
combined_daily_activity <- bind_rows(daily_activity_1, daily_activity_2)

# Merge heart rate data
combined_heartrate <- bind_rows(heartrate_1, heartrate_2)

# Merge hourly intensities
combined_hourly_intensities <- bind_rows(hourly_intensities_1, hourly_intensities_2)

# Merge minute-level sleep data
combined_minute_sleep <- bind_rows(minute_sleep_1, minute_sleep_2)

## Saved all merged datasets in Secondary_Script, didn't run here but is in console below 

## Data Cleaning 

# Check missing values in all datasets
sapply(list(combined_daily_activity, combined_heartrate, combined_hourly_intensities, 
            combined_minute_sleep, sleep_data, daily_calories), function(x) sum(is.na(x)))

# Count duplicate rows in each dataset
sapply(list(combined_daily_activity, combined_heartrate, combined_hourly_intensities, 
            combined_minute_sleep, sleep_data, daily_calories), function(x) sum(duplicated(x)))

# Remove duplicates from affected datasets
combined_heartrate <- combined_heartrate %>% distinct()
combined_hourly_intensities <- combined_hourly_intensities %>% distinct()
combined_minute_sleep <- combined_minute_sleep %>% distinct()
sleep_data <- sleep_data %>% distinct()

# Check for remaining duplicate rows
sapply(list(combined_heartrate, combined_hourly_intensities, combined_minute_sleep, sleep_data), 
       function(x) sum(duplicated(x)))

# Check structure of datasets with date columns
str(combined_daily_activity)
str(sleep_data)
str(combined_minute_sleep)
str(combined_heartrate)
str(combined_hourly_intensities)
str(daily_calories)

# Convert ActivityDate to Date format
combined_daily_activity$ActivityDate <- mdy(combined_daily_activity$ActivityDate)

# Convert SleepDay to Date-Time format (removing unnecessary time part)
sleep_data$SleepDay <- mdy_hms(sleep_data$SleepDay)

# Convert minute sleep date to Date-Time format
combined_minute_sleep$date <- mdy_hms(combined_minute_sleep$date)

# Convert heart rate timestamp (if applicable)
combined_heartrate$Time <- mdy_hms(combined_heartrate$Time)

# Convert hourly intensities timestamp (if applicable)
combined_hourly_intensities$ActivityHour <- mdy_hms(combined_hourly_intensities$ActivityHour)

# Convert daily calories date (if applicable)
daily_calories$ActivityDay <- mdy(daily_calories$ActivityDay)

# Standardize column names

# Clean column names for all datasets
combined_daily_activity <- clean_names(combined_daily_activity)
combined_heartrate <- clean_names(combined_heartrate)
combined_hourly_intensities <- clean_names(combined_hourly_intensities)
combined_minute_sleep <- clean_names(combined_minute_sleep)
sleep_data <- clean_names(sleep_data)
daily_calories <- clean_names(daily_calories)

# Check if changes worked
colnames(combined_daily_activity)
colnames(combined_heartrate)
colnames(combined_hourly_intensities)
colnames(combined_minute_sleep)
colnames(sleep_data)
colnames(daily_calories)

# Fix data types 

# Convert ID columns to character
combined_daily_activity$id <- as.character(combined_daily_activity$id)
combined_heartrate$id <- as.character(combined_heartrate$id)
combined_hourly_intensities$id <- as.character(combined_hourly_intensities$id)
combined_minute_sleep$id <- as.character(combined_minute_sleep$id)
sleep_data$id <- as.character(sleep_data$id)
daily_calories$id <- as.character(daily_calories$id)

# Convert numeric columns (ensure they are correctly set)
combined_daily_activity$total_steps <- as.numeric(combined_daily_activity$total_steps)
combined_daily_activity$total_distance <- as.numeric(combined_daily_activity$total_distance)
combined_daily_activity$calories <- as.numeric(combined_daily_activity$calories)

sleep_data$total_minutes_asleep <- as.numeric(sleep_data$total_minutes_asleep)
sleep_data$total_time_in_bed <- as.numeric(sleep_data$total_time_in_bed)

combined_hourly_intensities$total_intensity <- as.numeric(combined_hourly_intensities$total_intensity)
combined_hourly_intensities$average_intensity <- as.numeric(combined_hourly_intensities$average_intensity)

daily_calories$calories <- as.numeric(daily_calories$calories)

# Confirm the changes
str(combined_daily_activity)
str(sleep_data)
str(combined_hourly_intensities)
str(daily_calories)
str(combined_heartrate)
str(combined_minute_sleep)

### Data cleaning complete! 

## Data analysis 

# Summary statistics for key datasets
summary(combined_daily_activity)
summary(sleep_data)
summary(combined_heartrate)
summary(combined_hourly_intensities)
summary(daily_calories)
summary(combined_minute_sleep)

### Data analysis complete!

## Data visualizations 

# Histogram of daily steps
ggplot(combined_daily_activity, aes(x = total_steps)) +
  geom_histogram(binwidth = 1000, fill = "steelblue", color = "black", alpha = 0.7) +
  labs(title = "Distribution of Daily Steps",
       x = "Total Steps",
       y = "Count of Users") +
  theme_minimal()

# Scatterplot of Calories vs. Steps
ggplot(combined_daily_activity, aes(x = total_steps, y = calories)) +
  geom_point(color = "darkred", alpha = 0.5) +
  geom_smooth(method = "lm", color = "blue", se = FALSE) +
  labs(title = "Calories Burned vs. Steps Taken",
       x = "Total Steps",
       y = "Calories Burned") +
  theme_minimal()

# Histogram of Total Minutes Asleep
ggplot(sleep_data, aes(x = total_minutes_asleep)) +
  geom_histogram(binwidth = 50, fill = "purple", color = "black", alpha = 0.7) +
  labs(title = "Distribution of Total Minutes Asleep",
       x = "Total Minutes Asleep",
       y = "Count of Users") +
  theme_minimal()

#### Was having a lot of issues with my last visualization (heart rate trends) - decided to reduce data size since it was crashing my RAM,
#### the dataset has 3.6+ millions observations, I aggregated the data by day (to a few dozen) to avoid RAM issues (upgraded RAM to 6GB)
#### Daily heart rate fluctuations are more meaningful for analysis, Bellabeat wants daily insights into trends, not second-by-second

# Aggregate Heart Rate Data by Day
heart_rate_daily <- combined_heartrate %>%
  mutate(date = as.Date(time)) %>%
  group_by(date) %>%
  summarise(avg_daily_heart_rate = mean(value, na.rm = TRUE))

# Line Plot: Daily Heart Rate Trends
ggplot(heart_rate_daily, aes(x = date, y = avg_daily_heart_rate)) +
  geom_line(color = "blue", alpha = 0.7) +
  labs(title = "Daily Heart Rate Trends",
       x = "Date",
       y = "Average Daily Heart Rate (BPM)") +
  theme_minimal()

### Data visualizations complete! 

