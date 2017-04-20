# run_analysis.R

# You should create one R script called run_analysis.R that does the following.

# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation 
#    for each measurement.
# 3. Uses descriptive activity names to name the activities 
#    in the data set
# 4. Appropriately labels the data set with descriptive variable names.
# 5. From the data set in step 4, creates a second, independent
#    tidy data set with the average of each variable for each
#    activity and each subject.
################################################################################

# I did the above but in a different order.

# 1. Merges the training and the test sets to create one data set.

setwd("C:/Users/lorel_000/Google Drive/DataScienceJHU/GettingandCleaningData/CourseProject")

# read test and train data set
test <- read.table(file = "./UCI HAR Dataset/test/X_test.txt", header = FALSE)
train <- read.table(file = "./UCI HAR Dataset/train/X_train.txt", header = FALSE)

# read test and train labels (each row corresponds to each activity)

test_labels <- read.table(file = "./UCI HAR Dataset/test/y_test.txt",
                          header = FALSE)
train_labels <- read.table(file = "./UCI HAR Dataset/train/y_train.txt", 
                           header = FALSE)

# read test_subject and train subject (each row correspond to the subject id)

test_subject <- read.table(file = "./UCI HAR Dataset/test/subject_test.txt",
                           header = FALSE)
train_subject <- read.table(file = "./UCI HAR Dataset/train/subject_train.txt",
                            header = FALSE)

# dataset 
# for each dataset I cbinded the data of the subjects id, activity labels and
# measurements, then I merged both datasets together using rbind.

test_data <- cbind(test_subject,test_labels, test)
train_data <- cbind(train_subject, train_labels, train)
data <- rbind(test_data, train_data)

# 4. Appropriately labels the data set with descriptive variable names.

# extract feature names from fratures.txt file

features <- read.table(file = "./UCI HAR Dataset/features.txt", header = FALSE)
features <- as.character(features$V2)

# assign features as variable names in the data
names(data) <- c("id", "activity", features)

# 3. Uses descriptive activity names to name the activities 
#    in the data set

# description of each activity is in 'activity_labels.txt'

labels_activity <- readLines("./UCI HAR Dataset/activity_labels.txt")
labels_activity <- tolower(gsub("^[[:digit:]] ", "", labels_activity))
data$activity <- factor(data$activity, labels=labels_activity)

# 2. Extracts only the measurements on the mean and standard deviation 
#    for each measurement.

means <- grep("mean\\(\\)+", names(data), value = TRUE)
stds <- grep("std\\(\\)+", names(data), value = TRUE)
means_stds <- c(means,stds)
data <- data[, c(1,2,which(names(data) %in% means_stds))]

# 5. From the data set in step 4, creates a second, independent
#    tidy data set with the average of each variable for each
#    activity and each subject.

data <- tbl_df(data)

names(data) <- gsub("-", "", names(data))
names(data) <- gsub("\\(\\)", "", names(data))

data_tidy <- data %>% group_by(activity, id) %>%
                summarize_each(funs(mean))

# data_tidy is the second indepent tidy dataset, with the average of
# each measurement group by activity and subject id.


# write tidy data into .txt file
write.table(data_tidy, file = "data_tidy.txt")
                
