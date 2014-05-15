setwd("C:/Users/sli126/Documents/GitHub/R_Programming")
data<-read.csv("hw1_data.csv")
$11
names(data)
#12
data[1:2,]
#13
attributes(data)
#14
data[152:153,]
tail(data,n=2)
#15
data[47,]$Ozone
#16
sum(as.numeric(is.na(data$Ozone)))
#17
miss<-is.na(data$Ozone)
nmiss<-data$Ozone[!miss]
mean(nmiss)
#18

m<-data[Ozone>31 & Temp>90,]$Solar.R

mean(m[!is.na(m)])
#19
m6<-data[Month==6,]$Temp
mean(m6[!is.na(m6)])

#20
m5<-data[Month==5,]$Ozone
max(m5[!is.na(m5)])