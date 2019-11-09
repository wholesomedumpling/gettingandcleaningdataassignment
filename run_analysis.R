#this is the script to satisfy the requirements for Week 3 Cleaning & Getting Data assignment


library(plyr)
library(dplyr)
library(data.table)

#set the working directory

## PART 1 ANSWER: Merges the training and the test sets to create one data set.
#read in train and test data
testxdata <- read.table("UCI HAR Dataset/test/X_test.txt", sep=""); trainxdata <- read.table("UCI HAR Dataset/train/X_train.txt", sep="")
subjecttest <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "Subject")
testydata <- read.table("UCI HAR Dataset/test/y_test.txt", sep="", col.names = "ID"); trainydata <- read.table("UCI HAR Dataset/train/y_train.txt", sep="", col.names = "ID")
subjecttrain <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "Subject")

#combine the data by using cbind
testdata <- cbind(testydata, subjecttest, testxdata); traindata <- cbind(trainydata, subjecttrain, trainxdata)

#add in whether it's test or train to maintain segregation
testdata <- mutate(testdata, type = "test"); traindata <- mutate(traindata, type = "train")

## PART 4 ANSWER: #Appropriately labels the data set with descriptive variable names.
#reads in name files
namedata <- read.table("UCI HAR Dataset/features.txt", sep="")
names <- as.character(namedata$V2)
names <- c("ID", "Subject", names, "DataType")

#combine all data into one table
mydata <- rbind(testdata, traindata)
names(mydata) <- names

## PART 2 ANSWER: Extracts only the measurements on the mean and standard deviation for each measurement.
#pick up column references of mean and std
count1 <- grep("mean", names)
count2 <- grep("std", names)

#combine into one vector
count <- sort(c(1, 2, 564, count1, count2))

#set mydata to only include STD and MEAN
mydata <- mydata[,count]

## PART 3 ANSWER: #Uses descriptive activity names to name the activities in the data set
#bring in descriptive activity names
descriptiveactivity <- read.table("UCI HAR Dataset/activity_labels.txt", header = FALSE,sep = "", col.names = c("ID", "Activity"))

#bring in functional activity names
mydata <- left_join(mydata, descriptiveactivity, by = "ID")

#reorder the columns and remove ID
mydata <- mydata[,c(83, 2:82)]

#tidydata <- 


