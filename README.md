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

Please see CodeBook.md for further details on the data and the variables in this dataset.

