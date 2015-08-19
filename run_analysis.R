run_analysis <- function() {
  #This function loads the Human Activity Recognition Using Smartphones Data Set,
  #makes it tidy, then summarizes it. Please see README.md and CODEBOOK.md on github 
  #for more info.
  
  #Load all source data into R from the working directory
  x_test_file<-read.table("UCI HAR Dataset/test/x_test.txt", header = F)
  y_test_file<-read.table("UCI HAR Dataset/test/y_test.txt", header = F)
  subject_test_file<-read.table("UCI HAR Dataset/test/subject_test.txt", header = F)
  x_train_file<-read.table("UCI HAR Dataset/train/x_train.txt", header = F)
  y_train_file<-read.table("UCI HAR Dataset/train/y_train.txt", header = F)
  subject_train_file<-read.table("UCI HAR Dataset/train/subject_train.txt", header = F)
  features_file<-read.table("UCI HAR Dataset/features.txt", header = F, stringsAsFactors = F)
  activity_labels_file<-read.table("UCI HAR Dataset/activity_labels.txt", header = F, stringsAsFactors = F)
  
  #combine the source data into a single data frame.
  test_data<-cbind(subject_test_file, y_test_file, x_test_file)
  train_data<-cbind(subject_train_file, y_train_file, x_train_file)
  all_data<-rbind(train_data, test_data)
  
  #rename columns and activity factor based on data description documents. 
  #changes subject_name to factor
  colnames(all_data)<-c("subject_number","activity",features_file[[2]])
  all_data[,2]<-factor(all_data[,2], labels = activity_labels_file[,2])
  all_data[,1]<-factor(all_data[,1])
  
  #create a subset of just the mean and standard diviation measurements
  #this produces the tidy data set desribed in step 4 of project requirements
  #and writes it to tidy_mean_std_data.txt
  tidy_mean_std_data<-all_data[c(1:2,grep("mean\\(", colnames(all_data)),grep("std", colnames(all_data)))]
  write.table(tidy_mean_std_data, "tidy_mean_std_data.txt", quote=F, row.names=F)
  
  #summarize the previous data by subject_number and activity, taking the means of each group.
  #then prefix the summarized variables with "average_"
  library(dplyr)
  tidy_mean_std_data %>% group_by(subject_number, activity) %>% summarise_each(funs(mean)) -> summarized_mean_std_data
  colnames(summarized_mean_std_data)[3:68]<-paste0("average_",colnames(summarized_mean_std_data))[3:68]

  #return the summarized tidy data set desribed in step 5 of project requirements
  #and write it to file: summarized_mean_std_data.txt
  write.table(summarized_mean_std_data, "summarized_mean_std_data.txt", quote=F, row.names=F)
  summarized_mean_std_data
  
}