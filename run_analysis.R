#=================================================================================
# 1. Merges the training and the test sets to create one data set.

# IMPORTANT: to use the function bind_cols and bind_rows hereafter the package "dplyr"
#  and "tidyr" shall be installed!

install.packages("dplyr")
install.packages("tidyr")
library(dplyr)
library(tidyr)


# Assigning the correct names to the columns in the X_Data_test

          feat <- read.table("./UCI_HAR_Dataset/features.txt")
          
# Importing the "Test" Data Set.    
          
          X_Data_test <- read.table("./UCI_HAR_Dataset/test/X_test.txt", col.names = feat[,2])

# Importing the data relative to the subject for the test data set
          
          subject_test <- read.table("./UCI_HAR_Dataset/test/subject_test.txt", col.names = "subject")
          
# Importing the data relative to the activities for the test data set
          
          act_test <- read.table("./UCI_HAR_Dataset/test/y_test.txt", col.names = "activity")
          
# Merging the df "act_test", "subject_test", "X_Data_test" and storing them in a new df
# called "X_Data_test_merged"
          
          X_Data_test_merged <- bind_cols( subject_test, act_test, X_Data_test)

# Importing the "Trainig" Data Set.
          
          X_Data_train <- read.table("./UCI_HAR_Dataset/train/X_train.txt", col.names = feat[,2])          

# Importing the data relative to the subject for the test data set
          
          subject_train <- read.table("./UCI_HAR_Dataset/train/subject_train.txt", col.names = "subject")
          
# Importing the data relative to the activities for the test data set
          
          act_train <- read.table("./UCI_HAR_Dataset/train/y_train.txt", col.names = "activity")

# Merging the df "act_train", "subject_train", "X_Data_train" and storing them in a new df
# called "X_Data_train_merged"


          
          X_Data_train_merged <- bind_cols( subject_train, act_train, X_Data_train)
# Removing the df that are not needed anymore from the work-space
          
          rm(X_Data_test, subject_test, act_test, X_Data_train, subject_train, act_train)

# Merging the test and the train data sets
          
          X_Data_merged <- bind_rows(X_Data_test_merged, X_Data_train_merged )

# Removing the df that are not needed anymore from the work-space
          
          rm( X_Data_test_merged, X_Data_train_merged)
          
#==========================================================================================
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
          
# the function grepl is used as condition to subset the X_Data_merged df and select only
# the measurements referring to mean or standard deviation.
# the first two columns "subject" and "activity" are also selected.
# the new data are stored in a new df called "Data_mean_std".
# NOTE: the columns containing ???meanFreq??? are not selected because this measure is not a pure
# mean (see the codebook for more details).
          
          Data_mean_std <- X_Data_merged[ ,  (grepl("subject", names(X_Data_merged)) | 
                                            grepl("activity", names(X_Data_merged)) | 
                                            grepl("mean", names(X_Data_merged)) | 
                                            grepl("std", names(X_Data_merged))) &
                                            !grepl("meanFreq" , names(X_Data_merged))]

#===========================================================================================
# 3. Uses descriptive activity names to name the activities in the data set

# The labels used hereafter are taken from the file "activity_labels.txt"

          
          Data_mean_std$activity[Data_mean_std$activity == 1] <- "walking"
          Data_mean_std$activity[Data_mean_std$activity == 2] <- "walking_upstairs"
          Data_mean_std$activity[Data_mean_std$activity == 3] <- "walking_downstairs"
          Data_mean_std$activity[Data_mean_std$activity == 4] <- "sitting"
          Data_mean_std$activity[Data_mean_std$activity == 5] <- "standing"
          Data_mean_std$activity[Data_mean_std$activity == 6] <- "laying"

                    
#===========================================================================================
# 4. Appropriately labels the data set with descriptive variable names.
          
# The following rules are used for the varable names:
#     a. All words that made a feature start with a capitol letter (example: tbodyaccmean become tBodyAccMean
#     c. Not duplicated
#     d. Not have underscores or dots or white spaces
          

# To have descriptive variable names the function gsub() is used
          
          
          names(Data_mean_std) <- gsub("[.]" , "",names(Data_mean_std) )
          names(Data_mean_std) <- gsub("mean","Mean", names(Data_mean_std))
          names(Data_mean_std) <- gsub("jerk", "Jerk" , names(Data_mean_std))
          names(Data_mean_std) <- gsub("std" , "Std" , names(Data_mean_std))

#===========================================================================================
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# To create the independent tidy dataset the function ???aggregate??? is used and the results
# stored in "F_Data_mean_std". As grouping elements "subjects" and "activity" are used.
          
          F_Data_mean_std <- aggregate(Data_mean_std[,3:68], 
                                       by = list(subject = Data_mean_std$subject 
                                      , activity = Data_mean_std$activity), mean)

#===========================================================================================

# writing the data set as a txt file    
          
          write.table(F_Data_mean_std , "Final_dataset.txt" , row.name=FALSE)
          
#===========================================================================================          
