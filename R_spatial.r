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
