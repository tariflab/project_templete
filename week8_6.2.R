#load required package
library(tidyverse)
library(gtsummary)
library(gt)

#load the data
data <- readxl::read_excel("data/raw/descriptive_summary_table.xlsx", sheet = 2)

#table 1 dedmograhic characteristics of study parrticipations

data |> 
  select(1:6) |>
  tbl_summary() |>
  as_gt() |>
  gtsave("results/tables/Table.docx")
