## Creating plot3.png showing multiple plots
## The plot shows energy usage over 2-day period: 2007-02-01 and 2007-02-02
## topleft: similar to plot1, without title
## topright: Voltage over time
## bottomleft: similar to plot2
## bottomright: Global_reactive_power

## Loading the data
raw4 <- read.csv("household_power_consumption.txt",sep = ";")

raw4[,1] <- as.character(raw4[,1])
raw4[,2] <- as.character(raw4[,2])
timeinstr <- paste(raw4[,1],raw4[,2],sep = " ") # the time in string format
ra4w[,1] <- as.Date(raw4[,1],"%d/%m/%Y")

raw4[,3] <- as.numeric(as.character(raw4[,3])) # "Global Active Power" to numeric
raw4[,4] <- as.numeric(as.character(raw4[,4])) # Global_reactive_power
raw4[,5] <- as.numeric(as.character(raw4[,5])) # Voltage
raw4[,7] <- as.numeric(as.character(raw4[,7])) # Sub_metering_1
raw4[,8] <- as.numeric(as.character(raw4[,8])) # Sub_metering_2
raw4[,9] <- as.numeric(as.character(raw4[,9])) # Sub_metering_3

boolvec <- raw$Date>=as.Date("01/02/2007","%d/%m/%Y") &raw$Date<=as.Date("02/02/2007","%d/%m/%Y")

par(mfrow=c(2,2)) # panel of 2x2 figures
# topleft
hist(raw4$Global_active_power[boolvec],col="red",ylab="Global Active Power",main="",xlab="")
# topright
plot(as.POSIXct(timeinstr[boolvec],format="%d/%m/%Y %T"),raw4$Voltage[boolvec],type="l",ylab="Voltage",xlab="datetime")
# bottomleft
plot(as.POSIXct(timeinstr[boolvec],format="%d/%m/%Y %T"),raw4$Sub_metering_1[boolvec],type="l",col='black',ylab="Energy sub metering",xlab="")
lines(as.POSIXct(timeinstr[boolvec],format="%d/%m/%Y %T"),raw4$Sub_metering_2[boolvec],type="l",col='red',ylab="Energy sub metering",xlab="")
lines(as.POSIXct(timeinstr[boolvec],format="%d/%m/%Y %T"),raw4$Sub_metering_3[boolvec],type="l",col='blue',ylab="Energy sub metering",xlab="")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c('black','red','blue'),bty="n")
# bottomright
plot(as.POSIXct(timeinstr[boolvec],format="%d/%m/%Y %T"),raw4$Global_reactive_power[boolvec],type="l",ylab="Global_reactive_power",xlab="datetime")
# saving the multiple plots in a png file
dev.copy(png, file="plot4.png")  # 480x480 by default
dev.off()
