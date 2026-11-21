#load package
library(tidyverse)

#check built in data set
data()
View(airquality)
BOD
CO2
# load built in data set
data("airquality")
# dataset dimension
dim(airquality)

# name of column
names(airquality)
# to see data structure 
glimpse(airquality)

#summery statistics
summary(airquality)

#problem with missing value
mean(airquality$Temp)
mean(airquality$Ozone)

#Find missing values (if NA = True, if not tahole false)
is.na(airquality)
#shows the number of missing values
sum(is.na(airquality))
#find missing values per column
colSums(is.na(airquality))

#Find rows with no missing values
airquality[complete.cases(airquality), ]
#Find rows containing missing values
airquality[!complete.cases(airquality), ]
#missing valu kon kon number row te nai
which(complete.cases(airquality),)
#missing valu kon kon number row te ace
which(!complete.cases(airquality),)

#remove rows containing NA
airquality_clean <- na.omit(airquality)
sum(is.na(airquality_clean))



# how to deal with missing values (clean data)
#1. remove missing value
mean(airquality$Ozone, na.rm = T)
#2.(imputation) if numeric value than fill missing value with center (mean, median)
airquality_clean2  <- airquality |> 
  mutate(Ozone = ifelse(
    is.na(Ozone),
    mean(Ozone, na.rm = T),
    Ozone
  )) |>
  mutate(Solar.R = ifelse(
    is.na(Solar.R),
    mean(Solar.R, na.rm = T),
    Solar.R
  ))

mean(airquality_clean$Ozone)

#export
write.csv(
  airquality_clean2,
  "data/processed/airquality_clean2.csv",
  row.names = FALSE
)

# cbind() data frame (row must be similar)
df1 <- data.frame(
  ID = 1:3,
  Name= c("A","B","C")
)
df2 <- data.frame(
  Age = c(20, 30, 40),
  Score= c(80,90,95)
)
#duitake combine kora
cbind(df1, df2)
bind_cols(df1, df2)

#rebind() - combine by rows (colum must be similar)
df3 <- data.frame(
  ID = 1:3,
  Name = c("A","B","C")
)
df4 <- data.frame(
  ID = 1:3,
  Name = c("D","E","F")
)

rbind(df3, df4)
bind_rows(df3, df4)


#wide Data
#this is wide format because week1, week2, week3 are separate columns
wide_df <- data.frame(
  ID = c(1,2,3),
  Name = c("A","B","C"),
  week1 = c(10,20,30),
  week2 = c(15,25,35),
  week3 = c(20,30,40)
)

#turning wide data into long data
long_df <- wide_df |> 
  pivot_longer(
    cols = 3:5,
    names_to = "week",
    values_to = "value"
  )

#turning long data to wide data
long_df |>
  pivot_wider(
    names_from = week,
    values_from = value
  )


# merge data
df1 <- data.frame(
  ID = c(1, 2, 3, 4),
  Name = c("A", "B", "C", "D")
)

df2 <- data.frame(
  ID = c(1, 2, 3, 5),
  Age = c(20, 25, 30, 35)
)

# left_join()
# keeps all observations from the first data frame (df1)
# if column name is same
df1 |> 
  left_join(df2, by = "ID")

# if column name is not same
df1 <- data.frame(
  ID = c(1, 2, 3, 4), #prothom varable er j nam oi nam thakbe table a as a variable name
  Name = c("A", "B", "C", "D")
)

df2 <- data.frame(
  ID2 = c(1, 2, 3, 5),
  Age = c(20, 25, 30, 35)
)

df1 |> 
  left_join(df2, by = c("ID" = "ID2"))









