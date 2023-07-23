set.seed(2022)
gender <- rep(c("male", "female"), 50)
id <- as.character(seq(1, 100))
age <- rnorm(100, mean = 35, sd = 5)
university_educated <- sample(c(TRUE, FALSE), 100, replace = TRUE) #RANDOM TRUE or FALSE 

data <- list(age, gender, id, university_educated)
names(data)
names(data) <- c("age", "gender", "id", "university_educated")
data <- list(age = age, 
             gender = gender, 
             id = id,
             university_educated = university_educated)

rm(age, gender, id, university_educated)

# average female age
mean(data$age[data$gender == "female"])

set.seed(2022)
df_data <- data.frame(age = rnorm(100, mean = 35, sd = 5), 
             gender = rep(c("male", "female"), 50), 
             id = as.character(seq(1, 100)),
             university_educated = sample(c(TRUE, FALSE), 100, replace = TRUE))

mean(df_data$age[df_data$gender == "female"])

df_broken_data <- data.frame(age = rnorm(50, mean = 35, sd = 5), 
                      gender = rep(c("male", "female"), 35), 
                      id = as.character(seq(1, 77)),
                      university_educated = sample(c(TRUE, FALSE), 
                                                   41, replace = TRUE))
# Checking data.frames
str(df_data)
head(df_data)
summary(df_data)

# Other datasets ------
?USArrests
summary(USArrests)

str(USArrests)
head(USArrests)

head(mpg)

rownames(USArrests)
colnames(USArrests)
names(USArrests)

USArrests$states <- row.names(USArrests)
str(USArrests)

USArrests$state[USArrests$UrbanPop == max(USArrests$UrbanPop)]

## Dataframe access -------

USArrests[c(1, 2)]
# data.frame[row_selection, column_selection]
USArrests[1, ]
USArrests[10, ]

USArrests[USArrests$UrbanPop == max(USArrests$UrbanPop),]
# get all states which start with A
USArrests[grepl("A", USArrests$states), ]

# get all state information (rows) in th top 10th percentile in Assault
USArrests[USArrests$Assault > quantile(USArrests$Assault, probs = 0.9), ]

head(USArrests)
USArrests[,1]
USArrests[,1:2]

USArrests[,"Murder"]
USArrests[,c("Murder", "states")]

USArrests$Murder
USArrests$M
USArrests[,c("M")]

USArrests[, "Murder"]
USArrests[, Murder]

var_name <- "Murder"
USArrests[, var_name]
