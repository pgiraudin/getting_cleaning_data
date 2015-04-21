03 - Getting and Cleaning Data - readme
=====================================

This project repository contains files for the project course "Getting and Cleaning Data".

Project goal
=====================================
The goal of this projet is to create a tidy data set. It must be done with a R script in five steps : 
* Merge the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement. 
* Uses descriptive activity names to name the activities in the data set.
* Appropriately labels the data set with descriptive variable names. 
* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Project data
=====================================
The source file used for this projet can be find [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

Files description
=====================================
This repository contains three files other files :
* [`CodeBook.md`](CodeBook.md) : This file describes all data, varialbes and library used to perform the cleaning and trasnformation of data.
* `run_analysis.R` : This is an R executable programm used to fo the cleaning ans transformation.
* `data_mean_by_activity_and_subject.txt` : this file contains the result data.

How to use
=====================================
You should use the `run_analysis.R` script with datas from the [source file](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) :
* Unzip the datas from the source file into a repository on your computer.
* Open R and set the working directory to the same repository as above.
* Launch the progam `run_analysis.R`. This will create the file "data_mean_by_activity_and_subject.txt" into the repository.
