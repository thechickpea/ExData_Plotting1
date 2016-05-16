##PLOT 1 : histogram

## Clean space/environment

rm(list=ls())

## Read data
setwd("~/2.EDUCATION/DataScience/ExpGraph/Week1")

library(foreign)
mydata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")

## subset data
data07 <- mydata[mydata$Date %in% c("1/2/2007", "2/2/2007"),]
data07$Date <- dmy(data07$Date)
data07$Global_active_power <- as.numeric(data07$Global_active_power)

## histogram
png("plot1.png", width = 480, height = 480)
with(data07, hist(Global_active_power, col="red", main="Global Active Power", xlab = "Global Active Power (kilowatts)"))
dev.off()
