#Codebook

This codebook describes the variables, the data, and transformations performed to clean up the data for the Getting and Cleaning Data project.

The description of the data collection is provided below as contained in the original data set.

The variables used in the tidyData set are:
* Subject - identifier for each of the group of 30 volunteers who were used to carry out the experiment. Its range is from 1 to 30. 
* Activity - the name of each of the 6 activities the subjects performed (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing the smartphone.

*Variables all of which are the average of the underlying measurement described in the original test set appended below:

* timeBodyAccelerometer- mean()-X
* timeBodyAccelerometer- mean()-Y
* timeBodyAccelerometer- mean()-Z
* timeBodyAccelerometer- std()-X
* timeBodyAccelerometer- std()-Y
* timeBodyAccelerometer- std()-Z
* timeGravityAccelerometer- mean()-X
* timeGravityAccelerometer- mean()-Y
* timeGravityAccelerometer- mean()-Z
* timeGravityAccelerometer- std()-X
* timeGravityAccelerometer- std()-Y
* timeGravityAccelerometer- std()-Z
* timeBodyAccelerometerJerk- mean()-X
* timeBodyAccelerometerJerk- mean()-Y
* timeBodyAccelerometerJerk- mean()-Z
* timeBodyAccelerometerJerk- std()-X
* timeBodyAccelerometerJerk- std()-Y
* timeBodyAccelerometerJerk- std()-Z
* timeBodyGyroscope- mean()-X
* timeBodyGyroscope- mean()-Y
* timeBodyGyroscope- mean()-Z
* timeBodyGyroscope- std()-X
* timeBodyGyroscope- std()-Y
* timeBodyGyroscope- std()-Z
* timeBodyGyroscopeJerk- mean()-X
* timeBodyGyroscopeJerk- mean()-Y
* timeBodyGyroscopeJerk- mean()-Z
* timeBodyGyroscopeJerk- std()-X
* timeBodyGyroscopeJerk- std()-Y
* timeBodyGyroscopeJerk- std()-Z
* timeBodyAccelerometerMagnitude-mean()
* timeBodyAccelerometerMagnitude-std()
* timeGravityAccelerometerMagnitude-mean()
* timeGravityAccelerometerMagnitude-std()
* timeBodyAccelerometerMagnitudeJerk-mean()
* timeBodyAccelerometerMagnitudeJerk-std()
* timeBodyGyroscopeMagnitude-mean()
* timeBodyGyroscopeMagnitude-std()
* timeBodyGyroscopeJerkMagnitude-mean()
* timeBodyGyroscopeJerkMagnitude-std()
* frequencyBodyAccelerometer- mean()-X
* frequencyBodyAccelerometer- mean()-Y
* frequencyBodyAccelerometer- mean()-Z
* frequencyBodyAccelerometer- std()-X
* frequencyBodyAccelerometer- std()-Y
* frequencyBodyAccelerometer- std()-Z
* frequencyBodyAccelerometerJerk- mean()-X
* frequencyBodyAccelerometerJerk- mean()-Y
* frequencyBodyAccelerometerJerk- mean()-Z
* frequencyBodyAccelerometerJerk- std()-X
* frequencyBodyAccelerometerJerk- std()-Y
* frequencyBodyAccelerometerJerk- std()-Z
* frequencyBodyGyroscope- mean()-X
* frequencyBodyGyroscope- mean()-Y
* frequencyBodyGyroscope- mean()-Z
* frequencyBodyGyroscope- std()-X
* frequencyBodyGyroscope- std()-Y
* frequencyBodyGyroscope- std()-Z
* frequencyBodyAccelerometerMagnitude-mean()
* frequencyBodyAccelerometerMagnitude-std()
* frequencyBodyAccelerometerJerkMagnitude-mean()
* frequencyBodyAccelerometerJerkMagnitude-std()
* frequencyBodyGyroscopeMagnitude-mean()
* frequencyBodyGyroscopeMagnitude-std()
* frequencyBodyGyroscopeJerkMagnitude-mean()
* frequencyBodyGyroscopeJerkMagnitude-std()

The initial data had to be merged to form a single set by binding rows for each of the subject, activity and features test and train data sets as the data had been split to two groups test containing 30% of the results and train containing 70% of the results


To provide understandability of the data set names to variables, creating new variable names for subject & activity and using the features.txt file to assign provided 
data features names.

Merge columns to get a single data frame of all data from which a subset of the men and standard deviation results was then selected.

Apply the descriptive names from the file provided "activity_labels.txt" to the dataset and factorise.

To improve understandability and provide a tidy data set used gsub to substitute abbreviations in features names with more meaningful descriptors.





==================================================================
Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Universit? degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The dataset includes the following files:
=========================================

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

Notes: 
======
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

For more information about this dataset contact: activityrecognition@smartlab.ws

License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
