#### Preamble ####
# Purpose: Downloads and saves the data from Open Data Toronto
# Author: Liam Wall
# Date: 26 September 2024
# Contact: liam.wall@mail.utoronto.ca


# The below code is taken from Open Data Toronto's 'For Developer's section
# This can be found at https://open.toronto.ca/dataset/dogs-issued-dangerous-dog-orders/


#### Download data ####
library(opendatatoronto)
library(dplyr)


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


#### Save data ####
# [...UPDATE THIS...]
# change the_raw_data to whatever name you assigned when you downloaded it.
write_csv(the_raw_data, "inputs/data/raw_data.csv") 

         
