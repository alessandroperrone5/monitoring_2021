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
--------

23/11
library(spatstat)
setwd("C:/lab/")
covid <- read.table("covid_agg.csv", header=TRUE)
head(covid)
attach(covid)
covid_planar <- ppp(lon, lat, c(-180,180), c(-90,90))
density_map <- density(covid_planar)
plot(density_map)

# Exercise: change the colour of the map
cl <- colorRampPalette(c('blue','yellow','orange','red','magenta'))(100) #
plot(density_map, col = cl)
points(covid_planar)
  
# sudo apt-get update
# sudo apt-get install libgdal-dev libproj-dev
install.packages("rgdal")
library(rgdal)

coastlines <- readOGR("ne_10m_coastline.shp")                 
plot(density_map, col = cl)
points(covid_planar)
plot(coastlines, add = TRUE)

cl <- colorRampPalette(c('pink','green','orange','red','magenta'))(100) # 
plot(density_map, col = cl)
points(covid_planar)
plot(coastlines, add = TRUE)                 
points(covid_planar, pch = 19)
points(covid_planar, pch = 19, cex = 0.5)

#for png, saved in "lab" 
pdf("figure1.pdf")
cl <- colorRampPalette(c('pink','green','orange','red','magenta'))(100) # 
plot(density_map, col = cl)
points(covid_planar, pch = 19, cex = 0.5)
plot(coastlines, add = TRUE)
dev.off()

###interpolate case data with "Smooth"
marks(covid_planar) <- cases
cases_map <- Smooth(covid_planar)
plot(cases_map, col = cl)
plot(coastlines, add = T) .... #T is TRUE
points(covid_planar)
---------------------------------------
27/11
##plotting points with different size related to covid data together with the interpolation
setwd("C:/lab/")
library(spatstat)
covid <- read.table("covid_agg.csv", header=TRUE)
head(covid)

attach(covid)
covid_planar <- ppp(lon, lat, c(-180,180), c(-90,90))
marks(covid_planar) <- cases
cases_map <- Smooth(covid_planar)
#color names in R = https://www.datanovia.com/en/blog/r-colors-amazing-resources-you-want-to-know/ 
cl <- colorRampPalette(c('lightpink2','lightsalmon','tomato1','red3','maroon'))(100)
plot(cases_map, col = cl)

install.packages("sf")
library(sf)
Spoints <- st_as_sf(covid, coords = c("lon", "lat"))
plot(Spoints, cex=Spoints$cases, col = 'purple3', lwd = 3, add=T)

cl <- colorRampPalette(c('lightpink2','lightsalmon','tomato1','red3','maroon'))(100)
plot(cases_map, col = cl)
plot(Spoints, cex=Spoints$cases/10000, col = 'purple3', lwd = 3, add=T) ###number of cases / 10000
###put a smoother to the coastlines to resampling
library(rgdal)
coastlines <- readOGR("ne_10m_coastline.shp")
plot(coastlines, add=T)
          
     
                              
       
