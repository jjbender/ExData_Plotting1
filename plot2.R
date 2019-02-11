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
png("plot2.png", width=480, height=480)
plot(consum$datetime,consum$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power(kilowatts)")
dev.off()
