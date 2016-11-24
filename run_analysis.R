
# Note: The UCI HAR Dataset should be already downloaded and decompressed

# 0) Set your working directory and read the appropiate files
setwd("C:\\Users\\ADRIA\\Desktop\\Data Cleaning\\Week 4")

X_train = read.table("UCI HAR Dataset/train/X_train.txt")
y_train = read.table("UCI HAR Dataset/train/y_train.txt")
X_test = read.table("UCI HAR Dataset/test/X_test.txt")
y_test = read.table("UCI HAR Dataset/test/y_test.txt")

subject_train = read.table("UCI HAR Dataset/train/subject_train.txt")
subject_test = read.table("UCI HAR Dataset/test/subject_test.txt")

features = read.table("UCI HAR Dataset/features.txt")

# 1) Merging Training and Test sets 
X = rbind(X_train,X_test)
y = rbind(y_train,y_test)

# 2) Extracting mean and std dev realated variables from features
indexes = grep("mean()|std()",features[,2])
features_filtered = features[indexes,]
X2 = X[,indexes]

# 3) Name the activites (walking, sitting, ... )
activity= ifelse(y==1,"WALKING",
          ifelse(y==2,"WALKING_UPSTAIRS",
          ifelse(y==3,"WALKING_DOWNSTAIRS",
          ifelse(y==4,"SITTING",
          ifelse(y==5,"STANDING","LAYING")))))
X3 = data.frame(activity,X2)

# 4) Rename the variables with a descriptive label
X4 = X3
descriptive_names = data.frame(features_filtered$V2)
names(descriptive_names) = c("V1")
new_row = data.frame(c("Activity"))
names(new_row) = c("V1")
descriptive_names_ext = rbind(new_row,descriptive_names)
names(X4) = as.vector(descriptive_names_ext$V1)

# 5) Average for each activity and subject
subject = rbind(subject_train,subject_test)
X5 = cbind(subject,X4)
colnames(X5)[colnames(X5)=="V1"] <- "Subject"
library(dplyr)
X5d=tbl_df(X5)
clean_data = summarize_each(group_by(X5d,Subject,Activity),funs(mean))
clean_data = arrange(clean_data,Subject, Activity)
