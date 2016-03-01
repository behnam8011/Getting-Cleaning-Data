Summarizing the Human Activity Recognition Raw Data
===========

This guide explains how run_analysis.R script creates a tidy dataset based on raw Human Activity Recognition data. The raw dataset contains accelerometers data collected from the Samsung Galaxy S smartphone. A full description is available [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). For the purpose of this project, raw data is provided by the "Getting and Cleaning Data" course team and can be downloaded from this [link](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

### How to Run the Script?

You can follow these steps to generate a tidy dataset from the raw data.

1. Download the raw dataset from this [link](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).
2. Unzip the file into a directory called "UCI HAR Dataset". 
3. Set R working directory to the newly created folder "UCI HAR Dataset" (using setwd()). 
4. Run the "run_analysis.R" script.
5. The tidy dataset will be saved in a text file called "table.txt" within the "UCI HAR Dataset" folder.

## The Prcess

The "run_analysis.R" script contains the following general steps that transform the raw data into a tidy data set:

1. Read in the training data from "X_train.txt", substitute all double spaces with a single space character, and use read.table with sep = " " to create a training dataframe. 
2. Do step 1 on "X_test.txt" to create a test dataframe.
3. Read in "activity_labels.txt" and "y_train.txt" files and merge the resulting dataframes to create a column of descriptive activity names for the training set. Add this column to the training dataframe and name it "Activity".
4. Read in subject (person) information for the training set from "subject_train.txt" and add it to the training data set as a new column called "Subject"
5. Do steps 3 and 4 for the test data set (using "y_test.txt" and "subject_test.txt").
6. Use rbind function to combine training and test data sets into a dataframe called "all".
7. Name columns in dataframe "all" by reading in "features.txt".
8. Use grep function to keep only columns associated with mean and standard deviation of measurements. 
9. Use gsub function to convert column/feature names in "all" to more descriptive names.
10. Use aggregate function to calculate averages of all measurements/columns for every Subject-Activity pair in the "all" dataframe. Name the resulting dataframe "final".
11. Use write.table function to write the contents of the "final" dataframe into a flat file called "table.txt".

Please see CodeBook.md for further details on the data and the variables in this dataset.

