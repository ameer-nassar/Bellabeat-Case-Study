# Bellabeat Case Study - Google Data Analytics Capstone

## Project Overview

This project is part of the **Google Data Analytics Capstone**, focusing on the **Bellabeat** company, a high-tech manufacturer of health-focused products for women. Bellabeat collects data on activity, sleep, and heart rate from its users’ smart devices to better understand their behaviors and provide personalized insights.

The goal of this analysis is to identify key trends in user activity, sleep, and heart rate data to help **Bellabeat’s marketing team** develop data-driven strategies to grow their membership base and improve product engagement.

---

## Files in This Repository

| File Name                              | Description |
|--------------------------------------|-------------|
| `bellabeat_analysis.R`                | Full R script used for data cleaning, analysis, and visualization. |
| `Secondary_Script_FINAL.R`            | Script used to save combined datasets to CSV files (optional). |
| `/visualizations/`                    | Folder containing all final visualizations in PDF format. |
| `Dist_of_Daily_Steps.pdf`             | Distribution of daily steps among users. |
| `Calories_Burned_vs_Steps_Taken.pdf`  | Scatterplot showing relationship between steps taken and calories burned. |
| `Daily_Heart_Rate_Trends.pdf`         | Line chart visualizing average daily heart rate over time. |

---

## Tools Used

- **R (tidyverse, ggplot2, dplyr, lubridate, janitor)** for data cleaning, analysis, and visualizations.
- **RStudio** for coding environment.
- **CSV Files** for data storage and analysis.

---

## Process Summary

### 1. Data Loading
- Loaded **multiple datasets** provided in the Bellabeat case study, covering:
    - Daily activity
    - Hourly activity intensities
    - Minute-level sleep
    - Daily calories
    - Heart rate at second-level granularity

- Combined matching datasets into larger **master datasets** for cleaner analysis.

### 2. Data Cleaning
- Removed **duplicate rows** to ensure data integrity.
- Standardized **column names** using `janitor::clean_names()` for consistency.
- Converted **timestamps to Date/Datetime formats** where needed.
- Converted **ID columns to character** to prevent type mismatch issues.
- Checked and handled **missing values** where applicable.

### 3. Exploratory Data Analysis (EDA)
- Generated **summary statistics** for activity, sleep, and heart rate.
- Explored trends between steps, calories, and sleep time.
- Analyzed **daily heart rate trends** by aggregating the heart rate dataset to daily averages to avoid performance issues caused by the massive dataset (3.6M rows).

### 4. Visualizations
- Created **histograms**, **scatterplots**, and **line charts** to visualize key trends.
- Exported plots to PDF for easy sharing.

---

## Key Insights

- **Most users take between 5,000 to 10,000 steps per day**, aligning with common fitness goals.
- **There is a positive correlation between total steps and calories burned**, confirming activity drives calorie expenditure.
- **Most users sleep between 6-8 hours per night**, but there are outliers with very low sleep durations.
- **Heart rate trends indicate natural variability, with lower heart rates at night and higher rates during active periods.**
- **Users with consistently higher activity levels also tend to track their sleep more regularly.**

---

## Conclusion

This analysis highlights several actionable insights for **Bellabeat’s marketing team**, including:

- Encouraging users to set **step goals**, since increased activity is directly tied to increased calories burned.
- Offering personalized sleep recommendations to users who sleep less than 6 hours.
- Using **daily heart rate insights** to deliver health notifications or stress alerts.
- **Cross-promoting activity and sleep tracking features** to boost engagement across Bellabeat devices.

By leveraging these insights, Bellabeat can enhance user engagement, promote healthy behaviors, and **position itself as a holistic health companion for women.**

---

## Related Links

- [Original Bellabeat Case Study Dataset](https://www.kaggle.com/arashnic/fitbit)
- [Google Data Analytics Capstone](https://www.coursera.org/professional-certificates/google-data-analytics)

---

## Data Disclaimer

This dataset is provided for educational purposes as part of the Google Data Analytics Capstone. It may not fully represent real-world user behavior or operational data at Bellabeat.

---

