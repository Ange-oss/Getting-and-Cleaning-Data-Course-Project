# Download library
library(dplyr)
 
filename <- "Data base.zip"
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

# Download data base
download.file(fileURL, filename, method="curl")

# Unziping the UCI HAR DATASET folder
if (!file.exists("UCI HAR Dataset")) { 
        unzip(filename) 
}

# read data
data_features <- read.table("UCI HAR Dataset/features.txt", col.names = c("n","function"))
data_activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))
data_subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
data_x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
data_y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "code")
data_subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
data_x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
data_y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "code")

#1.Merge train and test data
test <- cbind(data_subject_test, data_x_test, data_y_test)
train <- cbind(data_subject_train, data_x_train, data_y_train)
full_dataset <- rbind(test, train)

#2.Extracts  the measurements on the mean and standard deviation for each measurement.
Tidy_data <- full_dataset %>% select(subject, code, contains("mean"), contains("std"))

#3.Descriptive activity names to name the activities in the data set.
Tidy_data$code <- activities[Tidy_data$code, 2]

#4.Appropriately labels the data set with descriptive variable names.
names(Tidy_data)[2] = "activity"
names(Tidy_data)<-gsub("Acc", "Accelerometer", names(Tidy_data))
names(Tidy_data)<-gsub("Gyro", "Gyroscope", names(Tidy_data))
names(Tidy_data)<-gsub("Mag", "Magnitude", names(Tidy_data))
names(Tidy_data)<-gsub("^t", "Time", names(Tidy_data))
names(Tidy_data)<-gsub("^f", "Frequency", names(Tidy_data))
names(Tidy_data)<-gsub("-mean()", "Mean", names(Tidy_data), ignore.case = TRUE)
names(Tidy_data)<-gsub("-std()", "Standard_deviation", names(Tidy_data), ignore.case = TRUE)
names(Tidy_data)<-gsub("-freq()", "Frequency", names(Tidy_data), ignore.case = TRUE)
names(Tidy_data)<-gsub("angle", "Angle", names(Tidy_data))
names(Tidy_data)<-gsub("gravity", "Gravity", names(Tidy_data))

#5.Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
Final_data <- Tidy_data %>% group_by(subject, activity) %>% summarise_all(funs(mean))
write.table(Final_data, "Final_Data.txt", row.name=FALSE)


