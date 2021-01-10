#r code for remote sensing data analysis in ecosystem monitoring
#So what we learned today was that satellite images are composed by different brands and we can use these bands to 
see the color with different manner

library(raster)
library(RStoolbox)

# no library?
install.packages(c("raster","RStoolbox"))

# setwd("C:/lab/")
p224r63_2011 <- brick("p224r63_2011_masked.grd")
#brick is the function to download in r all of the data
p224r63_2011
plot(p224r63_2011)
cl <- colorRampPalette(c('black','grey','light grey'))(100) # 
plot(p224r63_2011, col=cl)

par(mfrow=c(2,2))

clb <- colorRampPalette(c('dark blue','blue','light blue'))(100) # 
plot(p224r63_2011$B1_sre, col=clb)

clg <- colorRampPalette(c('dark green','green','light green'))(100) # 
plot(p224r63_2011$B2_sre, col=clg)

clr <- colorRampPalette(c('dark red','red','pink'))(100) # 
plot(p224r63_2011$B3_sre, col=clr)

clnir <- colorRampPalette(c('red','orange','yellow'))(100) # 
plot(p224r63_2011$B4_sre, col=clnir)

# dev.off()
plotRGB(p224r63_2011, r=3, g=2, b=1, stretch="Lin")

plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin")

plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="Lin")

plotRGB(p224r63_2011, r=3, g=2, b=4, stretch="Lin")

#
par(mfrow=c(2,2))
plotRGB(p224r63_2011, r=3, g=2, b=1, stretch="Lin")
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=3, g=2, b=4, stretch="Lin")
