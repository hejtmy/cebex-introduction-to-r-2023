age <- c(31, 34, 35, 61, 40)
length(age)

length(10)

age + 10

names <- c("Lukas", "Vojta", "Dominik")
names <- c("Lukas, Vojta, Dominik")
names <- c("Lukas", "Vojta", "Dominik")
names <- c(names, "Monique")

c(names, names)
rep(names, 2)

names_and_ages <- c(names, age)

mean(age)
range(age)

mean(names)

c(age, TRUE)
c(as.logical(age), TRUE)

c(as.character(TRUE), names)

# gender = male female male female - 100
# id = sequence of 1 - 100 - characters
# age = 100, normal distribution with mean = 35, sd 5
# rnorm
temp <- c("male", "female")
gender <- rep(temp, 50)
rm(temp)

gender <- c("male", "female")
gender <- rep(gender, 50)

gender <- rep(c("male", "female"), 50)
id <- as.character(seq(1, 100))
age <- rnorm(100, mean = 35, sd = 5)
university_educated <- sample(rep(c(TRUE, FALSE), 50), 100) #RANDOM TRUE or FALSE
university_educated <- sample(c(TRUE, FALSE), 100, replace = TRUE) #RANDOM TRUE or FALSE 
table(university_educated)
?sample
mean(age)

## Seeding -----
set.seed(2022)
age <- rnorm(100, mean = 35, sd = 5)
university_educated <- sample(c(TRUE, FALSE), 100, replace = TRUE) #RANDOM TRUE or FALSE 
table(university_educated)
mean(age)

# roulette numbers 0 - 36
roulette_numbers <- seq(0,36)
# roulette colors green (1x) black red (18x)
roulette_colors <- c("black", "red")
roulette_colors <- c("green", rep(roulette_colors, 18))

## Vector access ----
summary(age)
table(roulette_colors)

age[1]
age[-1]
age[100]

n_age <- length(age)
age[n_age]
age[length(age)]

age[1:5]
age[seq(1,5)]
head(age,5)

# all odd positions
age[seq(1,100,2)]

age[200]

## Playing roulette -----
set.seed(2022)
winning_numbers <- sample(roulette_numbers, 5, replace = TRUE)
winning_numbers <- sample(roulette_numbers, 5, replace = TRUE)
winning_numbers <- sample(roulette_numbers, 5, replace = TRUE)
winning_numbers + 1 
roulette_colors[winning_numbers + 1]
roulette_colors[sample(roulette_numbers, 5, replace = TRUE) + 1]

## Comparisons ----
i_female <- which(gender == "female")
mean(age[i_female])
i_male <- which(gender == "male")

t.test(age[i_female], age[i_male])

## LOGICAL INDEXING -----
numbers <- c(1,0,1,0)
v_logical <- c(TRUE, FALSE, TRUE, TRUE)
numbers[v_logical]

numbers == 1
numbers[numbers == 1]
rm(numbers, v_logical)

gender == "female"
age[gender == "female"]

# all black numbers

roulette_numbers[roulette_colors == "black"]
# mistake exmaple index too long
roulette_colors <- c("black", "red")
roulette_colors <- c("green", rep(roulette_colors, 28))
roulette_numbers[roulette_colors == "black"]
roulette_colors == "black"

# mistake exmaple index too short
roulette_colors[TRUE]
roulette_colors[c(TRUE, FALSE)]

# gender of all educated people
gender[university_educated]
table(gender[university_educated])

# education of all people above 38
university_educated[age > 38]
table(university_educated[age > 38])
# gender of all people under 33
gender[age <= 33]
table(gender[age <= 33])

!c(TRUE, FALSE)
age[!(gender == "female")]
age[gender != "female"]

age[!i_female]
!i_female

### Reassignment -----
numbers <- c(1,0,1,0,1,0)
numbers[1]
numbers[1] <- 0
numbers

age_old <- age > 45
hist(age)

age_update <- age
age_update[age_update > 45] <- NA
age_update

## Vector operations -------
length(age)
head(roulette_numbers, 10)
tail(roulette_numbers, 5)
rev(roulette_numbers)

unique(gender)
unique(round(age, 1))

table(round(age))

### Numeric operations -----
round(age, 1)

sort(unique(round(age, 1)))
mean(age)
median
sd
mode

log(age)
log10(age)
abs(age)

quantile(age)
quantile(age, c(0.1,0.9))

### Character operations ------

continents <- c("north america", "south america", 
                "europe", "middle america")
grep("america", continents)
grepl("america", continents)

continents <- c("north America", "South america", 
                "europe", "Middle AMERICA")

grepl("AMERICA", toupper(continents))
