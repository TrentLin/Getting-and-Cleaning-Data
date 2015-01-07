# read in the column name for the data
col_names <- read.table("features.txt",header=FALSE,col.names=c("id","lable"))

# 1.Merges the training and the test sets to create one data set.

# Merge the training set
subject <- read.table("subject_train.txt",header=FALSE,col.names=("subject_id"))
activity <- read.table("y_train.txt",header=FALSE,col.names=("activity_id"))
dataset <- read.table("X_train.txt",header=FALSE,col.names = col_names[,"lable"])
trainset <- cbind(subject,activity,dataset)

# Merge the test set
subject <- read.table("subject_test.txt",header=FALSE,col.names=("subject_id"))
activity <- read.table("y_test.txt",header=FALSE,col.names=("activity_id"))
dataset <- read.table("X_test.txt",header=FALSE,col.names = col_names[,"lable"])
testset <- cbind(subject,activity,dataset)

# Merge trainset and testset
Dataset <- rbind(trainset,testset)

# 2.Extracts only the measurements on the mean and standard deviation for each measurement
regexp <- "(.*)+(mean|std)+(.*)"
col2 <- grep(regexp,colnames(Dataset))
col2 <- c(1,2,col2)
Extractset <- Dataset[,col2]
# names(Extractset)

# 3.Uses descriptive activity names to name the activities in the data set
# 4.Appropriately lables the data set with descriptive variable names.
activity_lables <- read.table("activity_labels.txt",header=FALSE,col.names = c("activity_id","activity_lable"))
Extractset_lables <- merge(x = Extractset, y = activity_lables, by = "activity_id", sort = TRUE)

# 5.creates a second, independent tidy data set with the average of each variable
  #for each activity and each subject
attach(Extractset_lables)
result <- aggregate(Extractset_lables[,3:81],
                    by=list(activity=Extractset_lables$activity_lable,
                            subject_id = Extractset_lables$subject_id),
                    FUN=mean)

# 6.Export the data to txt file
write.table(result,file="CouseProject.txt",sep=",",fileEncoding="UTF-8")