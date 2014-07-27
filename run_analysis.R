## Load the data
if(!file.exists('uciharDataset.zip')) {
    download.file('https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip', destfile='uciharDataset.zip')
}

## read features data
features <- read.table("features.txt")

## read train data and build the training dataset
x_train <- read.table("./train/X_train.txt")
names(x_train) <- features$V2

y_train <- read.table("./train/y_train.txt")
names(y_train) <- c("activity")
                      
subject_train <-  read.table("./train//subject_train.txt")
names(subject_train) <- c("subjectID")

trainData <- cbind(subject_train, y_train, x_train)

## read test data and build the training dataset
x_test <- read.table("./test/X_test.txt")
names(x_test) <- features$V2

y_test <- read.table("./test/y_test.txt")
names(y_test) <- c("activity")

subject_test <-  read.table("./test//subject_test.txt")
names(subject_test) <- c("subjectID")

testData <- cbind(subject_test, y_test, x_test)


## Merge the training and the test sets to create one data set.
dataset <- rbind(trainData, testData)


## Extracts only the measurements on the mean and standard deviation for each measurement. 
names(dataset) <- tolower(names(dataset))
pattern <- "mean|std"
relevantColIndices  <-  grep(pattern, names(dataset))
dataset <- dataset[ ,c(1,2,relevantColIndex)]


## Uses descriptive activity names to name the activities in the data set

activities <- read.table("activity_labels.txt")
dataset$activity <- tolower(activities[2][dataset$activity,])
dataset$activity <- as.factor(dataset$activity)

## Appropriately labels the data set with descriptive variable names. 

varNames <- names(dataset)

## replace all trailing t's with time
varNames <- gsub("^t", "time", varNames)
## replace all trailing f's with FFT
varNames <- gsub("^f", "FFT", varNames)
## replace all body with Body
varNames <- gsub("body", "Body", varNames)
## replace all gravity with Gravity
varNames <- gsub("gravity", "Gravity", varNames)
## replace all gyro with Gyro
varNames <- gsub("gyro", "Gyro", varNames)
## replace all jerk with Jerk
varNames <- gsub("jerk", "Jerk", varNames)
## replace all acc with Acceleration
varNames <- gsub("acc", "Acceleration", varNames)
## replace all mag with Magnitude
varNames <- gsub("mag", "Magnitude", varNames)
## remove all ()  
varNames <- gsub("\\(\\)", "", varNames)


## Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
tidyDataSet <- aggregate(dataset, list(dataset$activity, dataset$subjectid), mean)


## Write the tidy dataset into a txt file
write.table(tidyDataSet, file="./tidydata.txt", sep="\t")