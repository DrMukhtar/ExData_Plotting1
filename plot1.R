## Creating plot1.png showing a histogram of Global Active Power
## The plot shows energy usage over 2-day period: 2007-02-01 and 2007-02-02

## Loading the data
raw1 <- read.csv("household_power_consumption.txt",sep = ";")

raw1[,1] <- as.Date(as.character(raw1[,1]),"%d/%m/%Y") # conversion to Date
raw1[,3] <- as.numeric(as.character(raw1[,3])) # "Global Active Power" to numeric

## Boolean Marker for the 2-day period
boolvec <- raw1$Date>=as.Date("01/02/2007","%d/%m/%Y") & raw1$Date<=as.Date("02/02/2007","%d/%m/%Y")

## The histogram saved in plot1.png
## x-axis: Global Active Power (kilowatts)
## y-axis: Frequency
## Title: Global Active Power
hist(raw1$Global_active_power[boolvec],col="red", main = "Global Active Power",xlab="Global Active Power (kilowatts)")
dev.copy(png, file="plot1.png") # 480x480 by default
dev.off()