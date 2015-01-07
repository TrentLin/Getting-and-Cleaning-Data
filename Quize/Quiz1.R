#Q1 How many housing units in this survey were worth more than $1,000,000?
#read file
House <- read.csv("getdata-data-ss06hid.csv")
#subset data file VAL = 24
House1 <- subset(House, VAL == 24, select=VAL)
#計算Row的個數
nrow(House1)

#Q3 read rows 18-23 and column 7-15 in to dat
House2 <- read.csv("getdata-data-DATA.gov_NGAP.csv")
dat <- House2[18:23,7:15]
sum(dat$Zip*dat$Ext,na.rm=T)

#Q4 read XML on Baltimore restaurants and 
#calculate how many restaurants have zipcode 21231
#fileUrl <-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
#doc <- xmlTreeParse(fileUrl,useInternal=TRUE)
library(XML)
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
doc <- xmlTreeParse(fileUrl,useInternal=TRUE)
rootNode <- xmlRoot(doc)
21231 <- xpathSApply(doc,"21231",xmlValue)

#Q5
DT <- read.csv("getdata-data-ss06hid.csv")
#設定"pwgtp15欄位為數值"
DT[,174] <- as.numeric(DT[,174]) #pwgtp15
mean(DT$pwgtp15,by=DT$SEX)
tapply(DT$pwgtp15,DT$SEX,mean)
sapply(split(DT$pwgtp15,DT$SEX),mean)
rowMeans(DT)[DT$SEX==1]; rowMeans(DT)[DT$SEX==2]
mean(DT[DT$SEX==1,]$pwgtp15); mean(DT[DT$SEX==2,]$pwgtp15)
DT[,mean(pwgtp15),by=SEX]