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
