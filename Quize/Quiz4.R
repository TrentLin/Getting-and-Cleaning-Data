#Q1
data1 <- read.csv("getdata-data-ss06hid.csv")
colnames <- colnames(data1)
#split "wgtp" on colnames
strsplit(colnames,"wgtp")

#Q2
#Read getdata-data*GDP
GDP <- read.csv("getdata-data-GDP.csv")
#Remove NA data
GDP2 <- na.omit(GDP)
#Remove commas from GDP number
GDP3 <- gsub(",","",GDP2$X.millions.ofUS.dollars.)
GDP3 <- as.numeric(GDP3)
#Calculate mean
mean(GDP3)

#Q3 count the number of countries whose name begins with "United"
countryNames <-GDP$Economy
grep("^United",countryNames)

#Q4
GDP <- read.table("getdata-data-GDP.csv",header=FALSE,sep=",",quote=' " ',col.names=c("CountryCode","Ranking","CountryNames","GDP"),skip=1)
#EDSTATS <- read.table("getdata-data-EDSTATS_Country.csv",header=TRUE)
GDP <- read.csv("getdata-data-GDP.csv")
EDSTATS <- read.csv("getdata-data-EDSTATS_Country.csv")
MergeData <- join(GDP,EDSTATS,by ="CountryCode")
#write.table(MergeData,file= "GDPEDSTATS.csv",sep=",",col.names=NA)
#grep the end of the fiscal year end in June
grep("June 30",MergeData$Special.Notes) 

#Q5
library(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn)
class(sampleTimes)
weekdays(sampleTimes)
Y2012 <- grep("2012",sampleTimes)
MonY2012 <- grep("¬P´Á¤@",sampleTimes)
#count(Y2012)