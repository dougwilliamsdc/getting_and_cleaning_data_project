###INTRODUCTION
This function loads the Human Activity Recognition Using Smartphones Data Set, 
makes it tidy, then summarizes it. Place the uncompressed folder "UCI HAR Dataset" 
in your working director before running. The function outputs two files into your 
working directory, then returns the summarized result to the parent environment:
1) tidy_mean_std_data.txt - tidy form of the original dataset with only mean 
and standard deviation measurements.
2) summarized_mean_std_data.txt - a new dataset based on te tidy data, grouped 
by subject_number and activity and summarized by taking the mean of each measurement.

###DETAILS
The function executes the following steps:  
1) Load all source data into R from the working directory
  
2) Combine the source data into a single data frame.

3) Rename columns and activity factor based on data description documents. 
changes subject_name to factor

4) create a subset of just the mean and standard deviation measurements. 
this produces the tidy data set described in step 4 of project requirements 
and writes it to tidy_mean_std_data.txt
  
5) summarize the previous data by subject_number and activity, taking the 
means of each group. then prefix the summarized variables with "average_"

6) return the summarized tidy data set described in step 5 of project requirements 
and write it to file: summarized_mean_std_data.txt.  
