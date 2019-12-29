## Creating plot3.png showing simultaneous plots of Energy sub metering
## The plot shows energy usage over 2-day period: 2007-02-01 and 2007-02-02

## Loading the data
raw3 <- read.csv("household_power_consumption.txt",sep = ";")

raw3[,1] <- as.character(raw3[,1])
raw3[,2] <- as.character(raw3[,2])
timeinstr <- paste(raw3[,1],raw3[,2],sep = " ") # the time in string format
raw3[,1] <- as.Date(raw3[,1],"%d/%m/%Y")

raw3[,7] <- as.numeric(as.character(raw3[,7])) # Sub_metering_1
raw3[,8] <- as.numeric(as.character(raw3[,8])) # Sub_metering_2
raw3[,9] <- as.numeric(as.character(raw3[,9])) # Sub_metering_3

## Boolean Marker for the 2-day period
boolvec3 <- raw3$Date>=as.Date("01/02/2007","%d/%m/%Y") & raw3$Date<=as.Date("02/02/2007","%d/%m/%Y")

## The plot saved in plot3.png
plot(as.POSIXct(timeinstr[boolvec3],format="%d/%m/%Y %T"),raw3$Sub_metering_1[boolvec],type="l",col='black',ylab="Energy sub metering",xlab="")
lines(as.POSIXct(timeinstr[boolvec3],format="%d/%m/%Y %T"),raw3$Sub_metering_2[boolvec],type="l",col='red',ylab="Energy sub metering",xlab="")
lines(as.POSIXct(timeinstr[boolvec3],format="%d/%m/%Y %T"),raw3$Sub_metering_3[boolvec],type="l",col='blue',ylab="Energy sub metering",xlab="")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c('black','red','blue'))
dev.copy(png, file="plot3.png") # 480x480 by default
dev.off()
