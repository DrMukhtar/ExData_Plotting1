## Creating plot2.png showing a plot of Global Active Power
## The plot shows energy usage over 2-day period: 2007-02-01 and 2007-02-02

## Loading the data
raw2 <- read.csv("household_power_consumption.txt",sep = ";")

raw2[,1] <- as.character(raw2[,1])
raw2[,2] <- as.character(raw2[,2])
timeinstr <- paste(raw2[,1],raw2[,2],sep = " ") # the time in string format
raw2[,1] <- as.Date(raw2[,1],"%d/%m/%Y") # conversion to Date

## Boolean Marker for the 2-day period
boolvec2 <- raw2$Date>=as.Date("01/02/2007","%d/%m/%Y") & raw2$Date<=as.Date("02/02/2007","%d/%m/%Y")

raw2[,3] <- as.numeric(as.character(raw2[,3])) # "Global Active Power" to numeric

## The plot saved in plot2.png
## y-axis: Global Active Power (kilowatts)
plot(as.POSIXct(timeinstr[boolvec2],format="%d/%m/%Y %T"),raw2$Global_active_power[boolvec2],type="l",ylab="Global Active Power (kilowatts)",xlab="")
dev.copy(png, file="plot2.png") # 480x480 by default
dev.off()