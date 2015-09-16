# The packages that will used to tidy the data from the Human Activity 
# Recognition using Smartphones Dataset are dplyr and reshape2 packages.  
# Load first the packages using the library() function.

library(dplyr)
library(reshape2)
directory <- getwd()

# Create a directory for UCI HAR dataset.  You don't need to rename the data
# inside the folder.

# First, the test data should be organized and tidied.  Before that, load the
# following data into R: subject_test.txt, y_test.txt, x_test.txt,features.txt,
# activity_labels.txt. The read.table() function should be used for reading 
# text files. 

activity_labels <- read.table(paste(directory,"/UCI HAR Dataset/activity_labels.txt",sep=""))

y_test <- read.table(paste(directory,"/UCI HAR Dataset/test/y_test.txt",sep=""))

subject_test <- read.table(paste(directory,"/UCI HAR Dataset/test/subject_test.txt",sep=""))

x_test <- read.table(paste(directory,"/UCI HAR Dataset/test/X_test.txt",sep=""))

features <- read.table(paste(directory,"/UCI HAR Dataset/features.txt",sep=""))

# Once the data are loaded in the R environment, check the data for NA's,
# variable types, and its structure.  Use str(), summary() function.
# Notice that y_test data are not in character string and it is hard
# to analyze.  However, the activity_labels data gives the guide for each number
# represents. To replace each number with its corresponding activity label, 
# use the factor() function. Note that label should be a character string. 

label <- activity_labels$V2

label <- as.character(label)

level <- activity_labels$V1

y_test$V1 <- factor(y_test$V1,levels=level,labels=label)

# y_test data now has the information that we need. However, the column name 
# should be fixed first. Use rename() function. Same with the subject_test data. 

y_test <- rename(y_test,activity = V1)


subject_test <- rename(subject_test,subject = V1)

# Now there is a need to improve the variable name of x_test data. Since the
# variable name of the data is stored in the features data at column 2, use
# following code

names(x_test) <- features$V2

# Once everything is set. With each data being tidied and trimmed. Time to 
# merge all the information into one dataset using cbind() function.

testdata <- cbind(subject_test,y_test,x_test)


## TRAIN.  For the train data, do the same steps above. However, there is no
# need to read again the features.txt and activity_labels.txt since it is
# already in the environment.

subject_train <- read.table(paste(directory,"/UCI HAR Dataset/train/subject_train.txt",sep=""))

x_train <- read.table(paste(directory,"/UCI HAR Dataset/train/X_train.txt",sep=""))

y_train <- read.table(paste(directory,"/UCI HAR Dataset/train/y_train.txt",sep=""))

y_train$V1 <- factor(y_train$V1,levels=level,labels=label)

y_train <- rename(y_train,activity = V1)

subject_train <- rename(subject_train,subject = V1)

names(x_train) <- features$V2

traindata <- cbind(subject_train,y_train,x_train)


## After the train data is set, time to bind the training and test data. Use
# rbind() function.

testAndTrainData <- rbind(traindata,testdata)


## Once our tidy data is ready, time to trim it further.  Get only the mean
## and the std column in the testAndTrainData.  To do that, search first the
## column names with mean and std using grep() function. 

meanvar <- grep("mean",names(testAndTrainData))

stdvar <- grep("std",names(testAndTrainData))

# Then take only the columns 1,2 and those with mean and std in the column name
# of testAndTrainData.

trimdata <- testAndTrainData[,c(1,2,meanvar,stdvar)]


## Seems everything is ok. Now to find the average of each column for each
## subject and each activity, get all the varname of the trimdata except for
## "subject" and "activity" variables.

varname <- names(trimdata)

varname <- varname[-(1:2)]

## Use the melt() function to organize the data according to subject and
## activity.  The result is a thin, long dataset.

melteddata <- melt(trimdata,id=c("subject","activity"),measure.vars=varname)

## After this, use dcast() function to find the mean of each variable according
## to subject and activity.

result <- dcast(melteddata,subject+activity~variable,mean)

## And it is done. To save, use the write.table() function.

write.table(result,file=paste(directory,"/result.txt",sep=""),row.names = FALSE)
