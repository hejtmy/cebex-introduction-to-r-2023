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
df_salary <- read.csv("data/Salary_Data_Based_country_and_race.csv")
## Explore the data and columns, fix any obvious problems
str(df_salary)

df_salary$Education.Level <- gsub(" Degree", "", df_salary$Education.Level)
df_salary$Education.Level <- gsub("p", "P", df_salary$Education.Level)

## Look at the numeric summaries of the dataset
summary(df_salary)

## Remove columns you will not need
df_salary <- select(df_salary, -X)
df_salary <- df_salary %>%
  filter(!is.na(Age), !is.na(Salary), !is.na(Years.of.Experience),
         Gender != "Other")

## Create new columns/variables
df_salary <- df_salary %>%
  mutate(salary_t = Salary/1000, 
         age_start_work = Age - Years.of.Experience)

# Label outlier
ggplot(df_salary, aes(Age)) + geom_histogram(binwidth = 1)
ggplot(df_salary, aes(Years.of.Experience)) + geom_histogram(binwidth = 1)
ggplot(df_salary, aes(salary_t)) + geom_histogram(binwidth = 10)

ggplot(df_salary, aes(salary_t, fill=Education.Level)) + geom_histogram(binwidth = 10)

## quantile
# calculate new versions of the variable
# high_grossing/fullfilling conditions

## Formulate questions - 3 

### For each question, investigate variables of interests, 
## Males make more money
ggplot(df_salary, aes(salary_t, fill=Gender)) + 
  geom_histogram(binwidth = 10)

ggplot(df_salary, aes(salary_t, fill=Gender)) + 
  geom_boxplot()

df_salary %>%
  group_by(Gender) %>%
  summarise(mean = mean(salary_t),
            n = n())
t.test(salary_t ~ Gender, data = df_salary)

## 
ggplot(df_salary, aes(Years.of.Experience, salary_t, color=Education.Level)) + 
  geom_point() +
  geom_smooth()

ggplot(df_salary, aes(Age, salary_t)) + 
  geom_point() +
  geom_smooth()

summary(lm(salary_t ~ Years.of.Experience, data = df_salary))

## 
unique(df_salary$Country)

ggplot(df_salary, aes(Years.of.Experience, salary_t, color=Gender)) + 
  geom_point() +
  geom_smooth() +
  facet_wrap(~Country)

## ANOVA
summary(aov(salary_t ~ Country, data = df_salary))

ggplot(df_salary, aes(Country, salary_t)) + geom_boxplot()

### what are their potential problems
## Mainly histograms, scatter plots ....

## Visualize data for your questions


