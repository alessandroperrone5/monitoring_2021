#speciesdistributionmodel
#to link ecosystem components (environmental condition) to a specie
#starting with in-situ data, then see how species are distribuited over space based on these environmental conditions
#Occurence: presence (1) or absence (0) of species ..abscence isn't sure
#we see the links between presence of species related to the layers referred to environmental conditions (GeneralizedLinearModel= model of these layers)
#is used to predict the possibility/probability of the presence of a specie, based on its environmental conditions : PERCEPTION
#is used to understand why a specie is there : UNDERSTANDING
#Environmental conditions (variables used to predict the presence): temperature, elevation, precipitation, vegetation
install.packages("sdm")
library(sdm)
library(raster)
library(rgdal) #spatial data for importing shapefile
#system.file function of R to catch files into a certain library #import species data
file <- system.file("external/species.shp", package="sdm")
species <- shapefile(file) #shapefile or readOGR (function of gdal)
species
#let's see the info (spatialpointsdataframe, features, extent, variables(name,min,max))
plot(species, pch=17)
#now we saw just the presence, let's see the absence (Occurence)
species$Occurrence #$ to link
#let's make a subset of the dataset
plot(species[species$Occurrence == 1,], col='blue', pch=17) #SQL coding to have a determinated data (in this case the presence (1)) and the "," to say stop ##or also attach(occurence)
points(species[species$Occurrence == 0,], col='red', pch=17)

# predictors: look at the path
path <- system.file("external", package="sdm") #path is the external folder
# list the predictors ###the aim is to predict with previous image/data the possible values 
lst <- list.files(path=path,pattern='asc$',full.names = T) #listfiles function to list files of a folder ##pattern is the rule how to see the file (asc file (a standard extension) + $ (all the asc data)
lst
preds <- stack(lst) #stack to have all files(=layers=env.conditions) of the list
cl <- colorRampPalette(c('blue','orange','red','yellow')) (100)
plot(preds, col=cl)

#now let's plot one by one single layers
plot(preds$elevation, col=cl, main='elevation') #elevation
points(species[species$Occurrence == 1,], pch=17)
plot(preds$temperature, col=cl, main='temperature') #temp
points(species[species$Occurrence == 1,], pch=17)
plot(preds$precipitation, col=cl, main='precipitation') #precipitation
points(species[species$Occurrence == 1,], pch=17)
plot(preds$vegetation, col=cl, main='vegetation') #vegetation
points(species[species$Occurrence == 1,], pch=17)

#point data + predictors -> model
#first, let's explain to R which are the data with #sdmData function
datasdm <- sdmData(train=species, predictors=preds) #train is training set, the in-situ data
datasdm #show info
#let's build the model
m1 <- sdm(Occurrence ~ elevation + precipitation + temperature + vegetation, data=datasdm, methods = "glm") #tilde ~ says that "occurence is = to..." ###glm generalized linear model
# make the raster output layer, the final prediction
p1 <- predict(m1, newdata=preds) #predict function
#plot the output
plot(p1, col=cl)
points(species[species$Occurrence == 1,], pch=17)
# add to the stack, show the 4 layers and the speciesdistributionmodel all together
s1 <- stack(preds,p1) #preds is the name of the stack of the 4 layers, #p1 is the sdm
plot(s1, col=cl)
