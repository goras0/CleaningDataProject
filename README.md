# CleaningDataProject
Repo for the submission of the course project for Getting and Cleaning Data course.

## Project Overview
The purpose of this project is to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. 
The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. 
Data to work with are 'Human Activity Recognition Using Smartphones Dataset'.

## The R script 
There is a R script called run_analysis.R that does the following. 
- Merges the training and the test sets to create one data set.
- Extracts only the measurements on the mean and standard deviation for each measurement. 
- Uses descriptive activity names to name the activities in the data set
- Appropriately labels the data set with descriptive variable names. 
- From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Run the script 'run_analysis.R' in R, to get a tidy data set. The script will download and clean the activity data. The data set is stored in a file called TidyData.txt.

To see the result read the file in to R with the following commands:

data <- read.table('TidyData.txt', header = TRUE) 

View(data)

