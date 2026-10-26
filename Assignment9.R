data("mtcars", package = "datasets")

# Base R: scatterplot
cyl_colors <- c("4" = "blue", "6" = "orange", "8" = "purple")

plot(
  mpg ~ wt,
  data = mtcars,
  col = cyl_colors[as.character(mtcars$cyl)],
  pch = 19,
  main = "Base R: Weight and MPG",
  xlab = "Weight (1,000 lbs)",
  ylab = "Miles per gallon"
)

legend(
  "topright",
  legend = names(cyl_colors),
  col = cyl_colors,
  pch = 19,
  title = "Cylinders"
)
# Base R: histogram
hist(
  mtcars$mpg,
  main = "Base R: MPG Distribution",
  xlab = "Miles per gallon"
)

# Lattice: scatterplots separated by cylinder count
library(lattice)

xyplot(
  mpg ~ wt | factor(cyl),
  data = mtcars,
  main = "Lattice: Weight and MPG by Cylinders"
)

# ggplot2: scatterplot with trend lines
library(ggplot2)

ggplot(mtcars, aes(x = wt, y = mpg, color = factor(cyl))) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  labs(
    title = "ggplot2: Weight and MPG by Cylinders",
    x = "Weight (1,000 lbs)",
    y = "Miles per gallon",
    color = "Cylinders"
  )