## Code Book

### Source Data
A full description is available at the site where the data was obtained [http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

Here are the data for the project: [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

### Data Set Information
Human Activity Recognition Using Smartphones Dataset

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.



### Transformation Steps
 0. Download the zipped dataset and unarchive it
   1. Read in the Training and Test data set 'X_train.txt', 'y_train.txt', 'X_test.txt' and 'y_test.txt'
   2. Read in the subjects, identifies the subject who performed the activity for each window sample 'subject_train.txt' and 'subject_test.txt'
   3. Read in the Features set 'features.txt'
   4. Read in the Activity labels 'activity_labels.txt'
 1. Merge the training and the test sets to create one data set.
   1. Set the names of the features
   2. Add activityId as new column

 2. Extract only the measurements on the mean and standard deviation for each measurement. 
   1. Make syntactically valid names out of character vectors with make.names()
   2. Use select() to extract columns that contains("mean"), contains("std")
   
 3. Use descriptive activity names to name the activities in the data set

 4. Appropriately label the data set with descriptive activity names.
   1. use gsub() function replaces all matches of a string
	replace "mean" with "Mean"
	replace "std" with "Std"	
	replace "BodyBody" with "Body"
	remove "."
 
 5. Create a second, independent tidy data set with the average of each variable for each activity and each subject. 
   1. Use aggregate() to the average for each subject and activity
   
## Tidy data set

[1] SubjectId
Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

[2] ActivityId
* `WALKING` (value `1`)
* `WALKING_UPSTAIRS` (value `2`)
* `WALKING_DOWNSTAIRS` (value `3`)
* `SITTING` (value `4`)
* `STANDING` (value `5`)
* `LAYING` (value `6`)

[3-88] Features                   
 [3] "tBodyAccMeanX"                     "tBodyAccMeanY"                    
 [5] "tBodyAccMeanZ"                     "tGravityAccMeanX"                 
 [7] "tGravityAccMeanY"                  "tGravityAccMeanZ"                 
 [9] "tBodyAccJerkMeanX"                 "tBodyAccJerkMeanY"                
[11] "tBodyAccJerkMeanZ"                 "tBodyGyroMeanX"                   
[13] "tBodyGyroMeanY"                    "tBodyGyroMeanZ"                   
[15] "tBodyGyroJerkMeanX"                "tBodyGyroJerkMeanY"               
[17] "tBodyGyroJerkMeanZ"                "tBodyAccMagMean"                  
[19] "tGravityAccMagMean"                "tBodyAccJerkMagMean"              
[21] "tBodyGyroMagMean"                  "tBodyGyroJerkMagMean"             
[23] "fBodyAccMeanX"                     "fBodyAccMeanY"                    
[25] "fBodyAccMeanZ"                     "fBodyAccMeanFreqX"                
[27] "fBodyAccMeanFreqY"                 "fBodyAccMeanFreqZ"                
[29] "fBodyAccJerkMeanX"                 "fBodyAccJerkMeanY"                
[31] "fBodyAccJerkMeanZ"                 "fBodyAccJerkMeanFreqX"            
[33] "fBodyAccJerkMeanFreqY"             "fBodyAccJerkMeanFreqZ"            
[35] "fBodyGyroMeanX"                    "fBodyGyroMeanY"                   
[37] "fBodyGyroMeanZ"                    "fBodyGyroMeanFreqX"               
[39] "fBodyGyroMeanFreqY"                "fBodyGyroMeanFreqZ"               
[41] "fBodyAccMagMean"                   "fBodyAccMagMeanFreq"              
[43] "fBodyAccJerkMagMean"               "fBodyAccJerkMagMeanFreq"          
[45] "fBodyGyroMagMean"                  "fBodyGyroMagMeanFreq"             
[47] "fBodyGyroJerkMagMean"              "fBodyGyroJerkMagMeanFreq"         
[49] "angletBodyAccMeangravity"          "angletBodyAccJerkMeangravityMean" 
[51] "angletBodyGyroMeangravityMean"     "angletBodyGyroJerkMeangravityMean"
[53] "angleXgravityMean"                 "angleYgravityMean"                
[55] "angleZgravityMean"                 "tBodyAccStdX"                     
[57] "tBodyAccStdY"                      "tBodyAccStdZ"                     
[59] "tGravityAccStdX"                   "tGravityAccStdY"                  
[61] "tGravityAccStdZ"                   "tBodyAccJerkStdX"                 
[63] "tBodyAccJerkStdY"                  "tBodyAccJerkStdZ"                 
[65] "tBodyGyroStdX"                     "tBodyGyroStdY"                    
[67] "tBodyGyroStdZ"                     "tBodyGyroJerkStdX"                
[69] "tBodyGyroJerkStdY"                 "tBodyGyroJerkStdZ"                
[71] "tBodyAccMagStd"                    "tGravityAccMagStd"                
[73] "tBodyAccJerkMagStd"                "tBodyGyroMagStd"                  
[75] "tBodyGyroJerkMagStd"               "fBodyAccStdX"                     
[77] "fBodyAccStdY"                      "fBodyAccStdZ"                     
[79] "fBodyAccJerkStdX"                  "fBodyAccJerkStdY"                 
[81] "fBodyAccJerkStdZ"                  "fBodyGyroStdX"                    
[83] "fBodyGyroStdY"                     "fBodyGyroStdZ"                    
[85] "fBodyAccMagStd"                    "fBodyAccJerkMagStd"               
[87] "fBodyGyroMagStd"                   "fBodyGyroJerkMagStd" 