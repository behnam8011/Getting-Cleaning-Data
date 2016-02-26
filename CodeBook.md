Human Activity Tidy Dataset's Codebook
===========

This guide explains the content of the tidy dataset created from running run_analysis.R on the the raw Human Activity Recognition data available [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

## Raw Data

Raw data for this project is collected from 30 volunteers who wore the Samsung Galaxy S II smartphones while performing several activities. Each person has performed the following activities:
1. WALKING
2. WALKING UPSTAIRS
3. WALKING DOWNSTAIRS
4. SITTING
5. STANDING
6. LAYING

The project team have captured 3-axial acceleration and angular velocity information of each person's movement at a constant rate using signal data from the phones' accelerometer and gyroscope. The data has been divided to training and test datasets. For the purpose of this project, we will skip the details of the data collection process. Interested readers can find more details at the UC Irvine's Center for Machine Learning and Intelligent Systems [Website](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#).

The raw data contains the following information:

1. Raw signal data in a directory called "Inertial Signals" for both training and test datasets.
2. Two files containing the 561-feature measurements for both training and test datasets, called "X_train.txt" and "X_train.txt", respectively.
3. Two files containing the subject information for both training and test datasets, called "subject_test.txt" and "subject_train.txt", respectively.
4. Two files containing the activity information for both training and test datasets, called "y_train.txt" and "y_train.txt", respectively. 
5. "feature.txt" that contains the variable names.
6. "features_info.txt" contains details regarding the features and the feature selection process.
7. "activity_labels.txt" contains descriptive names for 6 different activity labels
8. "README.txt" describes the data and the underlying experiments.

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



## Tidy Data

Running the "run_analysis.R" script will compile a tidy dataset that satisfies the following criteria:

1. Each measured variable is in exactly one column in the data set.
2. Each row corresponds to one particular observation, and vice versa.
3. There is just one "class" of measurements, i.e., body movement measurements, and hence, the data is stored in one table.
4. The variable names are self-describing. 

The resulting data set contains the following variables:

 1. **Activity**: Activity label. Levels = WALKING, WALKING UPSTAIRS, WALKING DOWNSTAIRS, SITTING, STANDING, LAYING,
 2. **Subject**: Subject indicator, ranges from 1 through 30.
 3. **Average-Body-Signal-From-Accelerometer-Mean-X-Axis**: Average body acceleration along phone's X-axis, from accelerometer signal
 4. **Average-Body-Signal-From-Accelerometer-Mean-Y-Axis**: Average body acceleration along phone's Y-axis, from accelerometer signal
 5. **Average-Body-Signal-From-Accelerometer-Mean-Z-Axis**: Average body acceleration along phone's Z-axis, from accelerometer signal
 6. **Average-Gravity-Signal-From-Accelerometer-Mean-X-Axis**: Average gravity acceleration along phone's X-axis, from accelerometer signal
 7. **Average-Gravity-Signal-From-Accelerometer-Mean-Y-Axis**: Average gravity acceleration along phone's Y-axis, from accelerometer signal
 8. **Average-Gravity-Signal-From-Accelerometer-Mean-Z-Axis**: Average gravity acceleration along phone's Z-axis, from accelerometer signal
 9. **Average-Body-Signal-From-Accelerometer-Jerk-Mean-X-Axis**: Average Body Jerk along phone's X-axis, from accelerometer
 10. **Average-Body-Signal-From-Accelerometer-Jerk-Mean-Y-Axis**: Average Body Jerk along phone's Y-axis, from accelerometer
 11. **Average-Body-Signal-From-Accelerometer-Jerk-Mean-Z-Axis**: Average Body Jerk along phone's Z-axis, from accelerometer
 12. **Average-Body-Signal-From-Gyroscope-Mean-X-Axis**: Average body acceleration along phone's X-axis, from Gyroscope signal
 13. **Average-Body-Signal-From-Gyroscope-Mean-Y-Axis**: Average body acceleration along phone's Y-axis, from Gyroscope signal
 14. **Average-Body-Signal-From-Gyroscope-Mean-Z-Axis**: Average body acceleration along phone's Z-axis, from Gyroscope signal
 15. **Average-Body-Signal-From-Gyroscope-Jerk-Mean-X-Axis**: Average body Jerk along phone's X-axis, from Gyroscope signal
 16. **Average-Body-Signal-From-Gyroscope-Jerk-Mean-Y-Axis**: Average body Jerk along phone's Y-axis, from Gyroscope signal
 17. **Average-Body-Signal-From-Gyroscope-Jerk-Mean-Z-Axis**: Average body Jerk along phone's Z-axis, from Gyroscope signal
 18. **Average-Body-Signal-From-Accelerometer-Magnitude-Mean**: Average magnitude of the three-dimensional body acceleration signal from accelerometer, calculated using the Euclidean norm 
 19. **Average-Gravity-Signal-From-Accelerometer-Magnitude-Mean**: Average magnitude of the three-dimensional gravity acceleration signal from accelerometer, calculated using the Euclidean norm 
 20. **Average-Body-Signal-From-Accelerometer-Jerk-Magnitude-Mean**: Average magnitude of the three-dimensional body acceleration jerk signal from accelerometer, calculated using the Euclidean norm 
 21. **Average-Body-Signal-From-Gyroscope-Magnitude-Mean**: Average magnitude of the three-dimensional body acceleration signal from Gyroscope, calculated using the Euclidean norm 
 22. **Average-Body-Signal-From-Gyroscope-Jerk-Magnitude-Mean**: Average magnitude of the three-dimensional body acceleration jerk signal from Gyroscope, calculated using the Euclidean norm 
 23. **Average-Transformed-Body-Signal-From-Accelerometer-Mean-X-Axis**: Average body acceleration along phone's X-axis, from accelerometer signal, Fast Fourier Transformed
 24. **Average-Transformed-Body-Signal-From-Accelerometer-Mean-Y-Axis**: Average body acceleration along phone's Y-axis, from accelerometer signal, Fast Fourier Transformed   
 25. **Average-Transformed-Body-Signal-From-Accelerometer-Mean-Z-Axis**: Average body acceleration along phone's Z-axis, from accelerometer signal, Fast Fourier Transformed
 26. **Average-Transformed-Body-Signal-From-Accelerometer-Jerk-Mean-X-Axis**: Average body jerk along phone's X-axis, from accelerometer signal, Fast Fourier Transformed
 27. **Average-Transformed-Body-Signal-From-Accelerometer-Jerk-Mean-Y-Axis**: Average body jerk along phone's Y-axis, from accelerometer signal, Fast Fourier Transformed
 28. **Average-Transformed-Body-Signal-From-Accelerometer-Jerk-Mean-Z-Axis**: Average body jerk along phone's Z-axis, from accelerometer signal, Fast Fourier Transformed
 29. **Average-Transformed-Body-Signal-From-Gyroscope-Mean-X-Axis**: Average body acceleration along phone's X-axis, from Gyroscope signal, Fast Fourier Transformed
 30. **Average-Transformed-Body-Signal-From-Gyroscope-Mean-Y-Axis**: Average body acceleration along phone's Y-axis, from Gyroscope signal, Fast Fourier Transformed 
 31. **Average-Transformed-Body-Signal-From-Gyroscope-Mean-Z-Axis**: Average body acceleration along phone's Z-axis, from Gyroscope signal, Fast Fourier Transformed
 32. **Average-Transformed-Body-Signal-From-Accelerometer-Magnitude-Mean**: Average magnitude of the Fast-Fourier-Transformed three-dimensional body acceleration signal from Accelerometer, calculated using the Euclidean norm 
 33. **Average-Transformed-Body-Signal-From-Accelerometer-Jerk-Magnitude-Mean**: Average magnitude of the Fast-Fourier-Transformed three-dimensional body jerk signal from Accelerometer, calculated using the Euclidean norm  
 34. **Average-Transformed-Body-Signal-From-Gyroscope-Magnitude-Mean**: Average magnitude of the Fast-Fourier-Transformed three-dimensional body acceleration signal from Gyroscope, calculated using the Euclidean norm    
 35. **Average-Transformed-Body-Signal-From-Gyroscope-Jerk-Magnitude-Mean**: Average magnitude of the Fast-Fourier-Transformed three-dimensional body jerk signal from Gyroscope, calculated using the Euclidean norm 
 36. **Average-Body-Signal-From-Accelerometer-Std.Dev.-X-Axis**: Average standard deviation of body acceleration measurements along phone's X-axis, from accelerometer signal
 37. **Average-Body-Signal-From-Accelerometer-Std.Dev.-Y-Axis**: Average standard deviation of body acceleration measurements along phone's Y-axis, from accelerometer signal 
 38. **Average-Body-Signal-From-Accelerometer-Std.Dev.-Z-Axis**: Average standard deviation of body acceleration measurements along phone's Z-axis, from accelerometer signal
 39. **Average-Gravity-Signal-From-Accelerometer-Std.Dev.-X-Axis**: Average standard deviation of Gravity acceleration measurements along phone's X-axis, from accelerometer signal
 40. **Average-Gravity-Signal-From-Accelerometer-Std.Dev.-Y-Axis**: Average standard deviation of Gravity acceleration measurements along phone's Y-axis, from accelerometer signal
 41. **Average-Gravity-Signal-From-Accelerometer-Std.Dev.-Z-Axis**: Average standard deviation of Gravity acceleration measurements along phone's Z-axis, from accelerometer signal
 42. **Average-Body-Signal-From-Accelerometer-Jerk-Std.Dev.-X-Axis**: Average standard deviation of body jerk measurements along phone's X-axis, from accelerometer signal
 43. **Average-Body-Signal-From-Accelerometer-Jerk-Std.Dev.-Y-Axis**: Average standard deviation of body jerk measurements along phone's Y-axis, from accelerometer signal
 44. **Average-Body-Signal-From-Accelerometer-Jerk-Std.Dev.-Z-Axis**: Average standard deviation of body jerk measurements along phone's Z-axis, from accelerometer signal
 45. **Average-Body-Signal-From-Gyroscope-Std.Dev.-X-Axis**: Average standard deviation of body acceleration measurements along phone's X-axis, from Gyroscope signal
 46. **Average-Body-Signal-From-Gyroscope-Std.Dev.-Y-Axis**: Average standard deviation of body acceleration measurements along phone's Y-axis, from Gyroscope signal
 47. **Average-Body-Signal-From-Gyroscope-Std.Dev.-Z-Axis**: Average standard deviation of body acceleration measurements along phone's Z-axis, from Gyroscope signal
 48. **Average-Body-Signal-From-Gyroscope-Jerk-Std.Dev.-X-Axis**: Average standard deviation of body jerk measurements along phone's X-axis, from Gyroscope signal
 49. **Average-Body-Signal-From-Gyroscope-Jerk-Std.Dev.-Y-Axis**: Average standard deviation of body jerk measurements along phone's Y-axis, from Gyroscope signal
 50. **Average-Body-Signal-From-Gyroscope-Jerk-Std.Dev.-Z-Axis**: Average standard deviation of body jerk measurements along phone's Z-axis, from Gyroscope signal
 51. **Average-Body-Signal-From-Accelerometer-Magnitude-Std.Dev.**: Average standard deviation of the Euclidean norm of body acceleration vector, from Accelerometer signal
 52. **Average-Gravity-Signal-From-Accelerometer-Magnitude-Std.Dev.**: Average standard deviation of the Euclidean norm of gravity acceleration vector, from Accelerometer signal   
 53. **Average-Body-Signal-From-Accelerometer-Jerk-Magnitude-Std.Dev.**: Average standard deviation of the Euclidean norm of body jerk vector, from Accelerometer signal
 54. **Average-Body-Signal-From-Gyroscope-Magnitude-Std.Dev.**: Average standard deviation of the Euclidean norm of body acceleration vector, from Gyroscope signal
 55. **Average-Body-Signal-From-Gyroscope-Jerk-Magnitude-Std.Dev.**: Average standard deviation of the Euclidean norm of body jerk vector, from Gyroscope signal
 56. **Average-Transformed-Body-Signal-From-Accelerometer-Std.Dev.-X-Axis**: Average standard deviation of Fast-Fourier-Transformed body acceleration measurements along phone's X-axis, from accelerometer signal
 57. **Average-Transformed-Body-Signal-From-Accelerometer-Std.Dev.-Y-Axis**: Average standard deviation of Fast-Fourier-Transformed body acceleration measurements along phone's Y-axis, from accelerometer signal
 58. **Average-Transformed-Body-Signal-From-Accelerometer-Std.Dev.-Z-Axis**: Average standard deviation of Fast-Fourier-Transformed body acceleration measurements along phone's Z-axis, from accelerometer signal
 59. **Average-Transformed-Body-Signal-From-Accelerometer-Jerk-Std.Dev.-X-Axis**: Average standard deviation of Fast-Fourier-Transformed body jerk measurements along phone's X-axis, from accelerometer signal
 60. **Average-Transformed-Body-Signal-From-Accelerometer-Jerk-Std.Dev.-Y-Axis**: Average standard deviation of Fast-Fourier-Transformed body jerk measurements along phone's Y-axis, from accelerometer signal
 61. **Average-Transformed-Body-Signal-From-Accelerometer-Jerk-Std.Dev.-Z-Axis**: Average standard deviation of Fast-Fourier-Transformed body jerk measurements along phone's Z-axis, from accelerometer signal
 62. **Average-Transformed-Body-Signal-From-Gyroscope-Std.Dev.-X-Axis**: Average standard deviation of Fast-Fourier-Transformed body acceleration measurements along phone's X-axis, from Gyroscope signal
 63. **Average-Transformed-Body-Signal-From-Gyroscope-Std.Dev.-Y-Axis**: Average standard deviation of Fast-Fourier-Transformed body acceleration measurements along phone's Y-axis, from Gyroscope signal 
 64. **Average-Transformed-Body-Signal-From-Gyroscope-Std.Dev.-Z-Axis**: Average standard deviation of Fast-Fourier-Transformed body acceleration measurements along phone's Z-axis, from Gyroscope signal 
 65. **Average-Transformed-Body-Signal-From-Accelerometer-Magnitude-Std.Dev.**: Average standard deviation of the Euclidean norm of the Fast-Fourier-Transformed body acceleration measurements, from Accelerometer signal  
 66. **Average-Transformed-Body-Signal-From-Accelerometer-Jerk-Magnitude-Std.Dev.**: Average standard deviation of the Euclidean norm of the Fast-Fourier-Transformed body jerk measurements, from Accelerometer signal
 67. **Average-Transformed-Body-Signal-From-Gyroscope-Magnitude-Std.Dev.**: Average standard deviation of the Euclidean norm of the Fast-Fourier-Transformed body acceleration measurements, from Gyroscope signal 
 68. **Average-Transformed-Body-Signal-From-Gyroscope-Jerk-Magnitude-Std.Dev.**: Average standard deviation of the Euclidean norm of the Fast-Fourier-Transformed body jerk measurements, from Gyroscope signal 

