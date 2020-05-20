# Read data from the train subjects

x_train <- read.table("./data/train/X_train.txt", header = F)
y_train <- read.table( "./data/train/y_train.txt", header = F)
subject_train <- read.table( "./data/train/subject_train.txt", header = F)

# Read data from the test subjects

x_test <- read.table( "./data/test/X_test.txt", header = F)
y_test <- read.table("./data/test/y_test.txt", header = F)
subject_test <- read.table("./data/test/subject_test.txt", header = F)

# Read activity labels data
activity_labels <- read.table("./data/activity_labels.txt", header = F)

#------------------------------------------------------------------------#
# Appropriately label the tidy data set with descriptive variable names.

features <- read.table("./data/features.txt", header = F)
names(features)  <- c("code","name")

names(x_train) <- features$name ; names(x_test) <- features$name

cName <- "activity"
names(y_train) <- cName ; names(y_test) <- cName

cName <- "subject"
names(subject_train) <- cName; names(subject_test) <- cName

names(activity_labels) <- c('activity','type')

#------------------------------------------------------------------------#

# Merge the training and test data into one data set.

merge_train <- cbind(y_train, subject_train, x_train)
merge_test <- cbind(y_test, subject_test, x_test)

merge_all <- rbind(merge_train, merge_test)

#------------------------------------------------------------------------#
# Extract mean & standard deviation

col_names <- names( merge_all )

grepl_data <- (grepl("activity" , col_names) | 
                   grepl("subject" , col_names) | 
                   grepl("mean.." , col_names) | 
                   grepl("std.." , col_names))

merge_with_grepl <- merge_all[ , grepl_data == T]
merge_activity <- merge( merge_with_grepl, activity_labels, by='activity', all.x=T)

#------------------------------------------------------------------------#
# Genarate the tidy data

TidyData <- aggregate(. ~subject + activity, merge_activity, mean)
TidyData <- TidyData[order(TidyData$subject, TidyData$activity),]

# Write to disk 
write.table(TidyData, "TidyData.txt", row.name=F)

#------------------------------------------------------------------------#
# Create CodeBook

library(dataMaid)
makeCodebook(TidyData, file = "Week4Codebook.RMD" )