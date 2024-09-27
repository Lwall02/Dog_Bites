#### Preamble ####
# Purpose: Cleans the raw dog registry data recorded by Open Data Toronto
# Author: Liam Wall
# Date: 26 September 2024
# Contact: liam.wall@mail.utoronto.ca

#### Workspace setup ####
library(tidyverse)
library(janitor)


#### Clean data ####
raw_data <- read_csv("data/raw_data.csv")

clean_data <- data |>
  clean_names() |> # clean names
  drop_na() |>    # drop na's
  mutate(date_of_dangerous_act = as.Date(date_of_dangerous_act)) |> # make the date column character to Date class
  mutate(year_month = floor_date(date_of_dangerous_act, "month")) |> # round the dates off to the first of the month to make plotting nicer
  mutate(bite_circumstance = ifelse(bite_circumstance == "NAB", "NOT A BITE", bite_circumstance)) |> # correct a single cell with an abbreviation for NOT A BITE
  mutate(ward_number = as.integer(ward_number)) |> # make ward number a character to an integer
  filter(ward_number >= 1 & ward_number <= 25) # this allows us to remove any non-na information but still unusable info

#### Save data ####
write_csv(clean_data, "data/analysis_data.csv")
