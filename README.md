# Bellabeat Case Study - Analyzing Fitness Tracker Data

## Project Overview
This project is part of the Google Data Analytics Capstone, analyzing fitness tracker data from a sample of users to uncover trends in activity, sleep, and heart rate patterns. These insights will help **Bellabeat**, a high-tech company focusing on health and wellness, develop marketing strategies and product improvements.

---

## Files in This Repository

### Main Analysis Files
- `bellabeat_analysis.R`: Full R script used for data cleaning, analysis, and visualization.
- `Secondary_Script.R`: Script used to save combined datasets to CSV files (optional, for backup and reproducibility).

### Visualizations
- **Folder**: `/visualizations/` - Contains all final visualizations in PDF format.
- `Dist_of_Daily_Steps.pdf`: Histogram showing distribution of daily steps among users.
- `Calories_Burned_vs_Steps_Taken.pdf`: Scatterplot showing the relationship between steps taken and calories burned, including a linear trend line.
- `Dist_Ttl_Mins_Asleep.pdf`: Histogram showing distribution of total minutes asleep.
- `Daily_Heart_Rate_Trends.pdf`: Line chart showing average daily heart rate over time.

---

## Original and Combined Datasets (Note)

**Important Note:**  
The following datasets were used in this project, but they were **too large to upload directly to GitHub**. These files were loaded, cleaned, and combined in RStudio. If you are recreating this analysis, you will need to download the original files and follow the provided `bellabeat_analysis.R` script to generate the combined files.

### Original Datasets (10 Files)
- `dailyActivity_merged_1.csv`
- `dailyActivity_merged_2.csv`
- `heartrate_seconds_merged_1.csv`
- `heartrate_seconds_merged_2.csv`
- `sleepDay_merged.csv`
- `dailyCalories_merged.csv`
- `hourlyIntensities_merged_1.csv`
- `hourlyIntensities_merged_2.csv`
- `minuteSleep_merged_1.csv`
- `minuteSleep_merged_2.csv`

### Combined Datasets (Created in R)
- `combined_dailyActivity.csv`
- `combined_heartrate.csv`
- `combined_hourlyIntensities.csv`
- `combined_minuteSleep.csv`

---

## Tools Used

- **R (tidyverse, dplyr, ggplot2, lubridate, janitor)**
- **RStudio Cloud**
- **CSV Files for Data Storage and Analysis**

---

## Process

### 1. Data Loading
- Loaded 10 CSV files covering **activity, sleep, heart rate, calories, hourly intensity, and minute-level sleep data**.
- Combined matching datasets into **4 combined datasets** (e.g., `combined_dailyActivity.csv`).

---

### 2. Data Cleaning
- Removed duplicates and handled missing values.
- Standardized date-time formats and column names.
- Converted data types to ensure consistency across datasets.
- Aggregated **heart rate data** from second-level to daily averages due to memory limitations (original file had **3.6 million rows**).

---

### 3. Exploratory Data Analysis (EDA)
- Analyzed patterns in **steps, calories burned, minutes asleep, and heart rate trends**.
- Compared how user activity correlates with calories burned.
- Identified patterns in daily heart rate fluctuations and sleep duration.

---

### 4. Visualizations

- **Daily Steps Distribution:** Shows how users' daily steps are distributed, highlighting a concentration at lower step counts.
- **Calories Burned vs. Steps Taken:** Scatterplot showing a positive correlation between steps taken and calories burned. A linear trend line highlights the relationship.
- **Total Minutes Asleep Distribution:** Histogram showing how sleep duration varies across users, with most falling between 300 to 500 minutes per night.
- **Daily Heart Rate Trends:** Line chart showing average daily heart rate trends over time, visualizing fluctuations in resting heart rate.

---

## Key Insights

- Most users have **relatively low daily step counts**, indicating opportunities to **encourage more physical activity**.
- There is a **strong positive correlation between steps taken and calories burned**, reinforcing the importance of encouraging movement.
- **Sleep duration varies**, but most users average between **5 to 8 hours** per night.
- Daily heart rate trends show **fluctuations tied to activity levels or other lifestyle factors**, which could be incorporated into personalized wellness recommendations.

---

## Conclusion

This analysis supports Bellabeat's goal to improve **personalized health insights** for users by identifying common activity, sleep, and heart rate patterns. These findings can guide **feature development**, **marketing messaging**, and **product design** for Bellabeat's app and devices.

---

## Data Disclaimer
This dataset is for educational purposes only and may not fully reflect real-world user behavior.

---

## Related Links
- [Google Data Analytics Capstone](https://www.coursera.org/professional-certificates/google-data-analytics)

---
