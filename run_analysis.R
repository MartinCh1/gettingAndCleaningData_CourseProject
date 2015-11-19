run_analysis<-function(directory){
  
  library(plyr)
  
  ##1.Merges the training and the test sets to create one data set.
  
  x_train <- read.table(paste(directory, "/train/X_train.txt", sep = ""))
  y_train <- read.table(paste(directory, "/train/y_train.txt", sep = ""))
  subject_train <- read.table(paste(directory, "/train/subject_train.txt", sep = ""))
  
  x_test <- read.table(paste(directory, "/test/X_test.txt", sep = ""))
  y_test <- read.table(paste(directory, "/test/y_test.txt", sep = ""))
  subject_test <- read.table(paste(directory, "/test/subject_test.txt", sep = ""))
  
  ## y data set
  x_data <- rbind(x_train, x_test)
  
  ## y data set
  y_data <- rbind(y_train, y_test)
  
  ## subject data set
  subject_data <- rbind(subject_train, subject_test)
  
  
  ##2.Extracts only the measurements on the mean and standard deviation for each measurement.   

  features <- read.table(paste(directory, "features.txt", sep = ""))
  
  ## we only want columns with mean() or std() in their names
  meanstd_features <- grep("-(mean|std)\\(\\)", features[,2])
  
  ## subset of desire columns
  x_data <- x_data[,meanstd_features]
  
  ##column names
  names(x_data) <- features[meanstd_features,2]
  
  x_data
  
  
  ##3.Uses descriptive activity names to name the activities in the data set
  
  activities <- read.table(paste(directory, "activity_labels.txt", sep = ""))
  
  ## update y_data values with correspondent activity value
  y_data[,1] <- activities[y_data[,1],2]
  
  ##column name
  names(y_data) <- "activity"
  
  
  ##4.Appropriately labels the data set with descriptive variable names. 
  
  ##column name
  names(subject_data) <- "subject"
  
  ##bind all in a single data
  data <- cbind(x_data, y_data, subject_data)
  
  
  ##5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
  
  
  averages_data <- ddply(data, .(subject, activity), function(x) colMeans(x[,1:66]))
  
  ##write data set
  write.table(averages_data, "averages_data.txt", row.names = FALSE)

  
}
