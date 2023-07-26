library(dplyr)
library(ggplot2)

df_movies <- read.csv("data/movies_metadata.csv")
df_movies$budget <- as.numeric(df_movies$budget)
set.seed(2023)
df_movies <- df_movies[sample(1:nrow(df_movies), 2500), ]

# remove all movies costing less then 2000 usd
df_movies <- df_movies[df_movies$budget >= 2000, ]
df_movies <- filter(df_movies, budget >= 2000)

# sample_n()

## Histograms -------
hist(1:10)
hist(rnorm(1000, mean = 0, sd = 1))

hist(df_movies$budget)
summary(df_movies$budget)

df_movies %>%
  arrange(-budget) %>%
  select(budget, title) %>%
  head(10)

hist(df_movies$budget, breaks = 100)
# hist(df_movies$budget, breaks = c(0, 10000, 100000, 1000000, 10000000, 300000000))

# GGPLOT ---
ggplot(df_movies, aes(x = budget)) + 
  geom_histogram()

ggplot(df_movies, aes(x = budget)) + geom_histogram()
ggplot(df_movies, aes(x = budget)) + geom_histogram(bins = 100)
ggplot(df_movies, aes(x = budget)) + geom_histogram(binwidth = 1000000)

df_movies %>%
  filter(budget < 50000000) %>%
  ggplot(aes(x = budget)) + geom_histogram()

ggplot(df_movies, aes(x = budget, fill = original_language)) + 
  geom_histogram()

df_movies %>%
  filter(original_language %in% c("en", "fr")) %>%
  ggplot(aes(x = budget, fill = original_language)) + 
    geom_histogram(alpha = 0.6)

# Create a histogram of revenues and determine problems

# create a histogram of runtime and determine problems

# Create a histogram of voting average and determine problems

## Scatter plots ----

