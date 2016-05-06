# Plot maps from lat/lon data or location names
# Originaly described by: https://rpubs.com/ldeassis/27602

#Install and load libraries
install.packages("pacman")
pacman::p_load("knitr","knitr","RgoogleMaps","ggplot2","ggmap")

# Working with location names
cidades <- c("Curitiba PR", "São Paulo SP", "Manaus AM")
DF <- data.frame(cidade=cidades, lat=NA, lon=NA)
DF <- with(DF,data.frame(cidade=cidade, t(sapply(DF$cidade, getGeoCode))))
knitr::kable(DF, format="markdown", digits=4)
box <- make_bbox(lon, lat, data = DF)
map <-ggmap(get_map(force = T,zoom = 2, color = "color", location=box, 
        maptype = "terrain", language = "PT")) + geom_point(data=DF, x=DF$lon, y=DF$lat, color="red")
map

# Working with lat/lon data
DF <- read.csv("~/coords.csv",sep=";")
box <- make_bbox(lon, lat, data = DF)
map <-ggmap(get_map(force = T,zoom = 2, color = "color", location=box, 
        maptype = "terrain", language = "PT")) + geom_point(data=DF, x=DF$lon, y=DF$lat, color="red")
map

#end
