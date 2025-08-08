# run_analysis.R

# 1. 读取特征和活动标签
features <- read.table("UCI HAR Dataset/features.txt", stringsAsFactors = FALSE)
activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))

# 2. 读取训练集和测试集
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "code")

subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "code")

# 3. 合并训练和测试数据
subject <- rbind(subject_train, subject_test)
x_data <- rbind(x_train, x_test)
y_data <- rbind(y_train, y_test)

# 4. 设置列名
colnames(x_data) <- features[, 2]
merged_data <- cbind(subject, y_data, x_data)

# 5. 提取 mean() 和 std() 的变量（修复点）
mean_std_index <- grep("mean\\(\\)|std\\(\\)", features[, 2])
selected_data <- merged_data[, c(1, 2, mean_std_index)]  # 1是subject，2是code

# 6. 替换活动编号为名称
selected_data$code <- activities[selected_data$code, 2]
colnames(selected_data)[2] <- "activity"

# 7. 创建tidy数据集
tidy_data <- aggregate(. ~subject + activity, selected_data, mean)
tidy_data <- tidy_data[order(tidy_data$subject, tidy_data$activity), ]

# 8. 写入文件
write.table(tidy_data, "tidy_dataset.txt", row.name = FALSE)
