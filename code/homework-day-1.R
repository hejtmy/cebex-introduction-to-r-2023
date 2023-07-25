# 1. Create a vector of years between 1924 to 2020
years <- seq(1924, 2023)

# 2. Create a vector of chinese zodiac for each year, beginning with rat, 
# repeating 10 times (120 years).
zodiac <- c("Rat", "Ox", "Tiger", "Rabbit", "Dragon", "Snake", 
            "Horse", "Goat", "Monkey", "Rooster", "Dog", "Pig")
years_zodiac <- rep_len(zodiac, length.out = length(years))

# 3. Shorten the zodiac vector so it is only of the same length as the years vector. 
# (Select only certain values)
years_zodiac <- years_zodiac[1:length(years)]

years_zodiac <- rep()
# 4. What years are “horse” years?
years[which(years_zodiac == "Horse")]
years[years_zodiac == "Horse"]

# 5. What sign was year 1987?
years_zodiac[which(years == 1987)]

# 6. What is the sum of years for the “rooster”?
sum(years[which(years_zodiac == "Rooster")])
sum(years[years_zodiac == "Rooster"])

# 7. What is the median year for the “dragon”
median(years[which(years_zodiac == "Dragon")])
median(years[years_zodiac == "Dragon"])

# 8. What is the 3rd_year of a goat?
goat_years <- years[which(years_zodiac == "Goat")]
goat_years <- years[years_zodiac == "Goat"]
goat_years[3]
rm(goat_years)

(years[which(years_zodiac == "Goat")])[3]
