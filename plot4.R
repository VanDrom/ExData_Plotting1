## This program creates the plot of four plots : plot2 and plot 3 
## and the voltage and global reactive power in function of time 

# Reading and format setting of the data
library(lubridate)
data <- read.table("household_power_consumption.txt",sep=";",skip=66637,nrows=2880,na.strings="?",stringsAsFactors=FALSE)
data$V1 <- as.Date(data$V1,format="%d/%m/%Y",tz="UTC")
data$V2 <- strptime(data$V2,format="%H:%M:%S",tz="UTC")
colnames(data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

# Plot
Sys.setlocale("LC_TIME", "English") ## To avoid dates in Japanese
startday <- as.character(wday(data$Date[1],label=TRUE))
secondday <- as.character(wday(data$Date[2880],label=TRUE))
endday <- as.character(wday(data$Date[2880]+1,label=TRUE))

par(mfcol = c(2,2)) # four vignette format

## plot 1
plot(data$Global_active_power,type="l", xlab = "",ylab = "Global Active Power",axes=FALSE)
box()
axis(2)
ticks = c(0,1440,2880)
axis(side=1,at = ticks,labels=c(startday,secondday,endday))

## plot 2
plot(data$Sub_metering_1,type="l", xlab = "",ylab = "Energy sub metering",axes=FALSE)
box()
axis(2)
ticks = c(0,1440,2880)
axis(side=1,at = ticks,labels=c(startday,secondday,endday))
lines(data$Sub_metering_2,type="l",axes=FALSE,col="red")
lines(data$Sub_metering_3,type="l",axes=FALSE,col="blue")
legend("topright",pch="-",col = c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty = "n")

## plot 3
plot(data$Voltage,type="l",xlab = "datetime",ylab = "Voltage",axes=FALSE)
box()
axis(2)
ticks = c(0,1440,2880)
axis(side=1,at = ticks,labels=c(startday,secondday,endday))

## plot 4
plot(data$Global_reactive_power,type="l",xlab = "datetime",ylab = "Global_reactive_power",axes=FALSE)
box()
axis(2)
ticks = c(0,1440,2880)
axis(side=1,at = ticks,labels=c(startday,secondday,endday))


# Creation of .png file
png(file="plot4.png",width=480,height=480)
par(mfcol = c(2,2))
## plot 1
plot(data$Global_active_power,type="l", xlab = "",ylab = "Global Active Power",axes=FALSE)
box()
axis(2)
ticks = c(0,1440,2880)
axis(side=1,at = ticks,labels=c(startday,secondday,endday))
## plot 2
plot(data$Sub_metering_1,type="l", xlab = "",ylab = "Energy sub metering",axes=FALSE)
box()
axis(2)
ticks = c(0,1440,2880)
axis(side=1,at = ticks,labels=c(startday,secondday,endday))
lines(data$Sub_metering_2,type="l",axes=FALSE,col="red")
lines(data$Sub_metering_3,type="l",axes=FALSE,col="blue")
legend("topright",pch="-",col = c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty = "n")
## plot 3
plot(data$Voltage,type="l",xlab = "datetime",ylab = "Voltage",axes=FALSE)
box()
axis(2)
ticks = c(0,1440,2880)
axis(side=1,at = ticks,labels=c(startday,secondday,endday))
## plot 4
plot(data$Global_reactive_power,type="l",xlab = "datetime",ylab = "Global_reactive_power",axes=FALSE)
box()
axis(2)
ticks = c(0,1440,2880)
axis(side=1,at = ticks,labels=c(startday,secondday,endday))
dev.off()
