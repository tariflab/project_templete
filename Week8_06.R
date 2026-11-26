#load required package
library(tidyverse)
library(gtsummary)
library(gt)

#load the data
raw_data <- read.csv("data/raw/pulse_data.csv")

#process your data
#check the data structures
glimpse(raw_data)

#convert char to factor 
raw_data$Gender <- as.factor(raw_data$Gender)
raw_data$Smokes <- as.factor(raw_data$Smokes)
raw_data$Alcohol <- as.factor(raw_data$Alcohol)
raw_data$Exercise <- as.factor(raw_data$Exercise)
raw_data$Ran <- as.factor(raw_data$Ran)

summary(raw_data)


#check missing values
is.na(raw_data)
sum(is.na(raw_data))
colSums(is.na(raw_data))

#impute missing values with mean / meadian
clean_data <- raw_data |> 
  mutate(Height = ifelse(
    is.na(Height),
    mean(Height, na.rm = T),
    Height
  ))

#check missing values
colSums(is.na(clean_data))

#duplicated rows
duplicated(clean_data)
sum(duplicated(clean_data))




# Explore the clean data
write.csv(clean_data, "data/processed/pulse_data_clean.csv" , row.names = FALSE)
#import clean data
data <- read.csv("data/processed/pulse_data_clean.csv")



#statistical summery
#1. Numeric Summary
#2. Graphical summary (data visualization)



#Numerical Summary
#Numeric Variables
#Center (mean, median, mode)
#Variation (sd, var)
#Center +/- variation

#min
min(data$Age)

#max
max(data$Age)

# range
max(data$Age) - min(data$Age)

#mean
mean(data$Age)


#sd
sd(data$Age)

#statistical presentation: Mean +/- sd

#median
median(data$Age)

#quantile (25% = Q1)
#About 25% of observations (sample) have an "Your variable" <= value
quantile(data$Age, .25)
#Interpretation: About 25% of observations (sample) have an Age <= 18.

#quantile (50% = Q2)
#About 50% of observations (sample) have an "Your variable" <= value
quantile(data$Age, .50)
#Interpretation: About 50% of observations (sample) have an Age <= 19.

#quantile (75% = Q3)
#About 75% of observations (sample) have an "Your variable" <= value
quantile(data$Age, .75)
#Interpretation: About 75% of observations (sample) have an Age <= 20.

#statistical Interpretation
#if quantile(variable, 0.25) 25% <= Q1
#if quantile(variable, 0.50) 50% <= Q2
#if quantile(variable, 0.75) 75% <= Q3

#Median-এর চারপাশে থাকা মাঝখানের ৫০% ডেটা কতটুকু জায়গা জুড়ে ছড়িয়ে আছে (spread)—তা মাপার জন্যই IQR বের করা হয়।
#IQR = Q3 - Q1
quantile(data$Age, .75) - quantile(data$Age, .25)  #2

#statistical presentatin: Median (IQR)


#mean sensative to ouliers
# median is not sensative to outliers(extreve value)

 
#  in summary Numeric Analysis 
# 1. min, max, range
# 2. mean, sd
# 3. median, IQR
# 4. fivenum summary : min, max, mean, q1, q2, q3
fivenum(data$Age)





## categorical
#1. frequency (counts)
table(data$Gender)

#2. prcentage (%)
prop.table(table(data$Gender))
prop.table(table(data$Gender)) * 100

#Cross-tabulation
#দুটি আলাদা কলাম বা ভেরিয়েবলকে একসাথে মিলিয়ে দেখার জন্য এটি ব্য
#বহৃত হয়—যেমন, কোন লিঙ্গের (Gender) মধ্যে কোন বয়সের (Age) কতজ
#ন মানুষ আছে, তা একটি ছক বা টেবিল আকারে গণনা করে বের করা।
table(data$Gender, data$Age)
table(data$Gender, data$Exercise)




# this discussion above is about Descriptive Tables



