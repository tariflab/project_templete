#load packeges in R studio
library(tidyverse)

#import data 
 data <- read.csv("data/raw/pulse_data.csv")

 
#data exploration 
 # 1. display first few rows 
 head(data)
head (data, n = 10) 

#2. display last few rows
tail(data)
tail(data , n = 10)

#3. sampling
sample_n(data, 10)
sample_data <- sample_n(data, 30) # eita mane koto manusher data nite chan
sampled_frac <- sample_frac(data, .20) # ekhane % er maddome random sampling kora hoi

#4. data structure
glimpse(data)

#5. access columns
data$Gender


#6. if categorical in char: convert it to factor
data$Gender <- as.factor(data$Gender)
data$Smokes <- as.factor(data$Smokes)
data$Alcohol <- as.factor(data$Alcohol)
data$ Exercise <- as.factor(data$ Exercise)
data$Ran <- as.factor(data$Ran)

#7. summery stat
summary(data)

#8. data manipulation

#1. desired column selection 
# select sigle columns using column name
select(data, Age)
# select multiple data using column name
select(data, Height, Weight, Gender)
#select column using column number 
select(data, 1)
#select multiple column using column number 
select(data, 1, 3, 5)
select(data, c(1, 3, 5))
#select column using range
select(data, 1:5 , 7)
#selct colum using start_with() function
select(data, starts_with("A"))
#selct colum using ends_with() function
select(data, ends_with("e"))


#2. filter rows (< ,> , <=, ==, AND,OR )
filter(data, Age > 18)
filter(data, Age < 18)
filter(data, Age => 18)
filter(data, Age <= 18)
filter(data, Smokes == "Yes")
filter(data, Age > 18 & Smokes == "Yes" )
filter(data, Age > 18 | Smokes == "Yes" )


#3. new variable (mutate)
mutate(data, Age_Group = ifelse(Age > 18, "Adult", 'Child'))


#4. rename column
data <- rename(data, smoking_status = Smokes)

#Select and filter  
selected_data <- select(data, Height , Age, Gender, Height , Weight)
filter(selected_data, Age > 18)
#steps
#1. selected columns from data ('Age, Gender, Height, Weight)
#2. create new data variable selected_data
#3. filter on selected_data

#to make this easy we use pipe operator |>
#it is clean and foraml use
data |> 
  select(Age, Gender, Height, Weight) |> 
  filter(Age > 18)

#9. grouping data
data |>
  group_by(Gender) |>
  summarise(mean_age = mean(Age), sd_age = sd(Age))




