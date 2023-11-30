library(tidyverse)
library(janitor)
library(stringr) #loading in packages

city_pop_tract <- read_csv(file = "city_tracts_pop.csv") #reading in CSV, downloaded from data.census.gov

tract_long <- city_pop_tract %>% 
  pivot_longer(
    starts_with("Census"),
    names_to = "tract",
    values_to = "pop"
  ) #came in as wide, pivoting to long

NYC_tracts_pop <- tract_long %>% 
  mutate(CTname = str_extract(tract, "(?<=Tract )(.*?)(?=;)")) #to extract just the census tract number, to join with the TIGER file
  #code from ChatGPT: https://chat.openai.com/share/b3584f71-7185-47c7-bea8-419c7093e027

# write_csv(NYC_tracts_pop, "NYC_tracts_pop.csv")
#saving the csv to add to QGIS