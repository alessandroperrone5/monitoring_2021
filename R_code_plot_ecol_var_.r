#R code for plotting the relationship among ecological variables


#install.packages is used to install packages
install.packages("sp")
#sp is for spatial analysis
#brackets [""] for import data in R
#library is used to load, attach, list packages
library(sp)

#data is used to recall datasets
data(meuse)
meuse

#let's look inside datasets

#View (with V not v) ... Invoke a spreadsheet-style data viewer on a matrix-like R object. [see table with data]
View(meuse)

#head is used to see the first data
head(meuse)

#exercise: mean of all values
#all the values / number of values
#or...
summary(meuse)

#exercise: plot zinc (y) against cadmium (x)
see an error --> plot(cadmium, zinc)
Error in h(simpleError(msg, call)) : 
  error in evaluating the argument 'x' in selecting a method for function 'plot': oggetto "cadmium" non trovato
  
#$ link elements and dataset
not error: plot(meuse$cadmium, meuse$zinc)
  
#if you attach is not necessary $ --> just once, then you have to #deattach to stop it
attach(meuse)
plot(cadmium,zinc)

#pairs --> scatterplot matrices (to confront all the elements and all their possible relationships)
pairs(meuse)

#####lecture 9/11
#recall dataset : library(...)
library(sp)
data(meuse)
pairs(meuse)
head(meuse)

#cadmium,copper,lead, zinc
#pairs with soil variables (not all dataset)
#from column3 and column6
pairs(meuse[,3:6])          #[,n1:n2] quadratic parentheses for some elements of the dataset #, comma is for introduce new arguments
#to default R consider values in columns

#let's use the name of the columns
pairs(~cadmium+copper+lead+zinc, data=meuse)  #tilde ~ : Alt+126, group several objects all together

#let's prettify the graph
#exercise: change the color
pairs(~cadmium+copper+lead+zinc, data=meuse, col="red") 
#change the color of single panels by the par() function

#exercise: change the symbol to filled triangles: pch function
pairs(~cadmium+copper+lead+zinc, data=meuse, col="red", pch=17)

#exercise: increase the size of triangles
pairs(~cadmium+copper+lead+zinc, data=meuse, col="red", pch=17, cex=3)
