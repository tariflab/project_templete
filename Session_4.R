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
