Code Book of the Course Project
================================
1.Read in the features.txt in the data set names as col_names
  * col_names is the data set of List of all features
  * Names column name as id (ex:1,2,3...) & label (ex: tBodyAcc-mean()-X)
  
2.Merges the training and the test sets to create one data set.

2.1 Merges training set 
  * subject is the data set of the subject who performed the activity for each window sample.
    names column name as subject_id
  * activity is the data set of Training labels names column name as activity_id  
  * dataset is the data set of Training set names column name as features
  * combine subject, activity, dataset to create the Training set names as trainset
  
2.2 Merges test set
  * subject is the data set of the subject who performed the activity for each window sample.
    names column name as subject_id
  * activity is the data set of test labels names column name as activity_id  
  * dataset is the data set of test set names column name as features
  * combine subject, activity, dataset to create the Test set names as testset
  * Merge trainset and testset names as Dataset
  
3.Extracts only the measurements on the mean and standard deviation for each measurement
  * regexp is pattern which want to extract only the measurements on the mean and standard 
    deviation for each measurement
  * col2 use grep function to find colnames which meet regexp pattern in Dataset
  * col2 a the first 2 columns wich are activiy_id and subject_id
  
4.Uses descriptive activity names to name the activities in the data set
  and appropriately lables the data set with descriptive variable names.
  * activity_lables is the data set Links the class labels with their activity name
    names columns name as activity_id and activity_lable
  * Extractset_lables is a data set which merge data set Extractset and activity_lables by 
    activity_id
	
5.creates a second, independent tidy data set with the average of each variable
  for each activity and each subject
  * result is a data set which with the average of each variable
    for each activity and each subject 
  * name activity_lable as activity and subject_id as subject_id
  
6.Export the data to txt file
  * Use Write.table function to export result