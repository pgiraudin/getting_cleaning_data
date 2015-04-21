03 - Getting and Cleaning Data - codebook
=====================================

This file describes the variables, the data, and transformations applied with to the source data into the script `run_analysis.R`.

This script use the `dplyr` [package](http://cran.r-project.org/web/packages/dplyr/index.html) 

The scipt file `run_analysis.R` apply the five steps described into the course projet. The script is commented for each step.

* Merge the training and the test sets to create one dataMeanAndSDActivity set. This is done with the `bind_rows` and `bind_cols` functions from `dyplr`.
* Extracts only the measurements on the mean and standard deviation for each measurement. This step is done with the "features.txt" file that contains columns names to keep only columns with "std" or "mean" names.
* Uses descriptive activity names to name the activities in the data set. This step was done with the `inner_join` function from `dyplr`.
* Appropriately labels the data set with descriptive variable names. This step was done with the `gsub` function.
* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject. This step was done with the `group_by` and `summarise_each` functions from `dyplr`.

# sources files 
* "train/X_train.txt", "train/y_train.txt" and "train/subject_train.txt" are sources files that contains the train data.
* "test/X_test.txt", "test/y_test.txt" and "test/subject_test.txt" are sources files that contains the test datas.
* "features.txt" and "activity_labels.txt" are sources files that contains label datas.


# Variables description and transformations

* `dataMeanAndSDActivityX`, `dataMeanAndSDActivityY` and `dataMeanAndSDActivitySubject` datasets contains the test and train merged datas from the files.
* `dataMeanAndSDActivityTest` contains one dataset with all data above (merged).
* `dataMeanAndSDActivityFeatures` and `activityLabels` contains labels from the downloaded files.
* `meanAndSDlist` contains a subset of columns names with only `std`, `mean`, `subject` or `activity` columns (from dataset above).
* `dataMeanAndSDActivity` contains data from `dataMeanAndSDActivityTest` filtered with columns from `meanAndSDlist` subset, and enriched with activity labels (from `activityLabels`).
* `dataMeanByActivityAndSubject` Contains data group by activity and subjet. This datasset is the one saved in the file "data_mean_by_activity_and_subject.txt".
