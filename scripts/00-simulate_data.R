#### Preamble ####
# Purpose: Simulates dog bite data and runs simple tests
# Author: Liam Wall
# Date: 26 September 2024
# Contact: liam.wall@mail.utoronto.ca


#### Workspace setup ####
library(tidyverse)
library(dplyr)
library(lubridate)
library(testthat)


# Set seed for reproducibility
set.seed(999)

# Simulate dog names
dog_names <- c("Liam", "Michael", "Mark", "Jean", "Hannah", "Kristi", "Laurie", "Enzo", "Hazel", "Butch")

# Simulate dog breeds
dog_breeds <- c("Labrador", "German Shepherd", "Bulldog", "Retriever", "Irish Wolfhound", "Rotweiller")

# Simulate dog colors
dog_colors <- c("Black", "Brown", "White", "Tan", "Grey")

# Simulate bite circumstances
bite_circumstances <- c("VERY SEVERE", "SEVERE", "NOT A BITE", "NON SEVERE")

# Simulate locations of incidents
locations <- c("OTHER PRIVATE PROPERTY", "OWNERS PROPERTY", "PARK", "PUBLIC PROPERTY")

# Create a tibble with simulated data
simulated_data <- tibble(
  name = sample(dog_names, 20, replace = TRUE),
  breed = sample(dog_breeds, 20, replace = TRUE),
  color = sample(dog_colors, 20, replace = TRUE),
  bite_severity = sample(bite_circumstances, 20, replace = TRUE),
  location = sample(locations, 20, replace = TRUE),
  date = sample(seq(as.Date('2022-01-01'), as.Date('2023-12-31'), by="day"), 20, replace = TRUE)
)

simulated_data

# Here are some tests to check that simulated data

# Test that the data has the expected number of rows and columns
test_that("Data has correct number of rows and columns", {
  expect_equal(nrow(simulated_data), 20)  # Check the number of rows
  expect_equal(ncol(simulated_data), 6)   # Check the number of columns
})

# Test that the data contains the correct column names
test_that("Data contains the correct column names", {
  expect_true(all(c("name", "breed", "color", 
                    "bite_severity", "location", "date") %in% names(simulated_data)))
})

# Test that the date column is of class Date
test_that("date is of Date type", {
  expect_true(is.Date(simulated_data$date))
})

# Test that the names are from the expected set of dog names
test_that("Dog names are valid", {
  valid_names <- c("Liam", "Michael", "Mark", "Jean", "Hannah", "Kristi", "Laurie", "Enzo", "Hazel", "Butch")
  expect_true(all(simulated_data$Name_of_Dog %in% valid_names))
})

# Test that the date column has dates in the expected range
test_that("date is in correct date range", {
  expect_true(all(simulated_data$date >= as.Date('2022-01-01')))
  expect_true(all(simulated_data$date <= as.Date('2023-12-31')))
})

# Test that the bite_severity column contains valid categories
test_that("bite_severity has valid categories", {
  valid_bite_circumstances <- c("VERY SEVERE", "SEVERE", "NOT A BITE", "NON SEVERE")
  expect_true(all(simulated_data$bite_severity %in% valid_bite_circumstances))
})


