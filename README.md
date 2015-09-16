# GettingAndCleaningData
### Rhyz C. Gomez


## Goal of the Repository
This repository is a partial requirement for the Getting and Cleaning Data 
Course of John Hopskins University under Coursera.  The purpose of this repo
is to give you a guide on how to tidy up the data using R programming from [UCI website](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). Be guided that the script included in this repository is only applicable for the [UCI HAR dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). Please download the dataset and unzip the UCI HAR dataset in your R working directory. You don't need to rename the files.  

## Included in the Repository
This repository has README.md file for instruction, CodeBook.md file for the description of the variables, the units and other relevant information about the dataset, and the `run_analysis`. The `run_analysis` is a script that takes the files in the UCI HAR dataset and tidy it up to obtain a more readable data. The result of the script is a table that shows the average of the mean and standard deviation of each measurement for each subject and each activity. It is saved in a .txt file. 

## The `run_analysis` Script
The script uses the `dplyr` and `reshape2` packages. For the script to work, make sure the packages are installed and/or loaded using `library` function.  As a reminder, make sure that the UCI HAR dataset is in the working directory. The script reads the working directory using `getwd` function. So, it is important that the UCI HAR dataset is in the working directory and remains unchanged.

The script reads and stores the test data in a variable i.e., `subject_test` = subject_test.txt, `x_test` = X_test.txt, `y_test` = y_test.txt,`features` = features.txt, `activity_labels` = activity_labels.txt.  It then refines and organizes each data frame to produce one table that is easy to read and understand where each variable names are specifically shown and the activity is explicitly written. The script then does the same thing with the train dataset. It then merges the resulting train and test data to make one big tidy data. 

Once the merge data is obtained, the script trims down the data and removes columns variables except from `subject', `activity` and column names with mean and standard deviation in them.  It then makes a table that shows the average for each of these measurements for each activity and each subject and save it in a txt file. 







