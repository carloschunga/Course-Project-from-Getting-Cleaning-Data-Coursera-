---
title: "Code Book for the Final Project on Coursera"
author: "Carlos Chunga"
date: "8/9/2020"
output: pdf_document
---

## 1. Brief Introduction

This little R Markdown Document describes the variables in the two final data sets: "final_dataset" and "grouped_dataset" ("tidy_dataset.txt"), the data, and all the transformations I used to wrangle and clean up the data. "grouped_dataset" corresponds to the output dataset from the step 5.

## 2. Variables and Data

For both data sets, we have a total of 68 variables. The "final_dataset" has 10299 observations while "grouped_dataset" has 180 due to grouping by subject and activity. The 68 variables are:


 [1] "subject"                                               
 [2] "activities"                                           
 [3] "time_body_accelerometer_mean_x"                        
 [4] "time_body_accelerometer_mean_y"                       
 [5] "time_body_accelerometer_mean_z"                        
 [6] "time_gravity_accelerometer_mean_x"                    
 [7] "time_gravity_accelerometer_mean_y"                     
 [8] "time_gravity_accelerometer_mean_z"                    
 [9] "time_body_accelerometer_jerk_mean_x"                   
 [10] "time_body_accelerometer_jerk_mean_y"                  
[11] "time_body_accelerometer_jerk_mean_z"                   
[12] "time_body_gyroscope_mean_x"                           
[13] "time_body_gyroscope_mean_y"                            
[14] "time_body_gyroscope_mean_z"                           
[15] "time_body_gyroscope_jerk_mean_x"                       
[16] "time_body_gyroscope_jerk_mean_y"                      
[17] "time_body_gyroscope_jerk_mean_z"                       
[18] "time_body_accelerometer_magnitude_mean"               
[19] "time_gravity_accelerometer_magnitude_mean"             
[20] "time_body_accelerometer_jerk_magnitude_mean"          
[21] "time_body_gyroscope_magnitude_mean"                    
[22] "time_body_gyroscope_jerk_magnitude_mean"              
[23] "frequency_body_accelerometer_mean_x"                   
[24] "frequency_body_accelerometer_mean_y"                  
[25] "frequency_body_accelerometer_mean_z"                   
[26]"frequency_body_accelerometer_jerk_mean_x"             
[27] "frequency_body_accelerometer_jerk_mean_y"              
[28] "frequency_body_accelerometer_jerk_mean_z"             
[29] "frequency_body_gyroscope_mean_x"                       
[30] "frequency_body_gyroscope_mean_y"                      
[31] "frequency_body_gyroscope_mean_z"                       
[32] "frequency_body_accelerometer_magnitude_mean"          
[33] "frequency_body_body_accelerometer_jerk_magnitude_mean" 
[34] "frequency_body_body_gyroscope_magnitude_mean"         
[35] "frequency_body_body_gyroscope_jerk_magnitude_mean"     
[36] "time_body_accelerometer_std_x"                        
[37] "time_body_accelerometer_std_y"                         
[38] "time_body_accelerometer_std_z"                        
[39] "time_gravity_accelerometer_std_x"                      
[40] "time_gravity_accelerometer_std_y"                     
[41] "time_gravity_accelerometer_std_z"                      
[42] "time_body_accelerometer_jerk_std_x"                   
[43] "time_body_accelerometer_jerk_std_y"                    
[44] "time_body_accelerometer_jerk_std_z"                   
[45] "time_body_gyroscope_std_x"                             
[46] "time_body_gyroscope_std_y"                            
[47] "time_body_gyroscope_std_z"                             
[48] "time_body_gyroscope_jerk_std_x"                       
[49] "time_body_gyroscope_jerk_std_y"                        
[50] "time_body_gyroscope_jerk_std_z"                       
[51] "time_body_accelerometer_magnitude_std"                 
[52] "time_gravity_accelerometer_magnitude_std"             
[53] "time_body_accelerometer_jerk_magnitude_std"            
[54] "time_body_gyroscope_magnitude_std"                    
[55] "time_body_gyroscope_jerk_magnitude_std"                
[56] "frequency_body_accelerometer_std_x"                   
[57] "frequency_body_accelerometer_std_y"                    
[58] "frequency_body_accelerometer_std_z"                   
[59] "frequency_body_accelerometer_jerk_std_x"               
[60] "frequency_body_accelerometer_jerk_std_y"              
[61] "frequency_body_accelerometer_jerk_std_z"               
[62] "frequency_body_gyroscope_std_x"                       
[63] "frequency_body_gyroscope_std_y"                        
[64] "frequency_body_gyroscope_std_z"                       
[65] "frequency_body_accelerometer_magnitude_std"            
[66] "frequency_body_body_accelerometer_jerk_magnitude_std" 
[67] "frequency_body_body_gyroscope_magnitude_std"           
[68] "frequency_body_body_gyroscope_jerk_magnitude_std"


Naturally, those variables with "mean" correspond to the mean estimated from that particular signal, while those with "std" correspond to the standard deviation estimated from that particular signal. Although large in length, the variable names have been expanded to be as descriptive as possible according to the explanation in "features_info.txt" that comes with the original data sets. All the relevant information is included there. However, here I include information from that same file, which has the original variable names (simplified):


>The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

>Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

>Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

>These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.


In general, all variables starting with "t" are now "time", those with "f" are "frequency", "Acc" are "_accelerometer", "Gyro" are "_gyroscope", etc. These new variable names include underscores to improve readability.

## 3. Transformations and Steps

The relevant steps are highlighted  with comments in the "run_analysis.R" script. However, I'll use this section to describe these steps and how I came with "final_dataset" and "grouped_dataset".

First of all, I loaded the "tidyverse" package with ```library(tidyverse)```, since I'll be using functions from dplyr, stringr, etc. Then I set the working directory to my convenience and start loading the relevant data sets. I didn't include a script to download the data: I did it beforehand due to its big size. However, if you wish to include a function to download the file, you can use ```download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" destfile="[insert your destination file here].zip")```, then extract the information from the .zip with some package and then modify the load functions to extract the .txt files.

After that, I loaded the following 8 data sets which are in .txt format: features.txt, activity_labels.txt, X_train.txt, y_train.txt, subject_train.txt, X_test.txt, y_test.txt, subject_test.txt.

First, I substitute the variable names from X_train and X_test with the features file. Then, I ```cbind()``` the X_train and X_test with y_train and y_test, respectively, as well as subject_train and subject_test. As the name indicates, subject_train and subject_test include the 30 subjects that match the train and test data in each observation. On the other hand, y_train and y_test include the 6 activities that match the train and test data in each observation as well. These 6 activities are: 1) "LAYING", 2) "SITTING", 3) "STANDING", 4) "WALKING", 5) "WALKING_DOWNSTAIRS", 6) "WALKING_UPSTAIRS".

### 3.1 First step: "Merges the training and the test sets to create one data set."

After doing all this, I ```rbind()``` the final X_train and X_test data sets, and name the resulting data set: "full_dataset".

### 3.2 Second step: "Extracts only the measurements on the mean and standard deviation for each measurement."

With the use of regular expressions and functions such as ```grep()```, as well as ```select()``` from the dplyr package included in the tidyverse, I extract only those variables related to the mean (mean()) and the standard deviation (std()). I was careful not to select the variables including "meanFreq()" in its name, since it also has "mean" in it, but it is different to the "mean()" variables.

I also removed all those objects and data frames in the environment just in case to free up space.

### 3.3 Third step: "Uses descriptive activity names to name the activities in the data set"

Once again, with "pattern matching and replacement" functions such as ```sub()```, a for loop and ```arrange()``` from dplyr (to sort the data), I substituted "1,2,3,4,5,6" with the corresponding activity names: 1) "LAYING", 2) "SITTING", 3) "STANDING", 4) "WALKING", 5) "WALKING_DOWNSTAIRS", 6) "WALKING_UPSTAIRS".

### 3.4 Fourth step: "Appropriately labels the data set with descriptive variable names."

With the ```sub()``` function, I now improve the readability of the variable names, with the flip side that now they're longer, but much less prone to be confused or misinterpreted by the user of this data set (for example, some users may find it difficult to interpret "Acc" as "Accelerometer" if they don't have the "features.info.txt" file at hand that explains all of this).

With this, we have the first of our two output data sets: **"final_dataset"**: ungrouped, with 10299 observations/rows and 68 variables/columns.

### 3.5 Fifth step: "From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject."

With the use of the ```%>%``` command, ```group_by()```, and ```summarise_all()``` (this last one is similar to summarise() but it is used to include all columns), I create our second output data set: **"grouped_dataset"**, which is then outputted as **"tidy_dataset.txt"** and included in my GitHub repo and my submission on Coursera. This grouped_dataset is similar to the final_dataset, but it is grouped by each one of the 30 subjects and by each one of the 6 activities.

## 4 Conclusion / Discussion

I hope this was a brief and detailed enough document for you to understand the variables, the data, as well as each transformation applied to the original data sets. Some packages were needed to accomplish this task, such as dplyr and stringr from the tidyverse; functions that include regular expressions; and other functions learned during this course. There's always room for improvement and there may be simpler ways to produce the same results outlined in this code book; however, this is a first attempt to manipulate a data set from scratch, as well as a first attempt to point out every step and every transformation applied for readers to reproduce these results if they need to.
