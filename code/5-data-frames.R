df_arrests <- USArrests
str(df_arrests)
head(df_arrests)
colnames(df_arrests)
rownames(df_arrests)

## Get me the mean Murder rate in the US
mean(df_arrests$Murder)

## ACCESSING data frames -----
## Colum selection
df_arrests$Murder
df_arrests$UrbanPop

df_arrests[["Murder"]]
df_arrests[["M"]]
df_arrests[[1]]

# DATA.FRAME[rows, columns]
df_arrests[, "Murder"]
df_arrests[, 1]
df_arrests[, 1]

## Row selection ----
df_arrests["Alabama", ]
df_arrests[1, ]

## Cell selection ---
df_arrests[1, 1]
df_arrests[1, 2]
df_arrests["Wisconsin", "Murder"]

## Select Murder rate and Urban population for California and New York
# 2 rows and two columns
df_arrests[c("California", "New York"), c("Murder", "UrbanPop")]

df_arrests[1:15, 1:3]
df_arrests[seq(1, nrow(df_arrests), by = 2), c(1,3)]

## Data filtering ----
df_arrests$UrbanPop >= 50
df_arrests[df_arrests$UrbanPop >= 50, ]

# only select states with above average murder rate
df_arrests[df_arrests$Murder > mean(df_arrests$Murder), ]

# what is the mean Urban population of states with above median assault rate?
mean(df_arrests[df_arrests$Assault > median(df_arrests$Assault), "UrbanPop"])

### Compound filtering -----

# AND &
df_arrests[df_arrests$Murder > mean(df_arrests$Murder) & 
             df_arrests$Assault > mean(df_arrests$Assault), ]

# OR |
df_arrests[df_arrests$Murder > mean(df_arrests$Murder) |
             df_arrests$Assault > mean(df_arrests$Assault), ]

# find out states where either murder rate and assault are in the top 10 percent
df_arrests[df_arrests$Murder > quantile(df_arrests$Murder, probs = 0.9) |
             df_arrests$Assault > quantile(df_arrests$Assault, probs = 0.9), ]

# Do you think there is more violence in cities?
median(df_arrests[df_arrests$Murder > quantile(df_arrests$Murder, probs = 0.9) | 
                    df_arrests$Assault > quantile(df_arrests$Assault, probs = 0.9), "UrbanPop"])

median(df_arrests[df_arrests$Murder < quantile(df_arrests$Murder, probs = 0.1) |
                    df_arrests$Assault < quantile(df_arrests$Assault, probs = 0.1), "UrbanPop"])

## Mutations -------
df_arrests[["Rape"]] <- NULL
df_arrests[-c(1:49),]
df_arrests[-50, ]

df_arrests[rownames(df_arrests) != "Wyoming", ]
df_arrests_cities <- df_arrests[df_arrests$UrbanPop > 50, ]

df_arrests$MurderPerMillion <- df_arrests$Murder * 10

df_arrests$UrbanArea <- TRUE
df_arrests$UrbanArea[df_arrests$UrbanPop < 65] <- FALSE

## Data frame practice -----
# https://github.com/hejtmy/cebex-introduction-to-r-2023

set.seed(1000)
df_thesis <- data.frame(
  # column id (random sample out of 50)
  id = sample(50),
  # gender ("female", "male"), random 50 values
  gender = sample(c("female", "male"), 50, replace = TRUE),
  # altruism_score (random normal distribution mean = 50, sd = 10)
  altruism_score = rnorm(50, mean = 50, sd = 10),
  # test_results (random normal distribution mean 115, sd = 35)
  test_results = rnorm(50, mean = 115, sd = 35),
  # test time (rnorm mean = 11, sd = 3)
  test_time = rnorm(50, mean = 11, sd = 3)
)
summary(df_thesis)

# test results and altruism can only be whole numbers. Round them
df_thesis$test_results <- round(df_thesis$test_results)
df_thesis$altruism_score <- round(df_thesis$altruism_score)

# remove ID 15, 16 and 44 who did not consent
str(df_thesis[df_thesis$id != c(15, 16, 44), ])
df_thesis <- df_thesis[df_thesis$id != 15, ]
6 %in% 1:5
"Anna" %in% c("Martin", "Lukas")
df_thesis <- df_thesis[!(df_thesis$id %in% c(15, 16, 44)), ]

# mark any test time above 16 minutes or below 7 minutes as NA value
df_thesis$test_time[df_thesis$test_time < 7] <- NA
df_thesis$test_time[df_thesis$test_time > 16] <- NA

df_thesis$test_time[df_thesis$test_time < 7 |
                      df_thesis$test_time > 16] <- NA

# calculate standard Z-score for the test results and save to 
#   the "test_z" column
df_thesis$test_z <- (df_thesis$test_results - mean(df_thesis$test_results))/
  sd(df_thesis$test_results)
df_thesis$test_z_scale <- scale(df_thesis$test_results)[,1]

# remove people scoring more or less then 3SD away from the mean
df_thesis[df_thesis$test_z > -3 & df_thesis$test_z < 3, ]
# mark outliers
df_thesis$test_outlier <- abs(df_thesis$test_z) > 3
# only keep not outliers
df_thesis <- df_thesis[!df_thesis$test_outlier, ]

# View(df_thesis)
# create is_outlier column (TRUE or FALSE) for people with altruism 
#   in the top 10 or bottom 10 percent
top_90_altruism <- quantile(df_thesis$altruism_score, 0.9)
bottom_10_altruism <- quantile(df_thesis$altruism_score, 0.1)

df_thesis$is_outlier <- df_thesis$altruism_score > top_90_altruism | 
  df_thesis$altruism_score < bottom_10_altruism

## Calculation
# What is the average test score for men and for women
mean(df_thesis$test_results[df_thesis$gender == "male"])
mean(df_thesis[df_thesis$gender == "male", "test_results"])
mean(df_thesis[df_thesis$gender == "female", "test_results"])

# what is the average altruism for people finishing faster than average
df_thesis_withtime <- df_thesis[!is.na(df_thesis$test_time),]
mean(df_thesis_withtime[df_thesis_withtime$test_time > mean(df_thesis_withtime$test_time), 
  "altruism_score"])

# I belive this is incorrect
# mean(df_thesis[na.omit(df_thesis$test_time) > mean(df_thesis$test_time, na.rm = TRUE), 
#              "altruism_score"])
# what is the correlation between altriusm score and test results?

cor(df_thesis$altruism_score, df_thesis$test_results)
cor.test(df_thesis$altruism_score, df_thesis$test_results)
