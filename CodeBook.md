#Work performed
All the work have been performs on the script **run_analysis.R**. In this script I followed the steps described in the course project's definition.

1. Merges the training and the test sets to create one data set. I use **rbind()** function with special attention to both data sets must to have the same number of columns and referring to the same entities.
2. Extracts only the measurements on the mean and standard deviation for each measurement. In this case I use the **grep()** function to look up on **features.txt** those features and then put her correct names.
3. Uses descriptive activity names to name the activities in the data set. As activity data is addressed with values 1:6, we take the activity names and IDs from **activity_labels.txt** and they are substituted in the dataset.
4. Appropriately labels the data set with descriptive variable names. 
5. Finally, I generate a new dataset with all the average measures for each subject and activity type (30 subjects * 6 activities = 180 rows).

#Variables
- **x_train**, **y_train**, **x_test**, **y_test**, **subject_train** and **subject_test** contain the data from the downloaded files.
- **x_data**, **y_data** and **subject_data** are the merge of the previous datasets.
- **features** contains the correct name for **x_data**.
- **meanstd_features** is a numeric vector used to extract the desired data from **features.txt**.
- **activities** variable is used to taken the names of **activity_labels.txt**
- **data** is a variable where merges **x_data**, **y_data** and **subject_data**.
- **averages_data** contains the relevant averages which will be later stored in a .txt file.
