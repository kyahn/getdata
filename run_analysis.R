# Class Project, Getting and Cleaning Data Course
#
library(plyr)

if(!file.exists("./fit")){dir.create("./fit")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, "./fit/dataset.zip")
unzip("./fit/dataset.zip", exdir="./fit")

# create vector of field labels
labels <- read.table("./fit/UCI HAR Dataset/features.txt")
# create vector indicating whether column is targeted or not (mean/stdev)
r1 <- as.logical(rowSums(cbind(grepl("-[Mm]ean()",labels$V2),grepl("-[Ss]td()",labels$V2))))
# pull reference list to activity types
atypes <- read.table("./fit/UCI HAR Dataset/activity_labels.txt")
# pull row activity type tags to bind to each activity vector
act1 <- read.table("./fit/UCI HAR Dataset/train/y_train.txt")
act2 <- read.table("./fit/UCI HAR Dataset/test/y_test.txt")
# pull subject information for each row
s1 <- read.table("./fit/UCI HAR Dataset/train/subject_train.txt")
s2 <- read.table("./fit/UCI HAR Dataset/test/subject_test.txt")
# pull raw data rows for training and test data
fit1 <- read.table("./fit/UCI HAR Dataset/train/X_train.txt", col.names = labels[,2])
fit2 <- read.table("./fit/UCI HAR Dataset/test/X_test.txt", col.names = labels[,2])
# merge data and activity types
data1 <- subset(rbind(cbind(fit1, act1, s1),cbind(fit2, act2, s2)),select=r1)
# rename activity types
data2 <- merge(data1,atypes,by.x="V1",by.y="V1")
data2 <- rename(data2, c("V1.1" = "Subject"))
data2 <- rename(data2, c("V2" = "Activity"))
# likely better way to do this upstream during table merge/bind...
data3 <- subset(data2,select = -c(1))
# Create a second, independent tidy data set
# with the average of each variable for each activity and each subject
data4 <- ddply(data3,.(Subject,V2),colwise(mean))
# push output to a file...
write.table(data4,"./fit/Project.txt", row.name=FALSE)
