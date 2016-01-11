#google trends
#Available in http://www.r-bloggers.com/gtrends-1-3-0-now-on-cran-google-trends-in-r/

## load the package, and if options() are set appropriately, connect
## alternatively, also run   gconnect("someuser", "somepassword")
library(gtrendsR)
gconnect("blahblah@gmail.com", "password")


## using the default connection, run a query for three terms
res <- gtrends(c("wesley safadão", "ivete sangalo"),region="BR")

## plot (in default mode) as time series
plot(res)

## plot via googeVis to browser
## highlighting regions (probably countries) and cities
plot(res, type = "region")
plot(res, type = "cities")
