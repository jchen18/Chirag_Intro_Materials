#Relational Data
library(tidyverse)
library(nycflights13)
#using 4 tibbles named "airlines", "airports", "planes", "weather"

#unique key
planes %>%
  count(tailnum) %>%
  filter(n > 1)

#not a unique key
weather %>%
  count(year, month, day, hour, origin) %>%
  filter(n > 1)


#Q: Add a surrogate key to flights
head(flights)
flights %>%
  arrange(year, month, day, sched_dep_time, carrier, flight) %>%
  mutate(flight_id = row_number()) %>%
  glimpse()

