library(XML)
test <- xmlParse("/Users/felipeconcha/Documents/Master Cybersecurity Management/Data Driven Secutity/xml.txt")
test1 <- xmlRoot(test)
print(test1[7])

class(test1)


get_value_attr <- xpathApply(test, "//@The cpe-list element")
xmlAttrs(test1)

xmlValue(test1[[7]])


datos <- xmlSApply(test1, function(x) xmlSApply(x, xmlValue))
df <-data.frame(t(datos), row.names=NULL)
df
View(df)
datos
class(test)

cpe <-xmlParse("/Users/felipeconcha/Documents/Master Cybersecurity Management/Data Driven Secutity/cpe.xml")
cpe1 <- xmlRoot(cpe)
cpe2 <- as.raw(cpe)


cve <- xmlParse("https://cve.mitre.org/data/downloads/allitems-cvrf-year-2014.xml")

#' Get data frame from CVE entry
#'
#' This function returns a single data frame
#' of one row containing th details from the
#' CPE passed as parameter.
#' @param cpe.raw
#'
#' @return data.frame
GetCPEItem <- function(cpe.raw) {
  cpe <- NewCPEItem()
  cpe.raw <- XML::xmlToList(cpe.raw)

  # transform the list to data frame

  # return data frame
}



#' Get CPE data frame
#'
#' The main function to parse CPE XML file. Expects one
#' parameter representing the file to be parserd.
#' Internally, makes use of XPath queries and plyr packages
#' to generate a R data frame with information extracted
#' from the XML file.
#' @param cpe.file file, the CPE XML file to be parsed.
#'
#' @return data.frame
ParseCPEData <- function(cpe.file) {
  doc <- XML::xmlTreeParse(cpe.file)
  cpes.raw <- XML::xmlRoot(doc)
  cpes.raw <- cpes.raw[2:length(cpes.raw)]

  # get list of CPEs (each one is a data frame)
  lcpes <- lapply(cpes.raw, GetCPEItem)

  # create single data frame from list
  # ...

  # return data frame
}

ParseCPEData("/Users/felipeconcha/Documents/Master Cybersecurity Management/Data Driven Secutity/xml.txt")

