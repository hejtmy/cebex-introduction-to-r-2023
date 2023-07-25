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
