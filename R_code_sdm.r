#speciesdistributionmodel
install.packages("sdm")
library(sdm)
library(raster)
library(rgdal) #spatial data
#system.file function of R to catch files into a certain library
file <- system.file("external/species.shp", package="sdm")
species <- shapefile(file)
species
plot(species, pch=17)
species$Occurrence
plot(species[species$Occurrence == 1,], col='blue', pch=17)
points(species[species$Occurrence == 0,], col='red', pch=17)
path <- system.file("external", package="sdm")
# list the predictors ###the aim is to predict with previous image/data the possible values 
lst <- list.files(path=path,pattern='asc$',full.names = T) #
lst
preds <- stack(lst)
cl <- colorRampPalette(c('blue','orange','red','yellow')) (100)
plot(preds, col=cl)
plot(preds$elevation, col=cl, main='elevation') 
points(species[species$Occurrence == 1,], pch=17)
plot(preds$temperature, col=cl, main='temperature')
points(species[species$Occurrence == 1,], pch=17)
plot(preds$precipitation, col=cl, main='precipitation')
points(species[species$Occurrence == 1,], pch=17)
plot(preds$vegetation, col=cl, main='vegetation')
points(species[species$Occurrence == 1,], pch=17)
datasdm <- sdmData(train=species, predictors=preds)
datasdm
#model
m1 <- sdm(Occurrence ~ elevation + precipitation + temperature + vegetation, data=datasdm, methods = "glm")
# make the raster output layer
p1 <- predict(m1, newdata=preds)
plot(p1, col=cl)
points(species[species$Occurrence == 1,], pch=17)
# add to the stack
s1 <- stack(preds,p1)
plot(s1, col=cl)
