##PLOT 4 : 4 plots

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
data07$alltime <- strptime(paste(data07$Date, data07$Time, sep=""), "%F%X")

## numeric
data07$Sub_metering_1 <- as.numeric(data07$Sub_metering_1)
data07$Sub_metering_2 <- as.numeric(data07$Sub_metering_2)
data07$Sub_metering_3 <- as.numeric(data07$Sub_metering_3)
data07$Voltage <- as.numeric(data07$Voltage)
data07$Global_reactive_power <- as.numeric(data07$Global_reactive_power)


## plot
png("plot4.png", width = 480, height = 480)

par(mfrow=c(2,2))

plot(data07$alltime, data07$Global_active_power, type = "l", xlab="", ylab="Global Active Power (kilowatts)")

plot(data07$alltime, data07$Voltage, type = "l", xlab="", ylab="Voltage")

with(data07, plot(alltime, Sub_metering_1, type="l", xlab = "", ylab="Energy sub metering"))
lines(data07$alltime, data07$Sub_metering_2, type = "l", col="red")
lines(data07$alltime, data07$Sub_metering_3, type = "l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2, col = c("black", "red", "blue"))

plot(data07$alltime, data07$Global_reactive_power, type = "l", xlab="", ylab="Global Reactive Power")

dev.off()