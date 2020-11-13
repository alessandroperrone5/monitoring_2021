library(sp)
data(meuse)
head(meuse)

coordinates(meuse) = ~x+y
plot(meuse)

#spplot is used to plot elements like zinc, etc. spread in space
spplot(meuse, "zinc")
#to give a title
spplot(meuse, "zinc", main="Concentration of zinc")
#see copper and zinc together
spplot(meuse, c("copper", "zinc"))

#rather than use colors, we use bubbles
bubble(meuse, "zinc")

#color of bubbles
bubble(meuse, "lead", col="red")
