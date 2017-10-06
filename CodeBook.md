{\rtf1\ansi\ansicpg1252\cocoartf1504\cocoasubrtf830
{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;\red0\green0\blue0;\red255\green255\blue255;\red38\green38\blue38;
}
{\*\expandedcolortbl;;\csgenericrgb\c0\c0\c0;\csgenericrgb\c100000\c100000\c100000;\cssrgb\c20000\c20000\c20000;
}
\paperw11900\paperh16840\margl1440\margr1440\vieww26860\viewh15260\viewkind0
\pard\tx566\tx1133\tx1700\tx2267\tx2834\tx3401\tx3968\tx4535\tx5102\tx5669\tx6236\tx6803\pardirnatural\partightenfactor0

\f0\fs24 \cf0 ============================================================\

============================================================\
\
\cf2 \cb3 This file contains the description about the activities performed to clean up the data for the \'84\expnd0\expndtw0\kerning0
Getting and Cleaning Data Course Project\'93 and create a tidy dataset.\
\
\'97\'97\'97\'97\'97\'97TO BE COPIED IN THE README file\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\
To perform all the clean up activities and to create a tidy dataset only one script is used!\
This script is called: \'84run_analysis.R\'93 and it contains several sub_scripts each performing a specific step in the clean up operations.\
Each script is described in detail in the file \'84run_analysis.R\'93\
_______________________________________________________\
\
\
============================================================\
\
1. Merges the training and the test sets to create one dataset.\
\
There are 2 sets of data called \'84training\'93 and \'84test\'93.\
\
The data are stored into 3 files for each dataset.\
\
These are the files used to create the tidy dataset:\
\
		1. X_train.txt : training set\
		2. y_train.txt : training labels\
		3. subject_train.txt : Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30\
\
		4. X_test.txt : test set\
		5. y_test.txt : test Labels\
		6. subject_test.txt : Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30\
\
The training dataset has got 7352 observations and 561 variables.\
\
The test dataset has got 2947 observations and 561 variables.\
\
\
Before to start merging the datasets names should assigned to the data contained in the Files \'84X_train.txt\'93 and \'84X_test.txt\'93 because they have got no headers.\
The headers are assigned using the names stored in the file \'84features.txt\'93.\
\
Moreover, the data contained in the Files \'84X_train.txt\'93 and \'84X_test.txt\'93 have two important parts of information missing. One is the ID of the subjects from which the\
data come from and the other is the type of activity the subject was performing when the measurement was taken.\
\
These information are contained in the files:\
\
		- subject_train.txt : this file contains the list of subjects for the training dataset\
		- subject_test.txt : this file contains the list of subjects for the test dataset\
\
and\
\
		- y_train.txt: contains the list of activities performed from the subjects in the file \'84subject_train.txt\'93 that produced the data in \'84X_train.txt\
		- y_test.txt: contains the list of activities performed from the subjects in the file \'84subject_test.txt\'93 that produced the data in \'84X_test.txt\
\
Before to merge the training and the test datasets it is necessary to associate to each of them the IDs of the subjects and the activities they were performing to produce the measurements.\
This is done adding two columns, one called \'84subject\'93 and another called \'84activity\'93, to each dataset.\
\
\
Now, the two datasets are merged through the rows using the function \'84bind_rows\'93.\
\
\
The final merged df has got 10299 obs.(rows) and 563 var. (columns) and it is named \'84X_Data_merged\'93.\
\
==============================================================\
\
\pard\pardeftab720\partightenfactor0
\cf2 2. Extracts only the measurements on the mean and standard deviation for each measurement.\
\
The \'84X_Data_merged\'93 df is subsetted to select only those columns that contains the word \'84mean\'93 or \'84std\'93.\
\
The results are stored in a new df called \'84Data_mean_std\'93.\
\
The new df has got the same number of row (10299) but a smaller amount of columns (68).\
\
NOTE: the measurement relative to -meanFreq- are not imported because this measurement is relative to \'84Weighted average of the frequency components to obtain a mean frequency\'93 and it is not a pure mean value of the measurement.\
\
==============================================================\
\
3. Uses descriptive activity names to name the activities in the dataset\
\
The numbers that are contained in the column \'84activity\'93  refer to a specific activity performed from a subject. They are substituted with more descriptive names taken from the file \'84activity_labels.txt\'93.\
\
The following number - names associations are used:\
\
	- 1 <- \'84walking"\
          - 2 <- "walking_upstairs"\
          - 3 <- "walking_downstairs"\
          - 4 <- "sitting"\
          - 5 <- "standing"\
          - 6 <- "laying"\
\
==============================================================\
\
4. \cf4 Appropriately labels the dataset with descriptive variable names.\
\
The following rules are used to have descriptive varable\'b4names:\
\
	a. All lower case when possible\
	b. All words that made a feature start with a capitol letter (example: tbodyaccmean become tBodyAccMean) this simplify the understanding of all components that made a single feature.\
	c. Descriptive (Diagnosis vs. Dx)\
	d. Not duplicated\
	e. Not have underscores or dots or white spaces\
\
NOTE: the rule a) \'84all lower case when possible\'93 has not been used because in this specific case the rule b) would give the possibility to have more descriptive variable names.\cf2 \
\
The list hereafter contains the new variable names and their meaning.\
\
\
 [1] \'84subject"                 	    		\'84activity"                	 		"tBodyAccMeanX"           \
 [4] "tBodyAccMeanY"            		"tBodyAccMeanZ"          		  "tBodyAccStdX"            \
 [7] "tBodyAccStdY"           	  		  "tBodyAccStdZ"      		  "tGravityAccMeanX"        \
[10] "tGravityAccMeanY"       		  "tGravityAccMeanZ"      		  "tGravityAccStdX"         \
[13] "tGravityAccStdY"          	 	 "tGravityAccStdZ"            		"tBodyAccJerkMeanX"       \
[16] "tBodyAccJerkMeanY"   	 	 "tBodyAccJerkMeanZ"    		 "tBodyAccJerkStdX"        \
[19] "tBodyAccJerkStdY"      	   	"tBodyAccJerkStdZ"         		"tBodyGyroMeanX"          \
[22] "tBodyGyroMeanY"       	   	 "tBodyGyroMeanZ"         		 "tBodyGyroStdX"           \
[25] "tBodyGyroStdY"           	  	  "tBodyGyroStdZ"           		  "tBodyGyroJerkMeanX"      \
[28] "tBodyGyroJerkMeanY" 	  	  "tBodyGyroJerkMeanZ" 		 "tBodyGyroJerkStdX"       \
[31] "tBodyGyroJerkStdY"     	  	 "tBodyGyroJerkStdZ"      		 "tBodyAccMagMean"         \
[34] "tBodyAccMagStd"         	  	 "tGravityAccMagMean"   		 "tGravityAccMagStd"       \
[37] "tBodyAccJerkMagMean"	  	"tBodyAccJerkMagStd"    		"tBodyGyroMagMean"        \
[40] "tBodyGyroMagStd"        	  	"tBodyGyroJerkMagMean" 	"tBodyGyroJerkMagStd"     \
[43] "fBodyAccMeanX"            	 	"fBodyAccMeanY"            		 "fBodyAccMeanZ"           \
[46] "fBodyAccStdX"               		  "fBodyAccStdY"             		 "fBodyAccStdZ"            \
[49] "fBodyAccJerkMeanX"     	 	"fBodyAccJerkMeanY"   		 "fBodyAccJerkMeanZ"       \
[52] "fBodyAccJerkStdX"        	 	 "fBodyAccJerkStdY"      		 "fBodyAccJerkStdZ"        \
[55] "fBodyGyroMeanX"          	 	"fBodyGyroMeanY"       		 "fBodyGyroMeanZ"          \
[58] "fBodyGyroStdX"             	 	 "fBodyGyroStdY"      		"fBodyGyroStdZ"           \
[61] "fBodyAccMagMean"       	  	 "fBodyAccMagStd"  		"fBodyBodyAccJerkMagMean" \
[64] "fBodyBodyAccJerkMagStd"	  	 "fBodyBodyGyroMagMean"  	"fBodyBodyGyroMagStd"     \
[67] "fBodyBodyGyroJerkMagMean" 	"fBodyBodyGyroJerkMagStd"\
\
\
	- subject: the subject ID\
 	- activity: 6 types of activity perfomed from the subject (\'84walking\'93, "walking_upstairs" , "walking_downstairs" , "sitting" ,  "standing" ,  "laying\'93) \
	- t : time domain signal\
	- f : frequency domain signal\
	- Body : measuring the body acceleration signal\
	- Gravity : measuring the gravity acceleration  signal \
	- Acc: signal coming from an accelerometer\
	- Gyro : signal coming from a gyroscope\
	- Jerk : derived in time to obtain Jerk signals\
	- Mag : magnitude calculated using Euclidean norm\
	- Mean : Mean value\
	- Std : Standard Deviation\
	- XYZ : is used to denote 3-axial signals in the X, Y and Z directions\
\
=========================================================================\
\
5. \cf4 From the dataset in step 4, creates a second, independent tidy dataset with the average of each variable for each activity and each subject.\cf2  \
\
The df \'84Data_mean_std\'93 is grouped by subject and by activity, then the average for each column (from 3:68) is computed.\
\
The results are stored in a df named \'84F_Data_mean_std\'93 that has got 30(subjects) x 6(type of activities) = 180 rows (observations) and 68 columns (variables)\
\
==========================================================================\
\pard\tx566\tx1133\tx1700\tx2267\tx2834\tx3401\tx3968\tx4535\tx5102\tx5669\tx6236\tx6803\pardirnatural\partightenfactor0
\cf4 \
}