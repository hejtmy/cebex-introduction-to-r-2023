library(dplyr)

# load in Life expectancy data
df_life <- read.csv("data/Life Expectancy Data.csv")
df_life <- read.table("data/Life Expectancy Data.csv", sep = ",", 
                      header = TRUE, quote = "")
# Check unique countries in the data and fix the problem
unique(df_life$Country)

# output all the column names
colnames(df_life)

# look at the summary of the data
summary(df_life)
str(df_life)
glimpse(df_life)

# Check what is the average Life.expectancy per country
df_life %>%
  group_by(Country) %>%
  summarise(avg_life = mean(Life.expectancy, na.rm = TRUE)) %>%
# Order the result from the lowest to the highest average
  arrange(avg_life)

# Filter all data for only years 2000 and 2015
country_counts <- df_life %>%
  filter(Year == 2000 | Year == 2015) %>%
# See which countries appear twice in this filtered data (use function count())
  count(Country)
sum(country_counts$n != 2)

good_countries <- df_life %>%
  filter(Year == 2000 | Year == 2015) %>%
  # See which countries appear twice in this filtered data (use function count())
  count(Country) %>%
  filter(n == 2) %>%
  pull(Country)

# filter only for those countries where there are two recordings
df_life_good <- df_life %>%
  filter(Country %in% good_countries)

# Calculate difference for these countries in their life expectancy 
#   between the min and the max
df_life %>%
  filter(!is.na(Life.expectancy)) %>%
  group_by(Country) %>%
  summarise(diff = max(Life.expectancy) - min(Life.expectancy))

# Select Columns from Country to Alcohol and then from GDP to Schooling
select(df_life, Country:Alcohol, GDP:Schooling)

df_life %>%
  select(Country:Alcohol, GDP:Schooling)

# Select all columns except the Disease ones 
select(df_life, -c(Hepatitis.B, Measles, Polio, Diphtheria, HIV.AIDS))

starwars %>% select(homeworld, height, mass)
