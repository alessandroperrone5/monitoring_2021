#R spatial

library(sp)
#load dataset 
data(meuse)
head(meuse)

#to group coordinates and explain to R that the coordinates are x and y
coordinates(meuse) = ~x+y
#to see the set in space
plot(meuse)

#spplot is used to plot elements like zinc, etc. spread in space
spplot(meuse, "zinc")
#to give a title
spplot(meuse, "zinc", main="Concentration of zinc")

#exercise: plot concentration of copper
spplot(meuse, "copper", main="Concentration of copper")

#see copper and zinc together
spplot(meuse, c("copper", "zinc"))

#rather than use colors, we use bubbles (with different sizes depending on value of elements)
bubble(meuse, "zinc")

#color of bubbles
bubble(meuse, "lead", col="red")
---------------
#lecture 16/11

#install the ggplot2 package
install.packages("ggplot2")

#ecological data.frame
biofuels <- c(120, 200, 350, 570, 750) # array of values: c
biofuels
oxydative <- c(1200, 1300, 21000, 34000, 50000)
oxydative

#let's create a table
d <- data.frame(biofuels, oxydative)
d

#ggplot2
#it's the same to do data.frame(biofuels,oxydative)
ggplot(d, aes(x = biofuels, y = oxydative)) + geom_point()
#aes is aesthethic, to explain to R what are the variables that we want to plot
#geom_point to explain how to build the graph, without other arguments ()

#color and size
ggplot(d, aes(x = biofuels, y = oxydative)) + geom_point(col="red", size=2)
#use lines instead of points
ggplot(d, aes(x = biofuels, y = oxydative)) + geom_line()
#points and lines together
ggplot(d, aes(x = biofuels, y = oxydative)) + geom_point(col="red", size=2) + geom_line()
#instead of points and lines, we can use POLYGONS
ggplot(d, aes(x = biofuels, y = oxydative)) + geom_polygon()
---------------------------------------

#######IMPORT DATA FROM AN EXTERNAL SOURCE
setwd (wd=working directory)

#setwd for Windows
setwd("C:/lab/")

#read.table to import dataset inside R
covid <- read.table("covid_agg.csv", header=TRUE)
#header=TRUE to say each variable has a name in the first line (category,country,cases,lat,lon)
covid
--------------------------
#lecture 20/11
setwd("C:/lab/")
covid <- read.table("covid_agg.csv", header=TRUE)
covid
head(covid)
summary(covid)

#use ggplot2 library
library(ggplot2)
ggplot(covid, aes(x = lon, y = lat)) + geom_point()
#changing the size of data based on number of cases
ggplot(covid, aes(x = lon, y = lat, size = cases)) + geom_point()

#let's use this points to make POINT PATTERN ANALYSIS (in another Github file)
