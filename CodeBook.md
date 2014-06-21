# CodeBook

## The Dataset
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

## Summarized Description about functions used to get tidy data
1.	Merges the training and the test sets to create one data set. 
    Here, it is important to name our variables. the file "features" is used to fulfil this step. On the other hand, cbind function is necessary to get all the variables both for train and test dataset. Finally, rbind function is essential to join both datasets.
2.	Extracts only the measurements on the mean and standard deviation for each measurement. 
    The grep function was used to fulfil with this step.
3.	Uses descriptive activity names to name the activities in the data set. 
    The file "activity labels" shows the six activities performed by each person and it is used to merge with our data which has train and test together.
4.	Appropriately labels the data set with descriptive variable names. 
    For loops will help us to clean up the variable names from step 2.
5.	Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
    The function aggregate is ideal to obtain this outcome. Then, write function is used to save our data as "txt" file.

## Variables from tidy data
Subject: Participant Id
PerformedActivity: Activity name performed by participants (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
tBodyAccMeanX
tBodyAccMeanY
tBodyAccMeanZ
tGravityAccMeanX
tGravityAccMeanY
tGravityAccMeanZ
tBodyAccJerkMeanX
tBodyAccJerkMeanY
tBodyAccJerkMeanZ
tBodyGyroMeanX
tBodyGyroMeanY
tBodyGyroMeanZ
tBodyGyroJerkMeanX
tBodyGyroJerkMeanY
tBodyGyroJerkMeanZ
tBodyAccMagMean
tGravityAccMagMean
tBodyAccJerkMagMean
tBodyGyroMagMean
tBodyGyroJerkMagMean
fBodyAccMeanX
fBodyAccMeanY
fBodyAccMeanZ
fBodyAccMeanFreqX
fBodyAccMeanFreqY
fBodyAccMeanFreqZ
fBodyAccJerkMeanX
fBodyAccJerkMeanY
fBodyAccJerkMeanZ
fBodyAccJerkMeanFreqX
fBodyAccJerkMeanFreqY
fBodyAccJerkMeanFreqZ
fBodyGyroMeanX
fBodyGyroMeanY
fBodyGyroMeanZ
fBodyGyroMeanFreqX
fBodyGyroMeanFreqY
fBodyGyroMeanFreqZ
fBodyAccMagMean
fBodyAccMagMeanFreq
fBodyBodyAccJerkMagMean
fBodyBodyAccJerkMagMeanFreq
fBodyBodyGyroMagMean
fBodyBodyGyroMagMeanFreq
fBodyBodyGyroJerkMagMean
fBodyBodyGyroJerkMagMeanFreq
tBodyAccStdDevX
tBodyAccStdDevY
tBodyAccStdDevZ
tGravityAccStdDevX
tGravityAccStdDevY
tGravityAccStdDevZ
tBodyAccJerkStdDevX
tBodyAccJerkStdDevY
tBodyAccJerkStdDevZ
tBodyGyroStdDevX
tBodyGyroStdDevY
tBodyGyroStdDevZ
tBodyGyroJerkStdDevX
tBodyGyroJerkStdDevY
tBodyGyroJerkStdDevZ
tBodyAccMagStdDev
tGravityAccMagStdDev
tBodyAccJerkMagStdDev
tBodyGyroMagStdDev
tBodyGyroJerkMagStdDev
fBodyAccStdDevX
fBodyAccStdDevY
fBodyAccStdDevZ
fBodyAccJerkStdDevX
fBodyAccJerkStdDevY
fBodyAccJerkStdDevZ
fBodyGyroStdDevX
fBodyGyroStdDevY
fBodyGyroStdDevZ
fBodyAccMagStdDev
fBodyBodyAccJerkMagStdDev
fBodyBodyGyroMagStdDev
fBodyBodyGyroJerkMagStdDev
