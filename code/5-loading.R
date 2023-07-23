## Working directories -----
getwd()

## Absolute path
df_climbing <- read.table("C:\Users\guest1\Documents\CEBEX\introduction-to-r\data\climbing.csv")
"C:/Users/guest1/Documents/CEBEX/introduction-to-r"

df_climbing <- read.table("C:/Users/guest1/Documents/CEBEX/introduction-to-r/data/climbing.csv",
                          sep=";", header=TRUE)
df_climbing <- read.table("C:\\Users\\guest1\\Documents\\CEBEX\\introduction-to-r\\data\\climbing.csv")

## relative path 
df_climbing <- read.table("data/climbing.csv", sep=";", header=TRUE)
df_climbing <- read.table("data/climbing.csv", sep=";", header=TRUE)

## Url
df_climbing_url <- read.table("https://raw.githubusercontent.com/hejtmy/cebex-introduction-to-r-2022/main/data/climbing.csv",
                          sep=";", header=TRUE)

file.path("https://raw.githubusercontent.com",
          "hejtmy/cebex-introduction-to-r-2022",
          "main/data/climbing.csv")
paste("asdasd", 
      "asddasdasdaasd", 
      sep="", collapse="")

## Loading ------
example.sep <- read.table("data/loading-examples/example-sep.txt", sep=",")
example.sep <- read.csv("data/loading-examples/example-sep.txt", 
                        header=FALSE)

example.row <- read.table("data/loading-examples/example-row.txt", sep=";",
                          header=TRUE)
write.table(example.row, "data/loading-examples/example-row-saved.txt",
            row.names = FALSE)

example.error <- read.table("data/loading-examples/example-error.txt", sep=",",
                            header=TRUE, fill=TRUE)
example.error$height <- as.numeric(example.error$height)

example.error <- read.table("data/loading-examples/example-error.txt", sep=",",
                            header=TRUE, fill=TRUE, na.strings="missing")
example.dec <- read.table("data/loading-examples/example-dec.txt", sep=";",
                          header=FALSE, dec=",")
example.missing <- read.csv("data/loading-examples/example-missing.txt")
example.weird <- read.csv("data/loading-examples/example-weird-header.txt", skip=3)

#?how to load the xlsx

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

df_happiness[]
df_happiness$country[is.na(df_happiness$Region)]
df_happiness[is.na(df_happiness$Region), "country"]
df_happiness[is.na(df_happiness$Region), ]
