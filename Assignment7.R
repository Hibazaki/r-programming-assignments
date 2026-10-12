# Load the data
data("mtcars")

# Show the first rows
head(mtcars)

# Show the structure
str(mtcars)

# Summarize the dataset
summary(mtcars)

# Create an S3 object
s3_obj <- list(name = "Myself", age = 29, GPA = 3.5)
class(s3_obj) <- "student_s3"

# Create a print method
print.student_s3 <- function(x, ...) {
  cat("Name:", x$name, "\n")
  cat("Age:", x$age, "\n")
  cat("GPA:", x$GPA, "\n")
}

# Print the S3 object
print(s3_obj)

# Create an S4 class
methods::setClass(
  "student_s4",
  slots = c(name = "character", age = "numeric", GPA = "numeric")
)

# Create an S4 object
s4_obj <- methods::new(
  "student_s4",
  name = "Myself",
  age = 29,
  GPA = 3.5
)

# Create a show method
methods::setMethod("show", "student_s4", function(object) {
  cat("Name:", object@name, "\n")
  cat("Age:", object@age, "\n")
  cat("GPA:", object@GPA, "\n")
})

# Show the S4 object
methods::show(s4_obj)

# Check the S3 object
class(s3_obj)
isS4(s3_obj)
typeof(s3_obj)

# Check the S4 object
class(s4_obj)
isS4(s4_obj)
typeof(s4_obj)
methods::slotNames(s4_obj)