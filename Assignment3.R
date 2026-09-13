library(ggplot2)

# Define the vectors
Name <- c("Jeb", "Donald", "Ted", "Marco", "Carly", "Hillary", "Bernie")

ABC_poll <- c(4, 62, 51, 21, 2, 14, 15)
CBS_poll <- c(12, 75, 43, 19, 1, 21, 19)

# Combine into a data frame
df_polls <- data.frame(Name, ABC_poll, CBS_poll)

# Inspect the data using str() and head()
str(df_polls)
head(df_polls)

# Compute summary statistics for ABC
mean(df_polls$ABC_poll)
median(df_polls$ABC_poll)
range(df_polls$ABC_poll)

# Compute Summary statistics for CBS
mean(df_polls$CBS_poll)
median(df_polls$CBS_poll)
range(df_polls$CBS_poll)

#The range across both polls
range(df_polls[, c("ABC_poll", "CBS_poll")])

# Calculate the difference between CBS and ABC
df_polls$Diff <- df_polls$CBS_poll - df_polls$ABC_poll

# Display the updated data frame
df_polls

# Organize the poll results for the chart
poll_long <- data.frame(
  Name = rep(Name, 2),
  Poll = rep(c("ABC", "CBS"), each = length(Name)),
  Result = c(ABC_poll, CBS_poll)
)

# Create the grouped bar chart
poll_plot <- ggplot(
  poll_long,
  aes(x = Name, y = Result, fill = Poll)
) +
  geom_col(position = "dodge") +
  labs(
    title = "ABC and CBS Poll Results",
    x = "Candidate",
    y = "Poll Value",
    fill = "Poll"
  ) +
  theme_minimal()

# Display the chart
poll_plot

# Save the chart as an image
ggsave(
  "poll_analysis_R.png",
  plot = poll_plot,
  width = 9,
  height = 6,
  dpi = 300
)
