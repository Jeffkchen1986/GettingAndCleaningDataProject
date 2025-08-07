# CodeBook

This codebook describes the variables and transformations performed to produce the final tidy dataset for the Getting and Cleaning Data Course Project.

## Source Data

The original data come from the Human Activity Recognition Using Smartphones Dataset, collected using Samsung Galaxy S smartphones.

## Variables in tidy_dataset.txt

- `subject`: ID of the participant (1–30)
- `activity`: Type of activity performed (WALKING, LAYING, etc.)
- 66 variables: Mean and standard deviation measurements for body and gravity accelerometer and gyroscope signals, averaged by subject and activity

## Processing Steps

1. Merged training and test sets
2. Extracted only measurements on the mean and standard deviation
3. Replaced activity codes with descriptive names
4. Labeled variables with descriptive names
5. Created a second tidy dataset with average values for each subject and activity
