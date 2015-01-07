#Q2
#Åª¨úÀÉ®×getdata-data-ss06pid.csv
acs <- read.csv("getdata-data-ss06pid.csv")
#select only the data for the probability weights
#pwgtp1 with ages less than 50
a <- sqldf("select pwgtp1 from acs where AGEP < 50")
b <- sqldf("select * from acs where AGEP < 50")

#Q3 equivalent function to unique(acs$AGEP)
c <- unique(acs$AGEP)
d <-sqldf("select distinct AGEP from acs")

#Q4 Calculate characters are in the 10th,
#20th, 30th and 100th lines of HTML
#reaLines from website
path <- "http://biostat.jhsph.edu/~jleek/contact.html"
con <- url(path)
data <- readLines(con)
close(con)
#Calculate charaters by each row
nchar(data[10])
nchar(data[20])
nchar(data[30])
nchar(data[100])

#Q5 report the sum of the numbers in the fourth column. 
data1 <- read.csv("getdata-wksst8110.csv")
sum(data1[,"SST.1"])