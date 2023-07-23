library(dplyr)

## Whitespace -------
num <- 10
num <-                    11

num<-12

num <- 10

head(base::letters, 10)
head(base::letters,            10)
head(base::letters,10)

head(base::letters,
     
10)
head(base::letters)


## Variables ------
5
num <- 5

letters <- 10
mpg <- 55
iris

letters


ggplot2::mpg
# bad
num = 7

num <-(
  5*10
  
  
  
)

"hello"
    
10 * 7
pi * pi * 5

## Capitalization -----

num <- 5
Num <- 7

Name <- "Lukas"

name

## Naming variables -------

n <- 8
name1 <- "Lukas"
name2 <- "Thomas"

data_frame_of_my_last_thesis_project
df_thesis
df_proccesed
df_data_wo_outliers

(week * 52/ 7 * day) + year * 2

day_one
DayOne
dayoneafteryesterday

number.one <- 1

# your age
age_my <- 32
age_mother <- 57
age_father <- 64

## Data types -------
?toupper
toupper(5)

class(age_father)
class(name1)

toupper(name1)

name1 + 5
age_my + 5

mpg
base::letters

class()

### logical 
TRUE
T

# set TRUE to be 10
TRUE <- 10
# set T to be 10
T <- 10

T
FALSE
F

## Math operations
# + - / * 

2 ^ 4
5 %% 4
6 %% 4

# day+week <- 7

### Lists ------
me_age <- 32
me_name <- "Lukas"

me <- list(name = "Lukas",
           age = 32,
           gender = "male",
           education = TRUE)

random_guy <- list(name = "John",
                   age = NA,
                   gender = "unknown",
                   education = TRUE)

# is me in reatirement???
me$age > 65
random_guy$gender == "male"


## Comparing operations -----

TRUE & TRUE
TRUE & FALSE
FALSE & FALSE

TRUE | TRUE
TRUE | FALSE
FALSE | FALSE


# 5 < 10
# <=
# >=
# >

# age_father = 64
  
age_father == 64
age_father != 64

# retirement age
# determine who is in retirement age
age_retirement <- 60

age_father >= age_retirement
age_my >= age_retirement
age_mother >= age_retirement

# hardcoding values - NEVER do this
# DRY principles - DO not REPEAT YOURSELF
age_father >= 65
age_my >= 65
age_mother >= 65


## TYPE conversions -------
age_father - age_my

age_father - TRUE
age_father > TRUE
age_father - name1

FALSE + TRUE + TRUE

toupper(5)

as.numeric()
test_results <- c("5", "10", "1")
as.numeric(test_results)

as.character()
as.logical()

# id <- sequence of ids from 10 to 31
id <- seq(from = 10, to = 31)
id <- as.character(id)

is_smoking <- c(0,1,0,1,0,0,1)

## Missing variables -------
NA
NaN

NULL

Name <- NULL
Name


## Checking for types -------
class(Name)
class(age_my)

is.numeric(age_my)
is.character(age_my)

test_results <- NA
# check if results are NA ...?
is.na(test_results)

## Comments -------
# Created by Lukas Hejtmanek for Cebex
# This filters outliers out of the datase

### Numbers ----
#### Subchapters on numbers  -----
#' This is gonna be a long comment
#' and this comment continues

