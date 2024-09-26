library(opendatatoronto)
library(dplyr)
library(janitor)
library(lubridate)
library(tidyverse)

# get package
package <- show_package("dogs-issued-dangerous-dog-orders")
package

# get all resources for this package
resources <- list_package_resources("dogs-issued-dangerous-dog-orders")

# identify datastore resources; by default, Toronto Open Data sets datastore resource format to CSV for non-geospatial and GeoJSON for geospatial resources
datastore_resources <- filter(resources, tolower(format) %in% c('csv', 'geojson'))

# load the first datastore resource as a sample
data <- filter(datastore_resources, row_number()==1) %>% get_resource()
data

clean_data <- data |>
  clean_names() |>
  select(breed, bite_circumstance, date_of_dangerous_act)

clean_data <- clean_data |>
  mutate(date_of_dangerous_act = as.Date(date_of_dangerous_act))

clean_data <- clean_data |>
  mutate(year_month = floor_date(date_of_dangerous_act, "month"))

# plot show the dog bites over the years 2017 to 2024
clean_data |>
  summarise(
    count_of_bite = n(),
    .by = year_month
  ) |>
  ggplot(aes(x = year_month, y = count_of_bite)) +
  geom_point()

#dog bite by breed
dog_bite_by_breed <- clean_data |>
  summarize(
    count = n(),
    .by = breed
  ) |>
  arrange(-count)

# dog bite by location and severity
location_based_data <- data |>
  clean_names() |>
  select(breed, bite_circumstance, location_of_incident) |>
  mutate(bite_circumstance = ifelse(bite_circumstance == "NAB", "NOT A BITE", bite_circumstance)) |>
  summarise(
    count = n(),
    .by = c(location_of_incident, bite_circumstance)
  ) |>
  arrange(location_of_incident)

# frequency of dog names
name_frequency <- data |> summarise(
  count = n(),
  .by = Name_of_Dog
) |>
  arrange(-count)

# frequency of dog bite by location and severity
zip_code_frequency <- data |>
  clean_names() |>
  summarise(
    count = n(),
    .by = c(forward_sortation_area, bite_circumstance)
  ) |>
  arrange(-count)

# frequency of types of severity of bites
clean_data |>
  mutate(bite_circumstance = ifelse(bite_circumstance == "NAB", "NOT A BITE", bite_circumstance)) |>
  summarise(
    count = n(),
    .by = bite_circumstance
  )

# no duplicates in the data
duplicates <- data |>
  group_by(Name_of_Dog, Breed) |>
  filter(n() > 1) |>
  ungroup() |>
  arrange(Name_of_Dog)
