library(ggplot2)
library(dplyr)

install.packages("ggplot2")

df_mpg <- mpg

## Summaries -----
head(df_mpg)
str(df_mpg)

?mpg

summary(df_mpg)

## MUTATION ------
df_mpg$cty_kml <- df_mpg$cty * 0.42514370
str(df_mpg)

## PLOT -------
plt <- ggplot(df_mpg, aes(manufacturer, cty_kml))
plt + geom_boxplot()

ggplot(df_mpg, aes(x = as.factor(cyl), cty_kml))+ geom_boxplot()

hist(df_mpg$cty_kml)
plot(df_mpg$hwy, df_mpg$cty_kml)

## ANOVA ------
aov(cty_kml ~ manufacturer, data = df_mpg)
summary(aov(cty_kml ~ manufacturer, data = df_mpg))

?aov
