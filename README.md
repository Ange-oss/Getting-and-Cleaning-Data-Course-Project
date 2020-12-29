# Getting-and-Cleaning-Data-Course-Project
The purpose of this project is collect, work with, and clean a data set of data collected from the accelerometers from the Samsung Galaxy S smartphone, the data was obtained from:  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip, for more information click on: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The file to be tidy is named "Data base.zip", and the folder that contains the initial scrips is de folder named "UCI HAR Dataset".

Initial scripts:  
- 'README.txt' 
- 'features.txt': List of all features.
- 'activity_labels.txt': List of all activities.
- 'train/X_train.txt': Training set, measurements of the features.
- 'train/y_train.txt': Training labels, from 1 to 6 for each measurement.
- 'test/X_test.txt': Test set, measurements of the features.
- 'test/y_test.txt': Test labels,  from 1 to 6 for each measurement.

Analisis of "run_analysis.R" script, the script works by the next steps:

- Download Library ("dplyr")
- Download data base
- Unziping the UCI HAR DATASET folder
- Read data
- 1. Merge train and test data
- 2. Extracts  the measurements on the mean and standard deviation for each measurement.
- 3. Descriptive activity names to name the activities in the data set.
- 4. Appropriately labels the data set with descriptive variable names.
- 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Files in the project:
- README.md
- Final_Data.txt: Contain the final Tidy data set.
- run_analysis.R: Scrip for obtain the tidy data set.
- CodeBook.md: Describe the variables.
