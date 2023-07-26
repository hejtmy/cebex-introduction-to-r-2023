library(dplyr)

df_life <- read.table("data/Life Expectancy Data.csv", 
                      sep = ",", header = TRUE, quote = "")

## Glimpse
glimpse(df_life)

## Select ----
df_life[,c("Country", "Year", "Status")]
select(df_life, Country, Year, Status)

select(df_life, -Population, -Schooling, -GDP)
select(df_life, -c(Population, Schooling, GDP))

select(df_life, Year, Country, Status)
df_life[, 1:7]
select(df_life, Country:Alcohol)
df_life_selected <- select(df_life, Country:Alcohol, Measles:HIV.AIDS, -infant.deaths)

head(select(df_life, starts_with("A")))
head(select(df_life, -starts_with("A")))

## Filter ----
df_life[df_life$Status == "Developing", ]
filter(df_life, Status == "Developing")

df_life[df_life$Status == "Developing", df_life$Year == 2015, ]
filter(df_life, Status == "Developing", Year == 2015)

filter(df_life, Adult.Mortality > mean(Adult.Mortality, na.rm=TRUE))

## Select Country and Life.expectancy of countries where BMI > 23 and Year is 2015
# Filter it
df_filtered <- filter(df_life, BMI > 50, Year == 2015)
# Select columns
select(df_filtered, Country, Life.expectancy)


## %>% ----------
# df_bmi_year_filtered_2015 <- filter(df_life, BMI > 50, Year == 2015)
# Select columns
#select(df_filtered, Country, Life.expectancy)

df_life %>%
  filter(BMI > 50, Year == 2015) %>%
  select(Country, Life.expectancy)

## Mutate -------

df_life$life_z <- (df_life$Life.expectancy - mean(df_life$Life.expectancy))/
  sd(df_life$Life.expectancy)

mutate(df_life, 
       life_z = (Life.expectancy - mean(Life.expectancy, na.rm = TRUE))/
         sd(Life.expectancy, na.rm = TRUE))

df_life %>%
  filter(!is.na(Life.expectancy)) %>%
  mutate(life_z = (Life.expectancy - mean(Life.expectancy))/
                  sd(Life.expectancy)) %>%
  filter(life_z > 2) %>%
  select(Country, Year)

## Summarise ----
df_life %>%
  filter(!is.na(Life.expectancy)) %>%
  summarise(mean_life = mean(Life.expectancy),
            max = max(Life.expectancy),
            min = min(Life.expectancy))

## Group by -----
df_life %>%
  filter(!is.na(Life.expectancy)) %>%
  group_by(Year) %>%
  summarise(mean = mean(Life.expectancy),
            max = max(Life.expectancy),
            min = min(Life.expectancy))

## Arrange -----

## Practice ------
# List all unique countries in the dataset
unique(df_life$Country)

# 1a. Choose 3 countries from the dataset
df_life %>%
  filter(Country == "Afghanistan" | Country == "Albania" | Country == "Algeria")

# 1b. Provide summaries of their Life.expectancy and GDP
# for years 2000, 2005, 2010, 2015
df_life %>%
  filter(Country %in% c("Afghanistan", "Albania", "Algeria"),
         Year %in% seq(2000, 2020, by = 5)) %>%
  select(Country, Year, Life.expectancy, GDP) %>%
  arrange(-GDP)


# 2a. Calculate difference between the minimum and maximum value of GPD for 
# each of the countries between years 2010 and 2015
df_life %>%
  filter(Country %in% c("Afghanistan", "Albania", "Algeria"),
         Year >= 2010, Year <= 2015) %>%
  group_by(Country) %>%
  summarise(difference = max(GDP) - min(GDP))
