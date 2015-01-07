Course Project for 'Getting and Cleaning Data'
===============================================
# read in the column name for the data
1.Merges the training and the test sets to create one data set.
  * Merge the training set
  * Merge the test set
  * Merge trainset and testset

2.Extracts only the measurements on the mean and standard deviation for each measurement
  * Use regexp to create a pattern
  * Create New DataSet Name as Extractset

3.Uses descriptive activity names to name the activities in the data set.
4.Appropriately lables the data set with descriptive variable names.
  * Read activity_labels.txt
  * Merge activity_lables with Extractset


5.creates a second, independent tidy data set with the average of 
  each variable for each activity and each subject
  * Use aggregate function to create columns mean by activity and subject_id

6.Export the data to txt file  
  * Use write.table to export file
