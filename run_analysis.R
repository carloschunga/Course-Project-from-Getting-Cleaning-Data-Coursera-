#This R script loads, manipulates and cleans the data to get a final dataset (final_dataset) as well as
#a dataset with the means for each relevant variable, grouped by each one of the 30 subjects and each one
#of the 6 activities.

#First, we load the library we're going to be using, tidyverse, which already includes packages such as:
#dplyr, stringr, etc.

library(tidyverse)

#Before beginning, we load the relevant data sets. In this case, I didn't include a script to download the
#data, I did it beforehand due to its big size. However, if you wish to include a function to download the file,
#you can use download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
#destfile="[insert your destination file here].zip"), then extract the information from the .zip with some package
#and then modify the following functions to extract the .txt files. Now, I'll be loading the data sets for my
#computer:

setwd("C:/Users/Carlos/Desktop")

features <- read.table("./Course Project/UCI HAR Dataset/features.txt", header=F, sep="")
activity_labels <- read.table("./Course Project/UCI HAR Dataset/activity_labels.txt", header=F, sep="")

X_train <- read.table("./Course Project/UCI HAR Dataset/train/X_train.txt", header=F, sep="")
names(X_train) <- features$V2
y_train <- read.table("./Course Project/UCI HAR Dataset/train/y_train.txt", header=F, sep="")
subject_train <- read.table("./Course Project/UCI HAR Dataset/train/subject_train.txt", header=F, sep="")

train <- cbind(X_train, y_train, subject_train)
names(train)[562] <- "activities"
names(train)[563] <- "subject"

X_test <- read.table("./Course Project/UCI HAR Dataset/test/X_test.txt", header=F, sep="")
names(X_test) <- features$V2
y_test <- read.table("./Course Project/UCI HAR Dataset/test/y_test.txt", header=F, sep="")
subject_test <- read.table("./Course Project/UCI HAR Dataset/test/subject_test.txt", header=F, sep="")

test <- cbind(X_test, y_test, subject_test)
names(test)[562] <- "activities"
names(test)[563] <- "subject"




##########
##1ST STEP: "Merges the training and the test sets to create one data set."
##########

full_dataset <- rbind(train, test)




##########
##2ND STEP: "Extracts only the measurements on the mean and standard deviation for each measurement."
##########

mean_names <- grep("\\bmean()\\b", names(full_dataset), value=TRUE)
std_names <- grep("std", names(full_dataset), value=TRUE)
names_to_extract <- append(mean_names, std_names)
final_dataset <- select(full_dataset, subject, activities, names_to_extract)

#Here I remove these objects from the environment just in case. I won't be using them anymore:

rm("full_dataset"); rm("train"); rm("X_train"); rm("test"); rm("X_test")




##########
##3RD STEP: "Uses descriptive activity names to name the activities in the data set"
##########

temporary <- final_dataset$activities
for(i in 1:max(activity_labels$V1)) {
  temporary <- sub(activity_labels$V1[i], activity_labels$V2[i], temporary)
}
final_dataset$activities <- temporary

final_dataset <- arrange(final_dataset, subject, activities)




##########
##4TH STEP: "Appropriately labels the data set with descriptive variable names."
##########

names <- names(final_dataset)

names <- sub("^t", "time", names)
names <- sub("^f", "frequency", names)
names <- gsub("Body", "_body", names)
names <- sub("Gravity", "_gravity", names)
names <- sub("Acc", "_accelerometer", names)
names <- sub("Gyro", "_gyroscope", names)
names <- sub("Jerk", "_jerk", names)
names <- sub("Mag", "_magnitude", names)
names <- sub("-mean\\()", "_mean", names)
names <- sub("-std\\()", "_std", names)
names <- sub("-X", "_x", names)
names <- sub("-Y", "_y", names)
names <- sub("-Z", "_z", names)

names(final_dataset) <- names




##########
##5TH STEP: "From the data set in step 4, creates a second, independent tidy data set with the average of
##          each variable for each activity and each subject."
##########

grouped_dataset <- final_dataset %>%
  group_by(subject,activities) %>%
  summarise_all(list(mean))




write.table(grouped_dataset, "tidy_dataset.txt", row.names=FALSE)




#The final data sets are: "final_dataset" and "grouped_dataset". With this, we conclude the 5 requirements for
#"run_analysis.R".

