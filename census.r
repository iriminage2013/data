##Update the global variable 'directory' to your own.
##Make sure the censusdata.txt file is in the same directory.
directory <<- 'C:/Users/jollin/Desktop/Data Science'
setwd(directory)

#Create 3 datasets by subsetting based on the breaks in the long data. 
##Verify that the dimensions of the vector are the same.
census3 <- read.fwf("censusdata.txt", widths=c(5, 10, 10, 10, 10, 30), skip=12, nrows=257, 
                    header=FALSE, sep='\t', col.names=c("FIPS", "1990", "1980", "1970", "1960", "Region"))
head(census3)
dim(census3)

census2 <- read.fwf("censusdata.txt", widths=c(5, 10, 10, 10, 10, 30), skip=271, nrows=257, 
                    header=FALSE, sep='\t', col.names=c("FIPS", "1950", "1940", "1930", "1920", "Region"))
head(census2)
dim(census2)

census1 <- read.fwf("censusdata.txt", widths=c(5, 10, 10, 10, 10, 30), skip=530, nrows=257, 
                    header=FALSE, sep='\t', col.names=c("FIPS", "1910", "1900", "Empty1", "Empty2", "Region"))
head(census1)
dim(census1)

##Create a dataframe by choosing the vectors that you need to create wide data.
censusAll <- data.frame(census1$FIPS, census1$Region, census1$X1900, census1$X1910, 
                        census2$X1920, census2$X1930, census2$X1940, census2$X1950, 
                        census3$X1960, census3$X1970, census3$X1980, census3$X1990)
head(censusAll)

##Get rid of the 2nd row that had no data ("NA").
censusAll <- censusAll[-2, ]

##Rename the columns.
names(censusAll) <- c("FIPS Code", "Region/County", "1900", "1910", "1920", "1930", "1940", "1950", "1960",
                      "1970", "1980", "1990")
head(censusAll)

##Load the xlsx package, and export data to Excel.
library(xlsx)
write.xlsx(censusAll, "C:/Users/jollin/Desktop/Data Science/census.xlsx")

##Experiment with github
