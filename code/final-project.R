## Kaggle, if you do not have anything else in mind
library(tidyr)
df_percapita <- read.csv("data/gdppercapita_us_inflation_adjusted.csv")
df_percapita <- pivot_longer(df_percapita, cols = starts_with("X"), names_to = "year",
                             values_to = "gdp")

df_percapita$year <- gsub("X", "", df_percapita$year)

df_test <- data.frame(amount_column = c("1k", "27.8k", "500", "10k", "42.2k", "120"))

# Custom function to convert values to numbers
convert_to_numeric <- function(value) {
  # Check if the value contains 'k' (for thousands)
  if (grepl("k$", value, ignore.case = TRUE)) {
    # Remove 'k' from the value and convert to numeric
    numeric_value <- as.numeric(sub("k$", "", value, ignore.case = TRUE)) * 1000
  } else {
    # Otherwise, just convert to numeric
    numeric_value <- as.numeric(value)
  }
  return(numeric_value)
}
df_test$amount_column <- sapply(df$amount_column, convert_to_numeric)
print(df_test)


df_percapita$gdp_fixed <- sapply(df_percapita$gdp, convert_to_numeric)
# Load your data
## Explore the data and columns, fix any obvious problems

## Look at the numeric summaries of the dataset

## Remove columns you will not need

## Create new columns/variables
# Label outlier
# calculate new versions of the variable
# high_grossing/fullfilling conditions

## Formulate questions - 3 

### For each question, investigate variables of interests, 
### what are their potential problems
## Mainly histograms, scatter plots ....

## Visualize data for your questions


