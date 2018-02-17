
## R script
File with R code "run_analysis.R" perform 5 following steps :   
1. Merging the training and the test sets to create one data set.   
  1.1 Reading files    
    1.1.1 Reading trainings tables   
    1.1.2 Reading testing tables   
    1.1.3 Reading feature vector   
    1.1.4 Reading activity labels   
  1.2 Assigning column names   
  1.3 Merging all data in one set   
2. Extracting only the measurements on the mean and standard deviation for each measurement   
  2.1 Reading column names  
  2.2 Create vector for defining ID, mean and standard deviation   
  2.3 Making nessesary subset from Binddata
3. Using descriptive activity names to name the activities in the data set   
4. Appropriately labeling the data set with descriptive variable names   
5. Creating a second, independent tidy data set with the average of each variable for each activity and each subject   
  5.1 Making second tidy data set
  5.2 Perform proper ordering on the data set
  5.3 Writing second tidy data set in txt file   

## variables:   
* `fileUrl` holds the url for the original dataset in zip format
* `x_training`, `y_training`, `x_test`, `y_test`, `subject_training` and `subject_test` contain the data from the downloaded files.
* `features` vecotor contains the correct names for the `x_data` dataset, which are applied to the column names
* `activityLabels` holds the data for activity labesl
* `mrg_training` and `mrg_test` are the merged datasets for training and test data
* `Binddata` holds the combined data for training and test
* `colnamesdata` holds the names of the columns for combined data
* `mean_and_sd`, `setMeanAndSd` contains the Mean and Standard Deviation for each measurement and its subset respectively
* `setActivityNames` holds the activity labels and `mean_and_sd` merged by by activityid
* `cleandataSet` contains the second, independent tidy data set with the average of each variable for each activity and each subject


