# Plot maps from lat/lon data or location names
# Originaly described by:
#http://www.r-bloggers.com/r-beginners-plotting-locations-on-to-a-world-map/
#https://www.students.ncl.ac.uk/keith.newman/r/maps-in-r#countries

#Install and load libraries
if (require("pacman")==FALSE) install.packages("pacman")
pacman::p_load("ggmap", "maptools","maps","mapdata")

#Example for testing
#visited <- c("SFO", "Chennai", "London", "Melbourne", "Johannesbury, SA")

# Get locations names from a .csv file
visited <- read.csv("locais.csv", head=F)
visited<-as.character(visited[c(1:dim(visited)[1]),])
ll.visited <- geocode(visited)
visit.x <- ll.visited$lon
visit.y <- ll.visited$lat
dput(visit.x)
dput(visit.y)

#USING MAPS
map("world", fill=TRUE, col="white", bg="lightblue", 
    ylim=c(-60, 90), mar=c(0,0,0,0))
points(visit.x,visit.y, col="red", pch=16)

#USING MAPS BRAZIL
map('worldHires',c("brazil"),col=c("gray"), fill=T)
points(visit.x,visit.y, col="red", pch=16)

#Using GGPLOT, plot the Base World Map
mp <- NULL
mapWorld <- borders("world", colour="gray50", 
                    fill="gray50") # create a layer of borders
mp <- ggplot() + mapWorld
#Now Layer the cities on top
mp <- mp+ geom_point(aes(x=visit.x, y=visit.y), color="blue", size=3) 
mp

#end
