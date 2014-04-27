####
## Step 1: Merges the training and the test sets to create one data set.
subject_train <- read.table("~/GitHub/Getting_and_Cleaning_Data-Peer_Review_Project/UCI HAR Dataset/train/subject_train.txt", quote="\"")
X_train <- read.table("~/GitHub/Getting_and_Cleaning_Data-Peer_Review_Project/UCI HAR Dataset/train/X_train.txt", quote="\"")
y_train <- read.table("~/GitHub/Getting_and_Cleaning_Data-Peer_Review_Project/UCI HAR Dataset/train/y_train.txt", quote="\"")
subject_test <- read.table("~/GitHub/Getting_and_Cleaning_Data-Peer_Review_Project/UCI HAR Dataset/test/subject_test.txt", quote="\"")
X_test <- read.table("~/GitHub/Getting_and_Cleaning_Data-Peer_Review_Project/UCI HAR Dataset/test/X_test.txt", quote="\"")
y_test <- read.table("~/GitHub/Getting_and_Cleaning_Data-Peer_Review_Project/UCI HAR Dataset/test/y_test.txt", quote="\"")
features <- read.table("~/GitHub/Getting_and_Cleaning_Data-Peer_Review_Project/UCI HAR Dataset/features.txt", quote="\"", stringsAsFactors=FALSE)
test <- cbind(subject_test, y_test, X_test)
train <- cbind(subject_train, y_train, X_train)
data <- rbind(train,test)
colnames(data) <- c("Subject_ID", "Activity_Label", features$V2)

####
## Step 2: Extracts only the measurements on the mean and standard deviation for each measurement. 
mean_inds <- grep("mean", colnames(data))
std_inds <- grep("std", colnames(data))
indexes_to_keep <- c(1,2, mean_inds, std_inds)
data_subset <- data[,indexes_to_keep]

####
## Step 3 & 4: Uses descriptive activity names to name the activities in the data set --- and --- Appropriately labels the data set with descriptive activity names. 
data_subset$Activity_Label <- as.factor(data_subset$Activity_Label)
levels(data_subset$Activity_Label) <- c("Walking", "Walking Upstairs", "Walking Downstairs", "Sitting", "Standing", "Laying")

####
## Step 5: Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
tidy <- data.frame(matrix(rep(NA,180), nrow=180, ncol=81))
colnames(tidy) <- colnames(data_subset)
starter <- aggregate(data_subset[,3], by=list(data_subset$Subject_ID,data_subset$Activity_Label), mean)
tidy[,1:2] <- starter[,1:2]
for(i in seq(3:180)){
  tidy[,i] <- aggregate(data_subset[,i], by=list(data_subset$Subject_ID,data_subset$Activity_Label), mean)[[3]]
}

tidy[,2] <- aggregate(data_subset[,3], by=list(data_subset$Subject_ID,data_subset$Activity_Label), mean)[[2]]

write.csv(tidy, file = "~/GitHub/Getting_and_Cleaning_Data-Peer_Review_Project/tidy.txt")
