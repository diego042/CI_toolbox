#Get No. of Google Search Hits with R and XML

#google will block you after about the 300th recursion!

if (require("XML")==FALSE) install.packages("XML")
if (require("RCurl")==FALSE) install.packages("RCurl")

require("XML")
require("RCurl")

GoogleHits <- function(input)
{
        require(XML)
        require(RCurl)
        url <- paste("https://www.google.com/search?q=",
                     input, sep = "") # modified line      
        CAINFO = paste(system.file(package="RCurl"), "/CurlSSL/ca-bundle.crt",
                       sep = "")
        script <- getURL(url, followlocation = TRUE, cainfo = CAINFO)
        doc <- htmlParse(script)
        res <- xpathSApply(doc, '//*/div[@id="resultStats"]', xmlValue)
        cat(paste("\nYour Search URL:\n", url, "\n", sep = ""))
        cat("\nNo. of Hits:\n") # get rid of cat text if not wanted
        return(as.integer(gsub("[^0-9]", "", res)))
}

# Example:
#no.hits <- GoogleHits("diego%maciel%geronimo")


#use for a list and lapply function
#lapply(list_of_search_terms, GoogleHits)

#use for a list and creating a dataframe with the results
lista <- c("toxicidade%do%formol", # ("%" = " ") "toxicidade do formol"
           "semaforinas%2Bagua") # ("%2B" = "+") semaforinas+agua
DT <- data.frame(termo="",contagem="")
for (i in lista) {
        hits <- GoogleHits(i)
        nova.linha <- data.frame(termo=i, contagem=as.character(hits))
        DT <- rbind(DT,nova.linha)
}
DT

#REFERENCES:
#http://stackoverflow.com/questions/30199157/r-google-search-result-count-retrieve
