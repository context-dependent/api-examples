pacman::p_load(
  "httr", 
  "jsonlite", 
  "tidyverse"
)

# URL from example is busted
req <- GET("https://api.open-notify.org/astros.json")

req


# Try out the Canadian 'opencovid.ca' api 

req <- GET("https://api.opencovid.ca/timeseries")

req

# Working with list content

raw <- httr::content(req)

tests <- raw$testing


tests[[1]]

test_transposed <- transpose(tests)

dat_tests <- test_transposed %>% 
  map(unlist) %>% 
  as_tibble()

flatten()

# querystring parameters

req <- GET("https://api.opencovid.ca/timeseries?stat=cases")

req <- GET(
  "https://api.opencovid.ca/timeseries", 
  query = list(stat = "cases")
)

req

# If it required authorization

api_key <- readLines("auth/esat-key.txt")

api_key

req <- GET(
  "https://api.opencovid.ca/timeseries", 
  query = list(
    stat = "cases", 
    token = api_key
  )
)
