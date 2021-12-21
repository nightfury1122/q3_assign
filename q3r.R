library(tidyverse)
library(ggplot2)
library(maps)
# ....................Reading the dataset........................

data<-read.csv("country_vaccinations.csv")

# ....................Summary of data............................

summary(data)

# ...................Count of countries..........................

table(data$country)

# .....................Total vaccines............................

table(data$vaccines)

# .................Comparison of country/vaccine.................

comparison<-data[ ,c("country","vaccines")]

# ...................Countries with same vaccine................

data%>%
  select(country,vaccines)%>%
  
  # .....................mapping data on a map....................
  # comparison%>%
  #   rename(
  #     region=country
  #   )
  colnames(comparison) <- c('region','vaccines')


mp<-map_data("world2Hires")

ggplot() + geom_polygon(data = mp, aes(x=long, y = lat, group = group)) + 
  coord_fixed(1.3)

memory.limit()
