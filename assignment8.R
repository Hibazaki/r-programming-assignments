# Import the comma-separated Assignment 6 dataset
student6 <- read.csv(
  file.choose(),
  stringsAsFactors = FALSE
)

# Check that the data imported correctly
names(student6)
head(student6)

# Load plyr and calculate the average grade by sex
library(plyr)

gender_mean <- plyr::ddply(
  student6,
  "Sex",
  plyr::summarise,
  GradeAverage = mean(Grade, na.rm = TRUE)
)

# Export the grouped averages as a tab-delimited text file
write.table(
  gender_mean,
  file = "gender_mean.txt",
  sep = "\t",
  row.names = FALSE
)

# Find students whose names contain "i" or "I"
i_students <- subset(
  student6,
  grepl("i", Name, ignore.case = TRUE)
)

# Export the matching names to a CSV file
write.csv(
  i_students$Name,
  file = "i_students.csv",
  row.names = FALSE,
  quote = FALSE
)

# Export all columns for the matching students
write.csv(
  i_students,
  file = "i_students_full.csv",
  row.names = FALSE
)

# Confirm that all three files were created
file.exists(c(
  "gender_mean.txt",
  "i_students.csv",
  "i_students_full.csv"
))