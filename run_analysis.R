######################### Comments ##############################
#
# This script downloads the Human Activity Recognition Using
# Smartphones Data Set from the web and converts it into a tidy
# data set. Please see enclosing codebook for further details.
#
################################################################

# Set working directory
if (file.exists("UCI HAR Dataset")) {
  setwd("UCI HAR Dataset")
}

# Read in column names
temp <- read.table("./features.txt", sep = " ")
col.names <- as.character(temp$V2)

# Read in training set
temp <- read.table("./train/X_train.txt", sep = ",")
temp <- gsub("  ", " ", temp$V1)
train <-
  read.table(
    text = temp,
    sep = " ",
    nrows = 7352,
    header = FALSE,
    quote = ""
  )
train$V1 <- NULL
colnames(train) <- col.names

# Read in activity names/aliaces
activity.names <- read.table("./activity_labels.txt", sep = " ")

# Read in activity types for training set
train.activities <-
  read.table(
    "./train/y_train.txt",
    sep = " ",
    nrows = 7352,
    header = FALSE,
    quote = ""
  )

# Merge previous two dataframes
temp <-
  merge(
    train.activities,
    activity.names,
    by.x = "V1",
    by.y = "V1",
    all = TRUE,
    sort = FALSE
  )
train.Activity <- as.data.frame(temp$V2)
colnames(train.Activity) <- c("Activity")

# Read in subject numbers
train.subjects <- read.table("./train/subject_train.txt")

# Read in test set
temp <- read.table("./test/X_test.txt", sep = ",")
temp <- gsub("  ", " ", temp$V1)
test <-
  read.table(
    text = temp,
    sep = " ",
    nrows = 2947,
    header = FALSE,
    quote = ""
  )
test$V1 <- NULL
colnames(test) <- col.names

# Read in activity types for test set
test.activities <-
  read.table(
    "./test/y_test.txt",
    sep = " ",
    nrows = 2947,
    header = FALSE,
    quote = ""
  )

# Merge previous two dataframes
temp <-
  merge(
    test.activities,
    activity.names,
    by.x = "V1",
    by.y = "V1",
    all = TRUE,
    sort = FALSE
  )
test.Activity <- as.data.frame(temp$V2)
colnames(test.Activity) <- c("Activity")

# Read in subject numbers
test.subjects <- read.table("./test/subject_test.txt")

# Combining Training and Test sets
all <- rbind(train, test)
all1 <-
  all[, grep(pattern = "-mean()", x = col.names, fixed = TRUE)]
all2 <- all[, grep(pattern = "-std()", x = col.names, fixed = TRUE)]
all <- cbind(all1, all2)

# Adding activity and subject columns
temp <- rbind(train.Activity, test.Activity)
all$Activity <- temp$Activity
temp <- rbind(train.subjects, test.subjects)
all$Subject <- temp$V1

# Removing unnecessary objects
rm(
  list = c(
    'train',
    'test',
    'col.names',
    'temp',
    'all1',
    'all2',
    'activity.names',
    'test.subjects',
    'test.activities',
    'test.Activity',
    'train.activities',
    'train.Activity',
    'train.subjects'
  )
)

# Renaming columns to descriptive names
names <- colnames(all)
names <- gsub("tBody", "Body-Signal-", names)
names <- gsub("tGravity", "Gravity-Signal-", names)
names <- gsub("fBody", "Transformed-Body-Signal-", names)
names <- gsub("fGravity", "Transformed-Gravity-Signal-", names)
names <- gsub("Acc", "From-Accelerometer", names)
names <- gsub("Gyro", "From-Gyroscope", names)
names <- gsub("Jerk", "-Jerk", names)
names <- gsub("Mag", "-Magnitude", names)
names <- gsub("X", "X-Axis", names)
names <- gsub("Y", "Y-Axis", names)
names <- gsub("Z", "Z-Axis", names)
names <- gsub("mean\\(\\)", "Mean", names)
names <- gsub("std\\(\\)", "Std.Dev.", names)
names <- gsub("BodyFrom", "From", names)
names
colnames(all) <- names

# Calculating average for each subject and activity combination
final <-
  aggregate(formula = . ~ Activity + Subject,
            data = all,
            FUN = mean)
final$Subject <- as.factor(final$Subject)

# Renaming the columns
names <- names(final)
names <- paste0("Average-", names)
names[1] <- "Activity"
names[2] <- "Subject"
colnames(final) <- names

write.table(final, file = "./table.txt", row.names = FALSE)
