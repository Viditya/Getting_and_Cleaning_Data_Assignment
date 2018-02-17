#Download and unzip dataset

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

#Downlaod the file
download.file(fileUrl,destfile="Dataset.zip")

# Unzip dataSet to /data directory
unzip(zipfile="Dataset.zip")

# Reading trainings tables

#Training data for x
x_training <- read.table("UCI HAR Dataset/train/X_train.txt")

#Training data for y
y_training <- read.table("UCI HAR Dataset/train/y_train.txt")

#Subject Training data
subject_training <- read.table("UCI HAR Dataset/train/subject_train.txt")

# Reading testing tables

#Test data for x
x_test <- read.table("UCI HAR Dataset/test/X_test.txt")

#Test data for x
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")

#Subject Test data
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")

# Reading feature vector
features <- read.table('UCI HAR Dataset/features.txt')

# Reading activity labels
activityLabels <- read.table('UCI HAR Dataset/activity_labels.txt')

#Assign column names

#Assign column names for Training x
colnames(x_training) <- features[,2] 
#Assign column names for Training y
colnames(y_training) <-"activityId"

#Assign column names for Training Subject
colnames(subject_training) <- "subjectId"

#Assign column names for Test x
colnames(x_test) <- features[,2] 

#Assign column names for Test y
colnames(y_test) <- "activityId"

#Assign column names for Test Subject
colnames(subject_test) <- "subjectId"

#Assign column names for Activity
colnames(activityLabels) <- c('activityId','activityType')

#Merge the datasets for training
mrg_training <- cbind(y_training, subject_training, x_training)

#Merge the datasets for test
mrg_test <- cbind(y_test, subject_test, x_test)

#Bind the data
Binddata <- rbind(mrg_training, mrg_test)

#get the column names from the data
colnamesdata<- colnames(Binddata)

#Get the mean and SD for each measurement
mean_and_sd <- (grepl("activityId" , colnamesdata) | 
                         grepl("subjectId" , colnamesdata) | 
                         grepl("mean.." , colnamesdata) | 
                         grepl("std.." , colnamesdata) 
)

#Subset from BindData
setMeanAndSd <- Binddata[ , mean_and_sd == TRUE]

#Merge the activity labels and meanandsd by activityid
setActivityNames <- merge(setMeanAndSd, activityLabels,
                              by='activityId',
                              all.x=TRUE)

#Create the tidy set with the average of each variable for each activity and each subject
cleandataSet <- aggregate(. ~subjectId + activityId, setActivityNames, mean)
cleandataSet <- cleandataSet[order(cleandataSet$subjectId, cleandataSet$activityId),]

write.table(cleandataSet, "cleandataSet.txt", row.name=FALSE)
