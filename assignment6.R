# Task 1: Matrix addition and subtraction

# Create the matrices
A <- matrix(c(2, 0, 1, 3), ncol = 2)
B <- matrix(c(5, 2, 4, -1), ncol = 2)

# Display the matrices
A
B

# Add the matrices
A + B

# Subtract the matrices
A - B

# Task 2: Create a diagonal matrix
D <- diag(c(4, 1, 2, 3))

# Display the diagonal matrix
D

# Task 3: Construct a Custom 5×5 Matrix

# Create a 5 × 5 matrix with 3 on the diagonal
M <- diag(c(3, 3, 3, 3, 3))

# Change the first row, excluding the diagonal
M[1, 2:5] <- 1

# Change the first column, excluding the diagonal
M[2:5, 1] <- 2

# Display the matrix
M