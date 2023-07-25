# https://github.com/hejtmy/cebex-introduction-to-r-2023/
# download it as zip
# extract the data folder
# place the data folder inside your project

# Paths -----
## Absolute path -----
files <- "C:/Users/Lukas/files/myfile.csv" # not good, changes every time

## Relative path -----
getwd() #get working directory

files <- "data/loading-examples/example-row.txt"

# Loading data ------
?read.table
df_table <- read.table(file = "data/loading-examples/example-row.txt", 
                       header=TRUE, sep=";")

"data/loading-examples/example-row.txt"
"data/loading-examples/example-row.txt"
df_table <- read.csv("data/loading-examples/example-row.txt", sep=";")

"../"

# example no header
df_table <- read.table("data/loading-examples/example-no-header.txt", sep = ";")
colnames(df_table) <- c("id", "color", "gender", "height", "salary", "hours_slept")

# example weird header
library(readr)
example_weird_header <- read_csv("data/loading-examples/example-weird-header.txt", 
                                 skip = 3)
df_weird_header <- read.table("data/loading-examples/example-weird-header.txt", 
                                  header=TRUE, sep=",", skip = 3)
?read.table

# example sep
df_table <- read.table("data/loading-examples/example-sep.txt", sep=",", 
                       header = FALSE)
# example dec
df_table <- read.table("data/loading-examples/example-dec.txt", sep=";", 
                       header = FALSE, dec=",")
# exmaple error
df_table <- read.table("data/loading-examples/example-error.txt", sep=",", 
                       header = TRUE)
example.error <- read.csv("data/loading-examples/example-error.txt")

# example missing
df_table <- read.table("data/loading-examples/example-missing.txt",
                       header=TRUE, sep=",")
i_nas <- which(is.na(as.numeric(df_table$height)))
df_table$height[i_nas]

df_table <- read.table("data/loading-examples/example-missing.txt",
                       header=TRUE, sep=",", na.strings = "missing")

### Excel ------
library(readxl)
data <- read_excel("data/loading-examples/data.xlsx", 
                   sheet = "Sheet2")
?install.packages
#install.packages("readxl")


## Data saving -----
write.table(df_table, file = "table-output-test.csv", quote = TRUE, sep = ";",
            na = "", row.names = FALSE)
write.csv(df_table, file = "table-output-test-csv.csv")

save(data, example.error, file = "temporary.RData")
load("temporary.RData")
