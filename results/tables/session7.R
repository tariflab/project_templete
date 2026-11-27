#load required package
library(tidyverse)
library(gtsummary)
library(gt)

#The data
data <- read.csv("data/raw/pulse_data.csv")




# Descriptive summary
data|>
  tbl_summary(
    type = c("Smokes", "Alcohol", "Ran") ~ "categorical",
    statistic = all_continuous() ~ "{mean}±{sd}"
  ) |>
  as_gt() |>
  gtsave("results/tables/Table_Descriptive.docx")


#Difference Comparative Table (Numeric  ~ category => Difference )
#দুই গ্রুপের মানের মধ্যে তফাৎ কত
#যখন একটি Categorical গ্রুপ (Gender, Group A vs Group B) অনুযায়ী Numeric ডেটা (Height, Weight, Pulse, Score)
#-এর মান তুলনা করা হয়, তখন সেটি Difference।টুকু?
data |> 
  select(Age, Height, Weight, Pulse1, Pulse2, Gender ) |>
  tbl_summary(by = Gender) |>
  as_gt() |>
  gtsave("results/tables/table2_Difference.docx")

#Association  Comperative Table (Category ~ category) => Association)
#দুটি বৈশিষ্ট্যের মধ্যে যোগসূত্র আছে কি না?
#যখন দুটি Categorical ভেরিয়েবল (Gender বনাম Exercise, Smokes, Alcohol)-
#এর মধ্যে প্যাটার্ন বা যোগসূত্র দেখা হয়, তখন সেটি Association।

data |> 
  select(Gender, Exercise, Ran, Alcohol, Smokes  ) |>
  tbl_summary(by = Gender ,
              type = c("Smokes", "Alcohol", "Ran") ~ "categorical" )   |>
add_p() |>
  bold_p(t = 0.05) |>
as_gt() |>
  gtsave("results/tables/table5_Association_significance_Teast.docx")



#is it statistically  significance?
# if P value is less than 0.05  (p<0.05) then it is significant
data |> 
  select(Age, Height, Weight, Pulse1, Pulse2, Gender ) |>
  tbl_summary(by = Gender) |>
  add_p() |>
  bold_p( t = 0.05) |>
  as_gt() |>
  gtsave("results/tables/Table4_difference_significance_Test.docx")










