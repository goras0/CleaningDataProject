#
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
#


# load the dplyr 
library(dplyr)

# File URL to download
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

# Local data file
dataSetZip <- "./getdata-projectfiles-UCI-HAR-Dataset.zip"

# Directory
  dir <- "./UCI HAR Dataset"

# Download the dataset
if (file.exists(dataSetZip) == FALSE) {
  download.file(fileURL, destfile = dataSetZip)
}

# Uncompress data file
if (file.exists(dir) == FALSE) {
  unzip(dataSetZip)
}

# Read in the Training and Test data set
train.x <- read.table("./UCI HAR Dataset/train/X_train.txt")
train.y <- read.table("./UCI HAR Dataset/train/y_train.txt")
test.x <- read.table("./UCI HAR Dataset/test/X_test.txt")
test.y <- read.table("./UCI HAR Dataset/test/y_test.txt")

# Read in the subjects, identifies the subject who performed the activity for each window sample
train.subject <- read.table("./UCI HAR Dataset/train/subject_train.txt")
test.subject <- read.table("./UCI HAR Dataset/test/subject_test.txt")

# Read in the Features set
features <- read.table("./UCI HAR Dataset/features.txt")

# Read in the Activity labels
activity.labels <- read.table("./UCI HAR Dataset/activity_labels.txt")

#------------------------------------------------------------------------------
# 1. Merges the training and the test sets to create one data set.
#------------------------------------------------------------------------------
test.data <- test.x
train.data <- train.x

# Set the names of the features
names(test.data) <- features[,2]
names(train.data) <- features[,2]

# Add activityId as new column
test.data$activityId <- test.y[,1]
train.data$activityId <- train.y[,1]

# Add the subjectId (identify who performed the activity) as new column
test.data$subjectId <- test.subject[,1]
train.data$subjectId <- train.subject[,1]

# Merge test and train data
all.data <- rbind(test.data, train.data)

#------------------------------------------------------------------------------
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
#------------------------------------------------------------------------------

# Get unique column names with valid characters, to be able to select later on
valid.column.names <- make.names(names=names(all.data), unique=TRUE, allow_ = TRUE)
names(all.data) <- valid.column.names

# Select only the measurements on the mean and std
data.extract <- select(all.data, subjectId, activityId, contains("mean"), contains("std"))


#------------------------------------------------------------------------------
# 3. Uses descriptive activity names to name the activities in the data set
#------------------------------------------------------------------------------

data.extract$activityId[data.extract$activityId == 1] <- "Walking"
data.extract$activityId[data.extract$activityId == 2] <- "Walking Upstairs"
data.extract$activityId[data.extract$activityId == 3] <- "Walking Downstairs"
data.extract$activityId[data.extract$activityId == 4] <- "Sitting"
data.extract$activityId[data.extract$activityId == 5] <- "Standing"
data.extract$activityId[data.extract$activityId == 6] <- "Laying"

#------------------------------------------------------------------------------
# 4. Appropriately labels the data set with descriptive variable names. 
#------------------------------------------------------------------------------
names(data.extract) <- gsub('mean', 'Mean', names(data.extract))
names(data.extract) <- gsub('std', 'Std', names(data.extract))
names(data.extract) <- gsub('[()-]', '', names(data.extract))
names(data.extract) <- gsub('BodyBody', 'Body', names(data.extract))
names(data.extract) <- gsub('\\.', '', names(data.extract))

#------------------------------------------------------------------------------
# 5. From the data set in step 4, creates a second, independent tidy data set
#    with the average of each variable for each activity and each subject.
#------------------------------------------------------------------------------

# Aggregate a new data set with the average for each subject and activity
tidy.data <- aggregate(. ~subjectId + activityId, data.extract, mean)

write.table(tidy.data, file = "TidyData.txt", row.names = FALSE)

