## This program creates the histogram of global active power

# Reading and format preparation of the data
library(lubridate)
data <- read.table("household_power_consumption.txt",sep=";",skip=66637,nrows=2880,na.strings="?",stringsAsFactors=FALSE)
data$V1 <- as.Date(data$V1,format="%d/%m/%Y",tz="UTC")
data$V2 <- strptime(data$V2,format="%H:%M:%S",tz="UTC")
colnames(data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

# Histogram
GAP <- data$Global_active_power
hist(GAP, col="red", main="Global Active Power",xlab = "Global Active Power (kilowatts)")

# Creation of .png file
dev.copy(png,file="plot1.png")
dev.off()
