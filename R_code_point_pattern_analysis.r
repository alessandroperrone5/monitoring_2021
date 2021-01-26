#point pattern analysis
#point pattern: 1)DENSITY: how much points are dense in the landscape, in space; how are distribuited/spread
############### 2)INTERPOLATION: what is the value in places where variables are non recorded? estimate thanks two other values around that place
#spatstat package is for spatial point pattern analysis, model-fitting, simulations, tests
install.packages("spatstat")
library(spatstat)

setwd("C:/lab/")
#import external data
covid <- read.table("covid_agg.csv", header=TRUE)
covid

#now, let's see the density of the covid data
#let's make a planar point pattern in spatstat: ppp
attach(covid)

#x=lon, y=lat and ranges (c is the symbol for ranges)
#covid_planar is the name
covid_planar <- ppp(lon, lat, c(-180, 180), c(-90, 90))
#let's see the density
density_map <- density(covid_planar)
plot(density_map)
points(covid_planar)
#change colors of points: cl <- colorRampPalette ......... the number (100) is the number of different colors
cl <- colorRampPalette(c('yellow','orange','red'))(100)
plot(density_map, col = cl)
points(covid_planar)
#to change color (http://www.stat.columbia.edu/~tzheng/files/Rcolor.pdf these are the colours codes)
cl <- colorRampPalette(c('col','col','col'))(100)
plot(density_map, col=cl)
points(covid_planar)

#putting the countries in top of the map
#rgdal package is for geospatial data abstraction library
install.packages("rgdal")
-----------

#lecture 23/11
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
  
install.packages("rgdal")
library(rgdal)

#let's use the coastlines files
#readORG is part of rgdal library, used to let R read data of files
#shp: shapefile 
#shx: index to link points
#if there's point and lines we have a shape: a polygon .... points+lines+polygons=VECTOR (a set of coordinates)
#RASTER file is made of images which are made of pixels
coastlines <- readOGR("ne_10m_coastline.shp")                 
plot(density_map, col = cl)
points(covid_planar)
#if don't "add=TRUE", R read only coastlines, instead of adding coastlines to previous map
plot(coastlines, add = TRUE)

cl <- colorRampPalette(c('pink','green','orange','red','magenta'))(100) # 
plot(density_map, col = cl)
points(covid_planar)
plot(coastlines, add = TRUE)                 
points(covid_planar, pch = 19)
points(covid_planar, pch = 19, cex = 0.5)

#for png, saved in "lab" 
png("figure1.png")
cl <- colorRampPalette(c('pink','green','orange','red','magenta'))(100) # 
plot(density_map, col = cl)
points(covid_planar, pch = 19, cex = 0.5)
plot(coastlines, add = TRUE)
dev.off()
#for pdf file, just change png with pdf

###interpolate case data with "Smooth"
marks(covid_planar) <- cases
#marks explain to R that there's data to do interpolation
#now every single point has its value
#"smooth" to create interpolation map
cases_map <- Smooth(covid_planar)
plot(cases_map, col = cl)
points(covid_planar)
plot(coastlines, add = T) .... #T is TRUE
---------------------------------------

#lecture 27/11
#plot the points as the higher number of cases and map
##plotting points with different size related to covid data together with the interpolated map
setwd("C:/lab/")
library(spatstat)
library(rgdal)
covid <- read.table("covid_agg.csv", header=TRUE)
head(covid)

attach(covid)
covid_planar <- ppp(lon, lat, c(-180,180), c(-90,90))
marks(covid_planar) <- cases
cases_map <- Smooth(covid_planar)
#color names in R = https://www.datanovia.com/en/blog/r-colors-amazing-resources-you-want-to-know/ 
cl <- colorRampPalette(c('lightpink2','lightsalmon','tomato1','red3','maroon'))(100)
plot(cases_map, col = cl)

#sf package to plot points with different dimensions
install.packages("sf")
library(sf)
#st_as_sf function to convert foreign object that sf package can read
Spoints <- st_as_sf(covid, coords = c("lon", "lat"))
#cex=Spoints$cases to give to points the dimension of the cases
#lwd to change the line dimension 
plot(Spoints, cex=Spoints$cases, col = 'purple3', lwd = 3, add=T)
#too big for the map (i.e. 80000 cases of china) --> divide x 10000 
#before it, replot the map
cl <- colorRampPalette(c('lightpink2','lightsalmon','tomato1','red3','maroon'))(100)
plot(cases_map, col = cl)
plot(Spoints, cex=Spoints$cases/10000, col = 'purple3', lwd = 3, add=T) ###number of cases / 10000
###put a smoother to the coastlines to resampling
library(rgdal)
coastlines <- readOGR("ne_10m_coastline.shp")
plot(coastlines, add=T)
          
---------------
#30/11
#lon and lat are not absolute coordinates since the earth is a geoid, we adapt it with ellipsoid. we use a reference system (there is no single reference system)

#leonardo zabotti data
setwd("C:/lab/")
leo <- read.table("dati_zabotti.csv", header=T, sep=",")
#sep is for separate the headers
head(leo)
attach(leo)
library(spatstat)     
summary(leo)                              
leo_ppp <- ppp(x, y, c(2300000,2325000), c(5005000,5045000))       
density_map <- density(leo_ppp)
plot(density_map)
points(leo_ppp)
                
#save workspace : go to "file" and "save workspace"
 ------
#4/12
#interpolatation of students data
setwd("C:/lab/")
#load function: reload datasets saved
load("point_pattern_analysis.RData") 
#ls function: list all() the data produced, ()=every data
ls()   
head(leo)
library(spatstat)
attach(leo)
#let's explain to R the data that we want to use with mark function
marks(leo_ppp) <- chlh
chlh_map <- Smooth(leo_ppp)
plot(chlh_map)
points(leo_ppp)
#change color
cl <- colorRampPalette(c('yellow','orange','red','green'))(100) # 
plot(chlh_map, col=cl)
points(leo_ppp)

## Exercise: do the same for chlorophyll in the sediment (chls)
-> #just change chlh with chls
marks(leo_ppp) <- chls
chls_map <- Smooth(leo_ppp)
plot(chls_map, col=cl)
points(leo_ppp)

###see several graphs at the same time (multipanel) -> #par function
par(mfrow=c(1,3)) #multiframerow, 1row and 3columns to have different graphs (e.g. plot(density), plot(chlh), plot(chls))
# first graph: density map  (density maps says where is chlorophyll in general)
plot(density_map, col=cl)
points(leo_ppp)
#second graph: chlh
plot(chlh_map, col=cl)
points(leo_ppp)
# third graph: chls
plot(chls_map, col=cl)
points(leo_ppp)

#excercise: build a multipanel with 3rows and 1column
par(mfrow=c(3,1))
#now same functions as before
# first graph: density map
plot(density_map, col=cl)
points(leo_ppp)
#second graph: chlh
plot(chlh_map, col=cl)
points(leo_ppp)
# third graph: chls
plot(chls_map, col=cl)
points(leo_ppp)
