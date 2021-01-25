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
-------------------------------
#The LST in three different periods in the ILVA area (Taranto)
library(ncdf4) #ncdf4 = using nc data files
library(raster) #raster = using spatial data(reading,modelling,analyzing,etc.); #library function= recalling packages
setwd("C:/lab/") #setting new working directory
tmar19 <- raster ("c_gls_LST10-TCI_201903210000_GLOBE_GEO_V1.2.1.nc") #raster function = import and read data
cl =colorRampPalette (c('blue','red','yellow')) (100) #colorRampPalette = using and edit color schemes, yellow is used for maximum values because it is the colour that attracts the human eye the most, 100 is the number of color in the used color scale; #c= setting things
plot(tmar19,col=cl, main="Global LST in March 2019") #plot = plotting/showing of R objects; #main = giving a title
ext <- c(15.3061,18.8134,39.7649,42.0024) #ext = defining minimum and maximum of x, y variables; these are the Taranto coordinates  
tmar19_Taranto <- crop(tmar19, ext) #crop= zooming in on a specific part of the map (the specific area analyzed), it's for geographic subset; #,ext = the extension previously declared
plot(tmar19_Taranto, col=cl, main="LST in Taranto (03/2019)") #this plot shows the LandSurfaceTemperature in the area analyzed in March 2019
#let's see if there could be possible correlations between NO2 level, LST, and the three factors which limited the production of ILVA 
#it's supposed that if there's any correlations, the LST in March 2019 would be higher than in March 2020 (the "worst" period of ILVA)
#let's plot the LST in March 2020
tmar20 <- raster ("c_gls_LST10-TCI_202003210000_GLOBE_GEO_V1.2.1.nc")
cl=colorRampPalette (c('blue','red','yellow')) (100)
plot(tmar20, col=cl, main="Global LST in March 2020")
ext <- c(15.3061,18.8134,39.7649,42.0024)
tmar20_Taranto <- crop (tmar20, ext)
plot(tmar20_Taranto, col=cl, main="LST in Taranto (03/2020)")
#There are certainly other factors influencing the differences between the two periods, but as expected during March 2020 the temperature was lower. 
#To be sure, each period should be analysed and compared with each other. For example, comparing the same period but in the year 2017.
tmar17 <- raster ("c_gls_LST10-TCI_201703210000_GLOBE_GEO_V1.2.1.nc")
cl=colorRampPalette (c('blue','red','yellow')) (100)
plot(tmar17, col=cl, main="Global LST in March 2017")
ext <- c(15.3061,18.8134,39.7649,42.0024)
tmar17_Taranto <- crop (tmar17, ext)
plot(tmar17_Taranto, col=cl, main="LST in Taranto (03/2017)")
#as the image shows, the LST is lower in March 2020 than in March 2017 (in which the LST is higher than in March 2019)
#let's put the images of these three different years in the same plot
par(mfrow=c(1,3)) #1rows, 3columns
plot(tmar20_Taranto, col=cl, main="2020")
plot(tmar19_Taranto, col=cl, main="2019")
plot(tmar17_Taranto, col=cl, main="2017")
