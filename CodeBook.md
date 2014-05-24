

## Data
The data used for this analysis was obtained from [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). 
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

## Pre-Processing
The steps performed for pre-processing the raw data are summerized below
- Combine the x\_test.txt & x\_train.txt into a single file.
- Add column names using mapping from features.txt.
- Add the subject ID and activity name for each observation.
- Change activity name into factors using mapping from activity_labels.txt
- Select columns that have either "mean" or "std" in thier names.
- Finally create a tidy set by calculating the mean value of each feature by subject ID and activity name.

## Analysis
The cleaned data set consists of the combined train and test data sets from the original source. Each observation contains,
- SubjectID :- ID of the sub the subjects in the range 1-30
- 79 features :- Features from the original data set that have either "mean" or "std" in 'feature.txt'
- ActivityName :- Activity label for the observation

## subMergedData.csv
Contains 10299 observations in the above mentioned format which were obtained by combining the train and test data of the original source and utilizes only the mean and standard deviation measurements.

## summData.csv
Contains the summary of the data in subMergedData, that is it has one row for each SubjectID, ActivityID pair (6*30=180) where the features are the average value for the pair.