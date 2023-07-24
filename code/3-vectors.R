## variable naming and assignment
## participant who did not finish 
id_not_finished <- 45

# decision in experiment
decision_1 <- TRUE

# outcome in money gained
moneygain_1 <- 40

decision_2 <- FALSE
moneygain_2 <- 30

final <- TRUE

## Other examples ---
# 2_decision <- TRUE

decision-1 <- TRUE

## Reserved symbols
# $
# /, *, :, ^, @#$~~^&*{{}} (), ""!
# < > = 

## Data types ---- 
number <- 5
mean(5)

letter <- "A"
mean(letter)

summary(number)
summary(letter)

### Numeric ----
num_1 <- 5
num_2 <- 10
num_3 <- 15

num_deci <- 5.5

class(num_1)

num_1 + num_2
num_1 / num_3

### Character (string) -----

char_1 <- "hello"
char_2 <- "world"

# char_1 + char_2
paste(char_1, char_2)

text <- "I'm very skilled at R"
text_error <- "This is so called "drink""
text_fine <- "This is so called \"drink\""
text_fine <- 'This is so called "drink"'
text_fine

text_number <- "5"
text_number * 5

## Conversion ---
class(text_number)
text_number
as.numeric(text_number)

text_number + 50
as.numeric(text_number) + 50

## Logical value (boolean) ------
TRUE
FALSE
true
false

is_smoker <- TRUE

T
F

CAR <- "AUDI"
TRU <- "Passthrough"
TRUE <- "YES"

#### Logical comparisons
30 < 40
40 == 40
"hello" == "hello"
3 >= 3
3 > 3
3 <= 3
3 < 3
3 != 3
TRUE == T

T <- "YES"
TRUE == T
T <- TRUE

### Type conversions and checks -----

# character to logical
text
as.logical(text)
as.logical("hello")
as.logical("true")
as.logical("T")

# numeric to logical
as.logical(5)
as.logical(-1)
as.logical(-Inf)
as.logical(0)

# logical to character
as.character(TRUE)

# logical to numeric
as.numeric(TRUE)
as.numeric(FALSE)

### Implicit conversion
TRUE + 1
"hello" + 1

sum(c(TRUE, FALSE, TRUE))

## Data checks ----
is.numeric(5)
is.numeric("5")
is.logical(TRUE)
is.character(5)

## missing values ----
NA
NaN
NULL

num_1 <- NA
num_1 * 5

mean(c(num_1, num_2, num_3))

mean(c(NA, 5, 10, 15), na.rm = TRUE)
mean(c(NA, NA, NA, 15), na.rm = TRUE)
?mean

is.na(NA)
is.na(c(NA, 5, 10, NA))

## Lists (dictionary) -------
# name = value
person_1 <- list(name = "Lukas",
                 age = 30,
                 is_smoker = TRUE,
                 highest_education = "PhD")

reaction_1 <- 240
moneygain_1 <- 40
decision_1 <- TRUE
reaction_2 <- 250
moneygain_2 <- 43
decision_2 <- FALSE

# create two lists
trial_1 <- list(reaction = 240, moneygain = 40, decision = TRUE)
trial_2 <- list(reaction = 250, moneygain = 43, decision = FALSE)

trial_1$reaction
trial_2$moneygain

trial_1$gain_per_second <- trial_1$moneygain/trial_1$reaction
trial_1[["reaction"]]
trial_1[[2]]

## Data.frames ------
df_iris <- iris
class(df_iris)

df_iris$Petal.Length
df_iris[["Petal.Length"]]

sum(df_iris$Petal.Length > 4)
table(df_iris$Petal.Length > 4)
# what is the median of petal width
median(df_iris$Petal.Width)
# what is the maximum of sepal length
max(df_iris$Sepal.Length)

## Factors -----
class(df_iris$Species)
levels(df_iris$Species)
df_iris$Species
df_iris$char_species <- as.character(df_iris$Species)

df_iris$Species == "setosa"
