# Create a dataframe calls df_thesis

set.seed(1000)
## Creation -----
df_thesis <- data.frame(
# id 1 - 50 randomly ordered
  id = sample(50),
# random gender (male, female, other? ...)
  gender = sample(c("male", "female"), 50, TRUE),
# altruism_score - m10 sd2
  altruism_score = rnorm(50, 10, 2),
# test_results - m115 sd35
  test_results = rnorm(50, 115, 35),
# avg_test_speed - m11 sd3
  avg_test_speed = rnorm(50, 11, 3)
)

## Edits ------
# make cure the altruism score and test results is whole numbers
df_thesis$altruism_score <- round(df_thesis$altruism_score)
df_thesis$test_results <- round(df_thesis$test_results)

# remove id 15, 16 and 44 
df_thesis <- df_thesis[df_thesis$id != 15,]
df_thesis <- df_thesis[df_thesis$id != 16,]
df_thesis <- df_thesis[df_thesis$id != 44,]

1 %in% c(1,2,3)
10 %in% c(1,2,3)
df_thesis <- df_thesis[!(df_thesis$id %in% c(15,16,44)),]

# mark any average speed less than 7 to be NA, or more than 16 to be NA
df_thesis$avg_test_speed[df_thesis$avg_test_speed > 16 | 
                           df_thesis$avg_test_speed < 7] <- NA

# see who has more than 3sd away from the mean in test speed tests results 
# and altruism score - create a column for each (speed_extreme etc. ...)
test_top <- mean(df_thesis$test_results) + sd(df_thesis$test_results) * 3
test_bottom <- mean(df_thesis$test_results) - sd(df_thesis$test_results) * 3

df_thesis$test_results_extreme <- df_thesis$test_results < test_bottom | 
  df_thesis$test_results > test_top

df_thesis$test_results_extreme <- 
  abs((mean(df_thesis$test_results) - df_thesis$test_results) / 
        sd(df_thesis$test_results)) > 3

df_thesis$altruism_score_extreme <- 
  abs((mean(df_thesis$altruism_score) - df_thesis$altruism_score) / 
        sd(df_thesis$altruism_score)) > 3

df_thesis$avg_test_speed_extreme <- 
  abs((mean(df_thesis$avg_test_speed, na.rm = TRUE) - df_thesis$avg_test_speed) / 
        sd(df_thesis$avg_test_speed, na.rm = TRUE)) > 3

# create a column is_outlier - it is TRUE or FALSE for each person 
#   their results in speed_extreme, altrusim_extreme etc....
df_thesis$is_outlier <- any(df_thesis$test_results_extreme,
                            df_thesis$altruism_score_extreme,
                            df_thesis$avg_test_speed_extreme,
                            na.rm = TRUE)

# mark NA avg_speed as TRUE in is outlier
df_thesis$is_outlier[is.na(df_thesis$avg_test_speed)] <- TRUE

## Selection ----
#' 1. What is the average altruism score for each gender?
mean(df_thesis$altruism_score[df_thesis$gender == "male"])
mean(df_thesis$altruism_score[df_thesis$gender == "female"])

var_name <- "altruism_score"
mean(df_thesis[df_thesis$gender == "male", var_name])
var_name <- "test_results"
mean(df_thesis[df_thesis$gender == "male", var_name])

mean_and_sd <- function(data, var_name){
  print(mean(data[, var_name]))
  print(sd(data[, var_name]))
}
mean_and_sd(df_thesis, "test_results")
mean_and_sd(df_thesis, "altruism_score")

#' 2. What are the test results of the top fastest 25 percent?
quant_75_speed <- quantile(df_thesis$avg_test_speed, 0.75, na.rm = TRUE)

df_thesis[df_thesis$avg_test_speed > quant_75_speed, "test_results"]

#' 3. How does the correlation between altruism and test result
#'    changes with and without outliers?
cor(df_thesis$altruism_score, df_thesis$test_results)

cor(df_thesis$altruism_score[!df_thesis$is_outlier],
    df_thesis$test_results[!df_thesis$is_outlier])
