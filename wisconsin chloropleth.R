library(tidycensus)
library(tidyverse)
library(tidyselect)
library(ggplot2)
library(tigris)
library(mapview)
census_api_key("c743dd3966fcbb89cc30a9bbbccd14e2024d76cb",
               install = TRUE)

options(tigris_use_cache = TRUE)

##--wisconsin-median-age-data
wisconsin <- get_acs(
  geography = "county",
  state = "55",
  variables = (median_age = "B01002_001"),
  geometry = TRUE,
)
wisconsin

##--plot 
wisconsin_counties <- counties(state = "55")
wisconsin_counties

##basic-plot
wisconsin_chloropleth <- mapview(wisconsin, zcol = "estimate",
                                 label = "NAME")
wisconsin_chloropleth