library(dplyr);

#dataMeanAndSDActivitys are downloaded and unzippped in repository "/dataMeanAndSDActivityscience/03_get_and_clean/p3"

wd<-"~/dataMeanAndSDActivityscience/03_get_and_clean/p3";
setwd(paste(wd, "/UCI HAR dataMeanAndSDActivityset", sep=""));

# 1) Merges the training and the test sets to create one dataMeanAndSDActivity set.
########################################################################

# combine the 3 (X, Y and subject) train and test tables together 
dataMeanAndSDActivityX<-bind_rows(read.table("train/X_train.txt"), read.table("test/X_test.txt"));
dataMeanAndSDActivityY<-bind_rows(read.table("train/y_train.txt"), read.table("test/y_test.txt"));
dataMeanAndSDActivitySubject<-bind_rows(read.table("train/subject_train.txt"), read.table("test/subject_test.txt"));

dataMeanAndSDActivityTest<-bind_cols(dataMeanAndSDActivitySubject, dataMeanAndSDActivityY, dataMeanAndSDActivityX);

# 2) Extracts only the measurements on the mean and standard deviation for each measurement.
########################################################################

#Create labels
dataMeanAndSDActivityFeatures<-read.table("features.txt");
dataMeanAndSDActivityColNames<-c("subjectId", "activityId", as.vector(dataMeanAndSDActivityFeatures$V2));
colnames(dataMeanAndSDActivityTest)<-dataMeanAndSDActivityColNames;

# get the columns with names like "subject", "activity", "*std()" and "*mean()" (remove column names with "meanFreq()")
meanAndSDlist <- grep("(subjectId|activityId|mean\\(\\)|std\\(\\))", dataMeanAndSDActivityColNames);

#apply filter to dataset
dataMeanAndSDActivity<-dataMeanAndSDActivityTest[,meanAndSDlist];

# 3) Uses descriptive activity names to name the activities in the data set.
########################################################################

activityLabels <- read.table("activity_labels.txt", col.names=c("activityId", "activityName"));
dataMeanAndSDActivity<-inner_join(activityLabels,dataMeanAndSDActivity,  by="activityId");

# 4) Appropriately labels the data set with descriptive variable names. 
########################################################################

# activity names for column are very long. Keeping upper cases for clarity.

names(dataMeanAndSDActivity)<-gsub("^t", "time", names(dataMeanAndSDActivity));
names(dataMeanAndSDActivity)<-gsub("^f", "frequency", names(dataMeanAndSDActivity));
names(dataMeanAndSDActivity)<-gsub("Acc", "Accelerometer", names(dataMeanAndSDActivity));
names(dataMeanAndSDActivity)<-gsub("Gyro", "Gyroscope", names(dataMeanAndSDActivity));
names(dataMeanAndSDActivity)<-gsub("Mag", "Magnitude", names(dataMeanAndSDActivity));
names(dataMeanAndSDActivity)<-gsub("bodybody", "Body", names(dataMeanAndSDActivity));
names(dataMeanAndSDActivity)<-gsub("mean", "Mean", names(dataMeanAndSDActivity));
names(dataMeanAndSDActivity)<-gsub("std", "Std", names(dataMeanAndSDActivity));
names(dataMeanAndSDActivity)<-gsub("-", "", names(dataMeanAndSDActivity));
names(dataMeanAndSDActivity)<-gsub("\\(\\)", "", names(dataMeanAndSDActivity));

# 5) From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
########################################################################

dataMeanByActivityAndSubject<-dataMeanAndSDActivity %>% group_by(activityId, activityName, subjectId) %>% summarise_each(funs(mean));

write.table(dataMeanByActivityAndSubject, "data_mean_by_activity_and_subject.txt", row.name=FALSE);