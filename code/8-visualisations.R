library(dplyr)
library(ggplot2)

df_movies <- read.csv("data/movies_metadata.csv")
df_movies$budget <- as.numeric(df_movies$budget)
df_movies$popularity <- as.numeric(df_movies$popularity)
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
ggplot(df_movies, aes(x = revenue)) + 
  geom_histogram()

df_movies %>%
  arrange(-revenue) %>%
  select(title, revenue) %>%
  head(10)

df_movies %>%
  filter(between(revenue, 1, 1000000000)) %>%
  ggplot(aes(x = revenue)) + 
    geom_histogram()

# create a histogram of runtime and determine problems
ggplot(df_movies, aes(x = runtime)) + 
  geom_histogram()

df_movies %>%
  arrange(runtime) %>%
  select(title, runtime) %>%
  head(10)

# Create a histogram of voting average and determine problems
ggplot(df_movies, aes(x = vote_average)) + 
  geom_histogram()

df_movies %>%
  arrange(-vote_average) %>%
  select(title, vote_average, vote_count, revenue, budget) %>%
  head(10)

## Scatter plots ----

ggplot(df_movies, aes(x = vote_average, y = revenue)) + 
  geom_point()

# remove revenue 0 and where vote count is less then XYXXY and where revenue is 
# larger than 1 billion dolar
ggplot(df_movies, aes(x = vote_average, y = revenue)) + 
  geom_point() + 
  geom_hline(yintercept = c(1, 1000000000)) + 
  geom_vline(xintercept = 2.5)

df_movies %>%
  filter(revenue > 0, vote_count > 100, revenue < 1000000000) %>%
  ggplot(aes(x = vote_average, y = revenue)) + 
  geom_point()

df_movies %>%
  filter(revenue > 0, vote_count > 100, revenue < 1000000000) %>%
  ggplot(aes(x = vote_average, y = revenue)) + 
    geom_point() +
    geom_smooth(method = "lm")

df_movies %>%
  filter(popularity < 20, vote_count > 0) %>%
  ggplot(aes(x = popularity, y = vote_count)) + 
    geom_point() + 
    geom_smooth(method = "lm")

df_movies %>%
  filter(popularity < 5, vote_count > 0) %>%
  ggplot(aes(x = popularity)) + 
    geom_histogram()

df_movies %>%
  # create a variable called high_gross - > 50 000 000 in revenue
  mutate(high_gross = revenue > 50000000) %>%
  # filter data approprietly
  filter(revenue > 0, popularity < 20, vote_count > 0) %>%
  # plot relationship between popularity and vote count - color by high_gross
  ggplot(aes(popularity, vote_count, color = high_gross)) +
    geom_point() +
    geom_smooth(method = "lm")
  # add geom smooth

summary(lm(revenue ~ vote_average, data= filter(df_movies, revenue > 0, 
                                                vote_count > 100, revenue < 1000000000)))


