#### Preamble ####
# Purpose: Tests the cleaned and prepared analysis data
# Author: Liam Wall
# Date: 26 September 2024
# Contact: liam.wall@mail.utoronto.ca


#### Workspace setup ####
library(tidyverse)
library(testthat)

#### Test data ####

clean_data <- read_csv("data/analysis_data.csv")


# Test that the data does not contain any NA values
test_that("Data has no missing values", {
  expect_false(any(is.na(clean_data)))  # No NAs allowed in any column
})

# Test that 'name_of_dog' is of type character
test_that("name_of_dog is of character type", {
  expect_true(is.character(clean_data$name_of_dog))
})

# Test that 'breed' is of type character
test_that("breed is of character type", {
  expect_true(is.character(clean_data$breed))
})

# Test that 'forward_sortation_area' is of type character and has valid length (3 characters)
test_that("forward_sortation_area is of correct type and length", {
  expect_true(is.character(clean_data$forward_sortation_area))
  expect_true(all(nchar(clean_data$forward_sortation_area) == 3))  # Ensure each entry has exactly 3 characters
})

# Test that 'date_of_dangerous_act' is of Date type
test_that("date_of_dangerous_act is of Date type", {
  expect_true(is.Date(clean_data$date_of_dangerous_act))
})

# Test that 'date_of_dangerous_act' has a range from 2017 to today
test_that("date_of_dangerous_act is within a valid date range", {
  valid_start_date <- as.Date('2017-01-01')
  valid_end_date <- Sys.Date()  # Use the current date as the upper bound
  expect_true(all(clean_data$date_of_dangerous_act >= valid_start_date))
  expect_true(all(clean_data$date_of_dangerous_act <= valid_end_date))
})

# Test that the bite_circumstance column contains valid categories
test_that("bite_circumstance has valid categories", {
  valid_bite_circumstances <- c("VERY SEVERE", "SEVERE", "NOT A BITE", "NON SEVERE")
  expect_true(all(clean_data$bite_circumstance %in% valid_bite_circumstances))
})

# Test that 'location_of_incident' is of character type
test_that("location_of_incident is of character type", {
  expect_true(is.character(clean_data$location_of_incident))
})

# Test that 'id' column is unique
test_that("id column is unique", {
  expect_true(n_distinct(clean_data$id) == nrow(clean_data))
})

# Test that 'ward_number' is numeric andin the correct range
test_that("ward_number is numeric", {
  expect_true(is.numeric(clean_data$ward_number))
  expect_true(all(clean_data$ward_number >= 1 & clean_data$ward_number <= 25))
})
