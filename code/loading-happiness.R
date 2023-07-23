# Loading world happiness -----
df_2016 <- read.table("data/world-happinness/individual-years/2016.csv",
                      sep = ",", header = TRUE)
df_2017 <- read.table("data/world-happinness/individual-years/2017.csv",
                      sep = ",", header = TRUE)
df_2018 <- read.table("data/world-happinness/individual-years/2018.csv",
                      sep = ",", header = TRUE, na.strings="N/A")

colnames(df_2018) <- c("rank", "country", "score", "GDP", "social_support",
                       "health_expectancy", "freedom", "generosity", "corruption")
df_2017[, c("Whisker.high", "Whisker.low", "Dystopia.Residual")] <- NULL
colnames(df_2017) <- c("country", "rank", "score", "GDP", "social_support",
                       "health_expectancy", "freedom", "generosity", "corruption")

## Combining datasets ------
df_2018$year <- 2018
df_2017$year <- 2017
df_merged <- rbind(df_2017, df_2018)

df_country_regions <- read.csv("data/world-happinness/world-happiness-country-regions.csv")

### Merging
df_happiness <- merge(df_merged, df_country_regions, 
                      by.x = "country", by.y = "Country",
                      all.x = TRUE)

rm(df_2016, df_2017, df_2018, df_country_regions, df_merged)
