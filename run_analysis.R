# Read data from files
activities = read.table('./activity_labels.txt')
features = read.table('./features.txt')
subjectTraining = read.table('./train/subject_train.txt')
xTraining = read.table('./train/X_train.txt')
yTraining = read.table('./train/y_train.txt')
subjectTesting = read.table('./test/subject_test.txt')
xtesting =read.table('./test/X_test.txt')
ytesting =read.table('./test/y_test.txt')

# column names to data
colnames(activities) <- c("activityId", "activityType")
colnames(subjectTesting) = "subjectId"
colnames(yTraining) = "activityId"
colnames(subjectTraining) = "subjectId"
colnames(ytesting) = "activityId"
colnames(xtesting) = features[,2]
colnames(xTraining) = features[,2]

# 1- Merge the training and the test sets to create one data set

trainingdata <- cbind(subjectTraining,yTraining,xTraining)
testdata <- cbind(subjectTesting,ytesting,xtesting)
activitydata <- rbind(trainingdata,testdata)

# 2- Extract only the measurements on the mean and standard deviation for each measurement. 

activitycol <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])
activitydata <- activitydata[, activitycol]

# 3- Use descriptive activity names to name the activities in the data set

activitydata$activityId <- factor(activitydata$activityId,levels = activities[, 1], labels = activities[, 2])
activitydataCol <- colnames(activitydata)

# 4- Appropriately labels the data set with descriptive variable names

activitydataCol <- gsub("[\\(\\)-]", "", activitydataCol)
activitydataCol <-  gsub("^f", "frequency", activitydataCol)
activitydataCol <-  gsub("-std$","StdDev", activitydataCol)
activitydataCol <-  gsub("^(t)","time", activitydataCol)
activitydataCol <-  gsub("Mag","Magnitude", activitydataCol)
activitydataCol <-  gsub("Freq", "Frequency", activitydataCol)
activitydataCol <-  gsub("-mean","Mean", activitydataCol)
activitydataCol <-  gsub("Gyro", "Gyroscope", activitydataCol)
activitydataCol <-  gsub("BodyBody", "Body", activitydataCol)
activitydataCol <-  gsub("Acc", "Acceleration", activitydataCol)

# New column names to data set
colnames(activitydata)<- activitydataCol

# 5- creates a second, independent tidy data set with the average of each variable for each activity and each subject

activitydatamel <- melt(activitydata, id = c("subjectId", "activityId"))
activitydatamean <- dcast(activitydatamel, subjectId + activityId ~ variable, mean)
write.table(activitydatamean, "tidydata.txt", row.names = FALSE, quote = FALSE)







