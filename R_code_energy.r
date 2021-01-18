#lecture 15/1
#1) energy flow, about reflectance of nearinfrared and absorption of red

#R_code_energy.r
#rasterdiv package, where there's dataset about NDVI (normalized difference vegetation index)
install.packages("rasterdiv")
library(rasterdiv)
library(raster)
#load data of copernicus NDVI
data(copNDVI)
plot(copNDVI)
#let's remove the blue part and brown part, the image is usually coded from 0 to 100 (the NDVI value)...but let's use a simple manner: 8 bit so from 0 to 2^8 (255)...
#...let's remove the values which codes are 253-254-255
copNDVI <- reclassify(copNDVI, cbind(253:255, NA))
plot(copNDVI)
#we have overwrote the previous file
#the greener, the higher biomass level

install.packages("rasterVis")
library(rasterVis)
levelplot(copNDVI)
#the function to do a mean of every level of the raster (composed of pixels) and every main is a point, linking this point we have a profile (in this case energy potential in world). 
-> #this profile is shown next to the map and it's possible to see the differences of i.e. biomas at time A vs time B

#change colors...yellow has the maximum impact to our eyes
clymin <- colorRampPalette(c('yellow','red','blue'))(100) #clyellowminimum, blue max
plot(copNDVI, col=clymin)

clymed <- colorRampPalette(c('red','yellow','blue'))(100) # 
plot(copNDVI, col=clymed)

clymax <- colorRampPalette(c('blue','red','yellow'))(100) # 
plot(copNDVI, col=clymax)

#let's put the 2 plots together
par(mfrow=c(1,2))
clymed <- colorRampPalette(c('red','yellow','blue'))(100) # 
plot(copNDVI, col=clymed)
clymax <- colorRampPalette(c('blue','red','yellow'))(100) # 
plot(copNDVI, col=clymax)

dev.off()

#let's zoom in a certain part of map
#how to crop in italy, crop function is for geographic subset
ext <- c(0,20,35,55) #extension declared (xmin,xmax,ymin,ymax)
copNDVI_Italy <- crop(copNDVI, ext) #assign to crop a new name
plot(copNDVI_Italy, col=clymax) #color 
