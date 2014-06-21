# Our data must be stored in the default working directory in order to create our tidy data
getwd()

# Reading data from train folder
xtrain <- read.table("C:/Users/Sistema/Documents/UCI HAR Dataset/train/X_train.txt")
ytrain <- read.table("C:/Users/Sistema/Documents/UCI HAR Dataset/train/y_train.txt")
subjecttrain <- read.table("C:/Users/Sistema/Documents/UCI HAR Dataset/train/subject_train.txt")

# Reading data from test folder
xtest <- read.table("C:/Users/Sistema/Documents/UCI HAR Dataset/test/X_test.txt")
ytest <- read.table("C:/Users/Sistema/Documents/UCI HAR Dataset/test/y_test.txt")
subjecttest <- read.table("C:/Users/Sistema/Documents/UCI HAR Dataset/test/subject_test.txt")

# Reading data from UCI HAR Dataset folder
activitylabel <- read.table("C:/Users/Sistema/Documents/UCI HAR Dataset/activity_labels.txt")
features <- read.table("C:/Users/Sistema/Documents/UCI HAR Dataset/features.txt")

# Identifying dimensions of datasets from train folder and exploring records
dim(xtrain); head(xtrain)
dim(ytrain); head(ytrain)
dim(subjecttrain); head(subjecttrain)

# Identifying dimensions of datasets from test folder and exploring records
dim(xtest); head(xtest)
dim(ytest); head(ytest)
dim(subjecttest); head(subjecttest)

# Identifying dimensions of activitylabel and features datasets
dim(activitylabel); head(activitylabel) # These are performed six activities by each person
dim(features); head(features) # these are variables of xtrain and xtest

# Assigning variables names to xtrain and xtest
colnames(xtrain) <- features$V2
colnames(xtest) <- features$V2

# Creating an aditional variable on xtrain and xtest in order to identify the origin of the data
xtrain$sourcedata <- "train"
xtest$sourcedata <- "test"

# Rename variables from subject train and test dataset. Then, add them with cbind function to their respective dataset
# You should install reshape package and load it
library(reshape)
subjecttrain <- rename(subjecttrain, c(V1="Subject"))
subjecttest <- rename(subjecttest, c(V1="Subject"))
xtrain <- cbind(subjecttrain, xtrain)
xtest <- cbind(subjecttest, xtest)

# Rename variables from ytrain and ytest. Then, add them with cbind function to their respective dataset
# You will be creating two new and complete datasets for train and test: "datatrain" and "datatest"
# Both datatrain and datatest will have 564 variables
ytrain <- rename(ytrain, c(V1="Activity"))
ytest <- rename(ytest, c(V1="Activity"))
datatrain <- cbind(ytrain, xtrain)
datatest <- cbind(ytest, xtest)
dim(datatrain); head(datatrain)
dim(datatest); head(datatest)

# In the end, you have to join both train and test data by means of rbind function
datafinal1 <- rbind(datatrain, datatest)
dim(datafinal1); head(datafinal1); tail(datafinal1)

# Now, we have to extract only the measurements on the mean and standard deviation for each measurement
meanvar <- grep("mean", names(datafinal1)) # 46 variables
stdvar <- grep("std", names(datafinal1)) # 33 variables
datafinal2 <- datafinal1[,c(1,2,meanvar,stdvar,564)]
dim(datafinal2); str(datafinal2); head(datafinal2); tail(datafinal2)

# Then, you must use descriptive activity names to name the activities in the data set
# So, you have to merge datafinal2 and activitylabel
# First, rename variables on activitylabel
# Second, merge both datasets by the key variable, in this case it would be "Activity" and create a third data
activitylabel <- rename(activitylabel, c(V1="Activity", V2="PerformedActivity"))
dim(activitylabel); head(activitylabel)
datafinal3 = merge(datafinal2, activitylabel, by="Activity", all.x=TRUE)
dim(datafinal3); str(datafinal3); head(datafinal3); tail(datafinal3); summary(datafinal3)

# It is always recommendable cleaning up our variables in order to have descriptive variables names
# First, identify those variables names which have signs such as "()", "-" and replace them with an appropiate name by means of gsub function
namesdatafinal3 <- colnames(datafinal3)
namesdatafinal3
for (i in 1:length(namesdatafinal3)) 
{
  namesdatafinal3[i] = gsub("-mean","Mean",namesdatafinal3[i])
  namesdatafinal3[i] = gsub("-std","StdDev",namesdatafinal3[i])
  namesdatafinal3[i] = gsub("[()-]","",namesdatafinal3[i])
}

# Update variable names
colnames(datafinal3) <- namesdatafinal3
str(datafinal3) # These are our modified variable names

# Finally, create an independent tidy data set with the average of each variable for each activity and each subject
datafinaltidy = aggregate(datafinal3[,3:81], by=list(datafinal3$Subject,datafinal3$PerformedActivity),mean)
str(datafinaltidy)
datafinaltidy <- rename(datafinaltidy, c(Group.1="Subject"))
datafinaltidy <- rename(datafinaltidy, c(Group.2="PerformedActivity"))
str(datafinaltidy)
write.table(datafinaltidy, "tidydata.txt", row.names=FALSE, sep="\t")
# This file "tidydata.txt" can be seen in a excel file in order to see the data better

