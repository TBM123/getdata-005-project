Getting and Cleaning Data: Course Project
=========================================

The data this project is based on was collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The data for the project came from this link.

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 


run_analysis.R
---------------
The script assumes you downloaded and unzipped the data and that the working directory is set to the base folder for the data.

The script completes the following steps:

1) Merges the training and the test sets to create one data set.
2) Extracts only the measurements on the mean and standard deviation for each measurement. 
3) Uses descriptive activity names to name the activities in the data set
4) Appropriately labels the data set with descriptive variable names. 
5) Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 


tidydata.txt
-------------
The tidy data set that resulted from the run_analysis.R script.

CodeBook.md
------------
The code book for the data. Describe the name and content of the variables.
