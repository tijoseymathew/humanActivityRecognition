# Human Activity Recognition

This repository cleans the data described [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) to produce a csv file containing the combined training and testing data with the subject ID and activity name and only columns with mean and standard deviation statistics. 
A summary data frame 'summData' is also created to extract the average value of each of the features calculated for each subject and activity. 

The CodeBook.md file contains the detailed processing steps.

Execute run_analysis.R with data sets from [this link](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) extracted in folder 'UCI HAR Dataset' and in the working directory.

The workspace will contain a data.frame 'subMergedData' which includes the SubjectID and ActivityID, while 'summData' will contain the average value per subject per activity. 
