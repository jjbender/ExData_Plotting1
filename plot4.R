rm(list=ls())
setwd("C:\\Users\\nikol\\Dropbox\\coursera\\exploratory_analysis\\week1project")

consum <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", dec = ".", na.strings = "?", stringsAsFactors = FALSE)
dim(consum)
consum <- consum[consum$Date %in% c("1/2/2007", "2/2/2007"), ]
dim(consum)
head(consum)

#require to paste together data and time using paste()
consum$datetime <- strptime(paste(consum$Date,consum$Time), format="%d/%m/%Y %H:%M:%S")
head(consum)

png("plot4.png", width = 480, height = 480)
#set par() for four plots
par(mfrow = c(2, 2)) 

# plot1 and plot2 
with(consum, plot(datetime, Global_active_power, type="l", xlab="", ylab="Global Active Power"))
with(consum, plot(datetime, Voltage, type="l", xlab="datetime", ylab="Voltage"))

# plot3
with(consum, plot( datetime, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering"))
with(consum, lines(datetime, Sub_metering_2 , type="l", col="red"))
with(consum, lines(datetime, Sub_metering_3, type="l", col="blue"))
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=1, col=c("black", "red", "blue"))

# plot4
with(consum, plot(datetime, Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power"))

dev.off()
