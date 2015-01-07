#Q1
#Create a logical vector that identifies the households on greater than 10 acres
#who sold more than $10,000 worth of agriculture products.
#read file
houshold <- read.csv("getdata-data-ss06hid.csv")
agricultureLogical <- sqldf("select * from houshold where ACR=3 and AGS=6")
#which() function
which(agricultureLogical)

#Q2 read jpeg file
img <- readJPEG("getdata-jeff.jpg",native=TRUE)
#calcualte 30th and 80th quantiles of img
quantile(img,c(0.3,0.8),type=1)

#Q3
#load GDP Data set
GDP <- read.csv("getdata-data-GDP.csv")
#load EDSTATS Data set
EDSTATS <- read.csv("getdata-data-EDSTATS_Country.csv")
#Merge GDP & EDSTATS by CountryCode and descending order by GDP rank
MergeData <- join(GDP,EDSTATS,by ="CountryCode")
#MergeData2 <- merge(GDP,EDSTATS,by.x="CountryCode",by.y="CountryCode",all=TRUE)
#Descending order by GDP rank
Arrange <- arrange(MergeData,desc(Ranking))
names(MergeData)

#Q4 What is the average GDP ranking for the "High income: OECD" and
#"High income: nonOECD" group?
# Conver Ranking from factor to number
MergeData$Ranking <- as.numeric(MergeData$Ranking)
class(MergeData$Ranking)
aggregate(Ranking ~ Income.Group, data = MergeData, FUN="mean")
c <- sqldf("select Income.Group from EDSTATS") ???
x <- na.omit(MergeData$Ranking)

#Q5
#Cut the GDP ranking into 5 separate quantile groups.
#cut <- cut2(MergeData$Ranking,g=5)
cut <- cut2(na.omit(MergeData$Ranking),g=5)
#Make a table versus Income.Group
table(MergeData$Income.Group,cut)