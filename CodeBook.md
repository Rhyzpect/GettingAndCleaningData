## Human Activity Recognition Using Smartphones Dataset
## Version 1.0
###Acknowledgement to the following:
###Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
###Smartlab - Non Linear Complex Systems Laboratory

The dataset used in this project is from [UCI website](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). Information about how the data is obtained is also found in the site.  It is stated in the website that the experiments have been conducted with a group of 30 participants/subjects within an age bracket of 19-48 years. Each subject performed six activities: **WALKING**, **WALKING_UPSTAIRS**,**WALKING_DOWNSTAIRS**, **SITTING**, **STANDING**, **LAYING**, while wearing a smartphone on the waist. The smartphone used is a Samsung Galaxy SII that captures axial linear acceleration and axial angular velocity using its accelerometer and gyroscope. The obtained dataset is partitioned randomly into two sets: 70% training data and 30% test data.  It is then run with `run_analysis` script. The resulting dataset after the script is run is a tidy data that was binded from these two sets.   

### Features Selection

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

There are other set of variables that were used to estimate these signals but the variables considered here are only the mean and the standard deviation. 


### Note by the Authors

* Features are normalized and bounded within [-1,1].
* Each feature vector is a row on the text file.

