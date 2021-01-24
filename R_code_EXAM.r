#The NO2 level in the ILVA area (Taranto)
setwd("C:/lab/") #"..." (brackets) = importing data from an external source; #setwd function= setting a new working directory
library(raster) #raster package (already installed with the function install.packages("raster")) = using spatial data(reading,modelling,analyzing,etc.); #library function= recalling packages
EU_jan_NO2 <- raster("EN_0001.png") #raster function = import and read data; #EU_jan_NO2 <- = giving a name to this data
cl <- colorRampPalette (c('red','orange','yellow')) (100) #colorRampPalette = using and edit color schemes, yellow is used for maximum values because it is the colour that attracts the human eye the most, 100 is the number of color in the used color scale; #c= setting things ("c" is for "characters") before the array
plot(EU_jan_NO2, col=cl, main ="European NO2 level in Jan") #plot = plotting/showing of R objects; #main = giving a title
ext <- c(400,500,100,200) #ext = defining minimum and maximum of x, y variables
Taranto_jan_NO2 <- crop (EU_jan_NO2, ext) #crop= zooming in on a specific part of the map (the specific area analyzed), it's for geographic subset; #,ext = the extension previously declared
cl <- colorRampPalette (c('red','orange','yellow')) (100)
plot(Taranto_jan_NO2, col=cl, main="Taranto NO2 level in Jan") #now it's shown the level of NO2 in January in the specific area analyzed

#the same for the second period: March
EU_mar_NO2 <- raster("EN_0013.png") 
cl <- colorRampPalette (c('red','orange','yellow')) (100)
plot(EU_mar_NO2, col=cl, main ="European NO2 level in Mar")
ext <- c(400,500,100,200)
Taranto_mar_NO2 <- crop (EU_mar_NO2, ext)
cl <- colorRampPalette (c('red','orange','yellow')) (100)
plot(Taranto_mar_NO2, col=cl, main="Taranto NO2 level in Mar") #now it's shown the level of NO2 in January in the specific area analyzed

#how to compare the two obtained maps
par(mfrow=c(1,2)) #par = setting graphical parameters => par(mfrow = c (nrows,ncolumns) = creating a matrix of nrows, ncolumns to compare the two obtained maps
plot(Taranto_jan_NO2, col=cl)
plot(Taranto_mar_NO2, col=cl) # plot the two maps with this new matrix

#the outcomes show the huge amount of NO2 in January decreased during the following two months due to the main causes already described in the introduction: COVID-19, level of pollution, market crisis
#how to compute the difference between these two maps
difNO2 <- Taranto_jan_NO2 - Taranto_mar_NO2
cldif <- colorRampPalette (c('blue','black','yellow')) (100) #where the new map is more yellow, it means there's a decrease of NO2 level 
plot(difNO2, col=cldif)
