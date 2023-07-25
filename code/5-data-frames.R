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

# remove ID 15, 16 and 44 who did not consent
# mark any test speed above 16 minutes or below 7 minutes as NA value
# calculate standard Z-score for the test results and save to the "test_z" column
# remove people scoring more or less then 3SD away from the mean
# create is_outlier column (TRUE or FALSE) for people with altruism 
#   in the top 10 or bottom 10 percent

## Calculation
# What is the average test score for men and for women
# what is the average altruism for people finishing faster than average
# what is the corelation between altriusm score and test results?


