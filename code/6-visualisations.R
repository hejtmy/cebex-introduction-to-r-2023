source("code/loading-happiness.R")

df_happiness_2017 <- df_happiness[df_happiness$year == 2017,]
df_happiness_2018 <- df_happiness[df_happiness$year == 2018,]
## histograms ------
hist(df_happiness_2017$GDP)

### N breaks
hist(df_happiness_2017$GDP, breaks = 20)

### predefined breaks
hist(df_happiness_2017$GDP, breaks = c(0,0.5,1,1.5,2))

hist(df_happiness_2017$GDP, breaks = c(min(df_happiness_2017$GDP),
                                       0.5,1,1.5,max(df_happiness_2017$GDP)))
### Coloring
hist(df_happiness_2017$GDP, breaks = 20,
     col = "violet")
hist(df_happiness_2017$GDP, breaks = 20,
     col = "#5924e1")

hist(df_happiness_2017$GDP, breaks = 20,
     col = "#5924e1", border = "white")

### Labeling
hist(df_happiness_2017$GDP, breaks = 20,
     col = "#5924e1", border = "white", 
     main = "GDP of countries in year 2017",
     xlab = "GDP (per capita)")

hist(df_happiness_2017$GDP, breaks = 20,
     col = "#5924e1", border = "white", 
     main = "GDP of countries in year 2017",
     xlab = "GDP (per capita)", xlim = c(0,2),
     ylim = c(0,20))

### GGplot way
library(ggplot2)
ggplot(df_happiness_2017, aes(x=GDP)) +
  geom_histogram()

ggplot(df_happiness, aes(x=GDP, fill=as.character(year))) +
  geom_histogram()

ggplot(df_happiness, aes(x=GDP, fill=as.character(year))) +
  geom_histogram(binwidth = 0.5)
ggplot(df_happiness, aes(x=GDP, fill=as.character(year))) +
  geom_histogram(bins = 20)

## Boxplots -----
boxplot(df_happiness_2017$GDP, df_happiness_2018$GDP,
        names = c(2017, 2018))

boxplot(df_happiness_2017$GDP, df_happiness_2018$GDP,
        names = c(2017, 2018), 
        xlab = "Year", ylab = "GDP",
        main = "GDP of countries in individual years",
        col = c("grey", "#5924e1"))

boxplot(df_happiness$GDP ~ df_happiness$year)

boxplot(df_happiness$GDP ~ df_happiness$Region)

ggplot(df_happiness, aes(x=Region,y=GDP, fill=as.character(year))) +
  geom_boxplot() +
  coord_flip()

## Scatter plots -------
plot(df_happiness_2017$GDP, df_happiness_2017$score,
     main = "Plot of happiness score in relation to country GDP in 2017",
     xlab = "GDP", ylab = "Happiness score")

ggplot(df_happiness_2017, aes(x = GDP, y = score)) +
  geom_point()

ggplot(df_happiness, aes(x = GDP, y = score, color = as.character(year))) +
  geom_point()

ggplot(df_happiness, aes(x = GDP, y = score,color = as.character(year))) +
  geom_point() +
  geom_smooth()

ggplot(df_happiness, aes(x = GDP, y = score,
                         color = as.character(year))) +
  geom_point() +
  geom_smooth(method = "lm")

pairs(df_happiness)

df_test <- data.frame(value1 = rnorm(100,10,5),
                      value2 = rnorm(100,15,5),
                      value3 = rnorm(100,11,5))

pairs(df_happiness[, c("GDP", "score", "freedom", "health_expectancy",
                       "generosity","corruption")])
