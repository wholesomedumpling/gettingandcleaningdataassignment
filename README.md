# Getting and Cleaning Data Assignment
##### Author: Tiffany Gregory

#### Submission Information
* The submitted data set is tidy.  
* The Github repo contains the required scripts.  
* GitHub contains a code book that modifies and updates the available codebooks with the data to indicate all the variables and summaries calculated, along with units, and any other relevant information.  
* The README that explains the analysis files is clear and understandable.  
* The work submitted for this project is the work of the student who submitted it.  
  
#### Code information
* Merges the training and the test sets to create one data set.  
* Extracts only the measurements on the mean and standard deviation for each measurement.  
* Uses descriptive activity names to name the activities in the data set  
* Appropriately labels the data set with descriptive variable names.  
* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.  

#### Code Structure

1. Reads in the packages necessary for tidying the data.  

2. Reads in the data sets:  
    + 'features_info.txt': Shows information about the variables used on the feature vector.  
    + 'features.txt': List of all features.  
    + 'activity_labels.txt': Links the class labels with their activity name.  
    + 'train/X_train.txt': Training set.  
    + 'train/y_train.txt': Training labels.  
    + 'test/X_test.txt': Test set.  
    + 'test/y_test.txt': Test labels.  
    

3. Combines the test data and train data separately using cbind. This brings in the subject data, activity data and variable data together.  

4. I've also included a line of code to add in which data source it's from by using the mutate function to label it whether it's test or train.  

5. Combine all datasets into one using rbind. Read in the name data and add in the other custom names. Assign this to the column names.  

6. Extract only the mean and standard deviation columns using grep.  

7. Read in activity names to replace the Activity ID column.  

8. Bring in the functional activity names using left_join. Reorder the dataset and remove Activity ID and data type (removes train and test column - can change this to keep it and understand which data is used).  

9. Create the tidy data set using group_by and summarise_at (summarising using mean to calculate the average).  

10. Save the tidy data to a new text file.  

###### **Reference**
Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013.