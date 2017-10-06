
This file contains the description about the activities performed to clean up the data for the „Getting and Cleaning Data Course Project“ and create a tidy dataset.


============================================================

1. Merges the training and the test sets to create one dataset.

There are 2 sets of data called „training“ and „test“.

The data are stored into 3 files for each dataset.

These are the files used to create the tidy dataset:

		1. X_train.txt : training set
		2. y_train.txt : training labels
		3. subject_train.txt : Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30

		4. X_test.txt : test set
		5. y_test.txt : test Labels
		6. subject_test.txt : Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30

The training dataset has got 7352 observations and 561 variables.

The test dataset has got 2947 observations and 561 variables.


Before to start merging the datasets names should assigned to the data contained in the Files „X_train.txt“ and „X_test.txt“ because they have got no headers.
The headers are assigned using the names stored in the file „features.txt“.

Moreover, the data contained in the Files „X_train.txt“ and „X_test.txt“ have two important parts of information missing. One is the ID of the subjects from which the
data come from and the other is the type of activity the subject was performing when the measurement was taken.

These information are contained in the files:

		- subject_train.txt : this file contains the list of subjects for the training dataset
		- subject_test.txt : this file contains the list of subjects for the test dataset

and

		- y_train.txt: contains the list of activities performed from the subjects in the file „subject_train.txt“ that produced the data in „X_train.txt
		- y_test.txt: contains the list of activities performed from the subjects in the file „subject_test.txt“ that produced the data in „X_test.txt

Before to merge the training and the test datasets it is necessary to associate to each of them the IDs of the subjects and the activities they were performing to produce the measurements.
This is done adding two columns, one called „subject“ and another called „activity“, to each dataset.


Now, the two datasets are merged through the rows using the function „bind_rows“.


The final merged df has got 10299 obs.(rows) and 563 var. (columns) and it is named „X_Data_merged“.

==============================================================

2. Extracts only the measurements on the mean and standard deviation for each measurement.

The „X_Data_merged“ df is subsetted to select only those columns that contains the word „mean“ or „std“.

The results are stored in a new df called „Data_mean_std“.

The new df has got the same number of row (10299) but a smaller amount of columns (68).

NOTE: the measurement relative to -meanFreq- are not imported because this measurement is relative to „Weighted average of the frequency components to obtain a mean frequency“ and it is not a pure mean value of the measurement.

==============================================================

3. Uses descriptive activity names to name the activities in the dataset

The numbers that are contained in the column „activity“  refer to a specific activity performed from a subject. They are substituted with more descriptive names taken from the file „activity_labels.txt“.

The following number - names associations are used:

	- 1 <- „walking"
          - 2 <- "walking_upstairs"
          - 3 <- "walking_downstairs"
          - 4 <- "sitting"
          - 5 <- "standing"
          - 6 <- "laying"

==============================================================

4. Appropriately labels the dataset with descriptive variable names.

The following rules are used to have descriptive varable´names:

	a. All lower case when possible
	b. All words that made a feature start with a capitol letter (example: tbodyaccmean become tBodyAccMean) this simplify the understanding of all components that made a single feature.
	c. Descriptive (Diagnosis vs. Dx)
	d. Not duplicated
	e. Not have underscores or dots or white spaces

NOTE: the rule a) „all lower case when possible“ has not been used because in this specific case the rule b) would give the possibility to have more descriptive variable names.

The list hereafter contains the new variable names and their meaning.


 [1] „subject"                 	    		„activity"                	 		"tBodyAccMeanX"           
 [4] "tBodyAccMeanY"            		"tBodyAccMeanZ"          		  "tBodyAccStdX"            
 [7] "tBodyAccStdY"           	  		  "tBodyAccStdZ"      		  "tGravityAccMeanX"        
[10] "tGravityAccMeanY"       		  "tGravityAccMeanZ"      		  "tGravityAccStdX"         
[13] "tGravityAccStdY"          	 	 "tGravityAccStdZ"            		"tBodyAccJerkMeanX"       
[16] "tBodyAccJerkMeanY"   	 	 "tBodyAccJerkMeanZ"    		 "tBodyAccJerkStdX"        
[19] "tBodyAccJerkStdY"      	   	"tBodyAccJerkStdZ"         		"tBodyGyroMeanX"          
[22] "tBodyGyroMeanY"       	   	 "tBodyGyroMeanZ"         		 "tBodyGyroStdX"           
[25] "tBodyGyroStdY"           	  	  "tBodyGyroStdZ"           		  "tBodyGyroJerkMeanX"      
[28] "tBodyGyroJerkMeanY" 	  	  "tBodyGyroJerkMeanZ" 		 "tBodyGyroJerkStdX"       
[31] "tBodyGyroJerkStdY"     	  	 "tBodyGyroJerkStdZ"      		 "tBodyAccMagMean"         
[34] "tBodyAccMagStd"         	  	 "tGravityAccMagMean"   		 "tGravityAccMagStd"       
[37] "tBodyAccJerkMagMean"	  	"tBodyAccJerkMagStd"    		"tBodyGyroMagMean"        
[40] "tBodyGyroMagStd"        	  	"tBodyGyroJerkMagMean" 	"tBodyGyroJerkMagStd"     
[43] "fBodyAccMeanX"            	 	"fBodyAccMeanY"            		 "fBodyAccMeanZ"           
[46] "fBodyAccStdX"               		  "fBodyAccStdY"             		 "fBodyAccStdZ"            
[49] "fBodyAccJerkMeanX"     	 	"fBodyAccJerkMeanY"   		 "fBodyAccJerkMeanZ"       
[52] "fBodyAccJerkStdX"        	 	 "fBodyAccJerkStdY"      		 "fBodyAccJerkStdZ"        
[55] "fBodyGyroMeanX"          	 	"fBodyGyroMeanY"       		 "fBodyGyroMeanZ"          
[58] "fBodyGyroStdX"             	 	 "fBodyGyroStdY"      		"fBodyGyroStdZ"           
[61] "fBodyAccMagMean"       	  	 "fBodyAccMagStd"  		"fBodyBodyAccJerkMagMean" 
[64] "fBodyBodyAccJerkMagStd"	  	 "fBodyBodyGyroMagMean"  	"fBodyBodyGyroMagStd"     
[67] "fBodyBodyGyroJerkMagMean" 	"fBodyBodyGyroJerkMagStd"


	- subject: the subject ID
 	- activity: 6 types of activity perfomed from the subject („walking“, "walking_upstairs" , "walking_downstairs" , "sitting" ,  "standing" ,  "laying“) 
	- t : time domain signal
	- f : frequency domain signal
	- Body : measuring the body acceleration signal
	- Gravity : measuring the gravity acceleration  signal 
	- Acc: signal coming from an accelerometer
	- Gyro : signal coming from a gyroscope
	- Jerk : derived in time to obtain Jerk signals
	- Mag : magnitude calculated using Euclidean norm
	- Mean : Mean value
	- Std : Standard Deviation
	- XYZ : is used to denote 3-axial signals in the X, Y and Z directions

=========================================================================

5. From the dataset in step 4, creates a second, independent tidy dataset with the average of each variable for each activity and each subject. 

The df „Data_mean_std“ is grouped by subject and by activity, then the average for each column (from 3:68) is computed.

The results are stored in a df named „F_Data_mean_std“ that has got 30(subjects) x 6(type of activities) = 180 rows (observations) and 68 columns (variables)

==========================================================================

