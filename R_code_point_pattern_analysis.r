#point pattern analysis
install.packages("spatstat")
library(spatstat)

######## IMPORT DATA FROM AN EXTERNAL SOURCE

 

# setwd("path/lab")

 

# setwd for Windows
# setwd("C:/lab/")

 

# setwd Mac
# setwd("/Users/yourname/lab/")

 

# Linux
setwd("~/lab/")
covid <- read.table("covid_agg.csv", header=TRUE)
covid

#now, let's see the density of the covid data
#let's make a planar point pattern in spatstat
attach(covid)
x, y and ranges (c is the symbol for ranges)
covid_planar <- ppp(lon, lat, c(-180, 180), c(-90, 90))
#let's see the density 
density_map <- density(covid_planar)
plot(density_map)
points(covid_planar)
#color of points
cl <- colorRampPalette(c('yellow','orange','red'))(100)
plot(density_map, col = cl)
points(covid_planar)
#to change color (http://www.stat.columbia.edu/~tzheng/files/Rcolor.pdf these are the colours codes)
cl <- colorRampPalette(c('col','col','col'))(100)
plot(density_map, col=cl)
points(covid_planar)

#putting the countries in top of the map
install.packages("rgdal")
