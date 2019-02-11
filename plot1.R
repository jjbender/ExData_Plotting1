rm(list=ls())
setwd("C:\\Users\\nikol\\Dropbox\\coursera\\exploratory_analysis\\week1project")

consum <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", dec = ".", na.strings = "?", stringsAsFactors = FALSE)
dim(consum)
consum <- consum[consum$Date %in% c("1/2/2007", "2/2/2007"), ]
dim(consum)
head(consum)
png("plot1.png", width=480, height=480)
hist(consum$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power(kilowatts)", ylab = "Frequency")
dev.off()
