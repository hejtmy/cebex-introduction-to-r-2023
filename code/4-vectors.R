# Vectors ---

num <- c(1, 3, 5)

numbers <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)

numbers_2 <- c(1, "hello", 2, "world")
class(numbers_2)

test_vec <- c(1, TRUE, 2)

# only way to combine different types
test <- list(1, TRUE, "hello")
test[[1]]
test[[2]]
test[[3]]

## Everything is a vector ----
number <- 5
number <- c(5)
c(5) == 5

length(number)
length(numbers)
length(numbers_2)

### Create a vector of 1,2,3,4,5,1,2,3,4,5,1,2,3,4,5
fives <- c(1,2,3,4,5,1,2,3,4,5,1,2,3,4,5)
sequence_1 <- c(1,2,3,4,5)
fives <- c(sequence_1, sequence_1, sequence_1)

# Numeric shorthand
1:15
10:100
10:-1

?rep
rep(1:4, 2)

fives <- rep(1:5, 3)
rep(c("exp", "contr"), 10)
c(rep("exp", 10), rep("contr", 10))

1:-10

# Sequence
?seq

# temperatures <- 10 - 32 by 0.2 degrees
temperatures <- seq(10, 32, by = 0.2)

## Task

# 1. Create vector of 5 cities (around the world), one of them Prague, any position
cities <- c("Paris", "Madrid", "Prague", "Sydney", "Tokyo")

# 2. Create vector of roulette_numbers 0-36
roulette_numbers <- 0:36
roulette_numbers <- seq(0, 36)

# 3. create vector of roulette_colors green, red, black ---- (37 in total)
roulette_colors <- c("green", rep(c("red", "black"), 18))

# 4. Create weekdays (Monday - Sunday) 
weekdays <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday", 
              "Saturday", "Sunday")

# 5. Create vector of weekdays for entire year (starts with Monday) - 365 days
year_days <- rep(weekdays, length.out = 365) #better
year_days <- c(rep(weekdays, 52), "Monday") #good enough

## Vector operations ------
toupper()
tolower("Monday") == tolower("monday")

df <- data.frame(day = c("Monday ", "Monday"))

trimws("Monday ")
rev(weekdays)
rev(roulette_numbers)

unique(roulette_colors)
table(roulette_numbers)

sort(year_days)
sort(weekdays)
order(weekdays)

temperatures
floor(temperatures)
round(temperatures)
ceiling(temperatures)

round(0.5)
round(1.5)
round(2.5)
round(3.5)

quantile(roulette_numbers, probs = c(0.1, 0.5))
summary(roulette_numbers)

nchar(weekdays)

### Bonus one -----
grep("T", weekdays)
weekdays
grepl("T", weekdays)

## Vector access -----
cities[1]
cities[1]

cities[3]

cities[length(cities)]

head(cities, 2)
tail(cities, 2)

cities[c(1,3,5)]

cities[-1]
cities[-c(1,3,5)]

## Randomization --------
set.seed(1)
temperatures
temperatures_random <- sample(temperatures)

### Which ----
which(cities == "Prague")
i_temp_30 <- which(temperatures_random > 30)
temperatures_random[i_temp_30]

# At which positions are red roulette colors - save it to i_red
i_red <- which(roulette_colors == "red")
roulette_numbers[i_red]

## Play roulette
# set seed to 2023
set.seed(2023)
# randomly generate 10 roulette numbers (use sample function)
winning_numbers <- sample(roulette_numbers, 10, replace = TRUE)
# table(sample(roulette_numbers, 100, replace = TRUE))

# save their colors to winning_colors
winning_colors <- roulette_colors[winning_numbers + 1]
# calculate how many of each colors there were
table(winning_colors)
# Bonus: How many even numbers there were
sum((winning_numbers %% 2) == 0)
# Bonus: Print how many 0s there were
print(sum(winning_numbers == 0))

## Vector math -----
1:10 + 10
1:6 + 1:2

iris$Sepal.Length
iris$Sepal.Width
iris$Sepal.area <- iris$Sepal.Length * iris$Sepal.Width

# difference of Sepal length and the average sepal length
iris$Sepal.Length.MeanDiff <- iris$Sepal.Length - mean(iris$Sepal.Length) 


## Logical indexing -----

numbers <- seq(1:10)
numbers
odd_values <- as.logical(numbers %% 2)
numbers[odd_values]

set.seed(2023)
temperatures <- seq(10, 32, by = 0.2)
temperatures <- sample(temperatures)

i_above30 <- which(temperatures > 30)
temperatures[i_above30]
temperatures[which(temperatures > 30)]
temperatures[temperatures > 30]
