Getting and Cleaning Data Project
===========================

The aim of this project is to demonstrate our ability to collect, work with, and clean a data set [1]. The goal is to prepare tidy data that can be used for future analysis

## The Dataset
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

## The Script
The script works to obtain a tidy data. This script is a combination of distinct functions which were learnt during the course such as editing text variables, regular expressions, summarizing and the like. In order to get our tidy data is important to know that your file which was download must be saved in your default working directory (When you type getwd).

## Summarized project steps
1.	Merges the training and the test sets to create one data set
    Here, it is important to name our variables. the file "features" is used to fulfil this step. On the other hand, cbind function is necessary to get all the variables
2.	Extracts only the measurements on the mean and standard deviation for each measurement. 
3.	Uses descriptive activity names to name the activities in the data set
4.	Appropriately labels the data set with descriptive variable names. 
5.	Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

## Reference
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
