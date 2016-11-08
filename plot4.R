library("dplyr")
library("lubridate")
# Read data from file
dataFile <- "./data/household_power_consumption.txt"
dataset <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors = FALSE)

Date1 <- ymd("2007-02-01")
Date2 <- ymd("2007-02-02")

# Extract Subset of data based on the given dates
subset4 <- filter(dataset, dmy(Date) %in% c(Date1, Date2))
rm(dataset) #remove dataset from memory
str(subset4) #check the internal structure of the subset

dt <- with(subset4, dmy_hms(paste(Date, Time)))

# Extract subsets for plotting 
subMetering1 <- as.numeric(subset4$Sub_metering_1)
subMetering2 <- as.numeric(subset4$Sub_metering_2)
subMetering3 <- as.numeric(subset4$Sub_metering_3)

gbActPower <- as.numeric(subset4$Global_active_power)
gbReActPower <- as.numeric(subset4$Global_reactive_power)

voltage <- as.numeric(subset4$Voltage)

dt <- with(subset4, dmy_hms(paste(Date, Time)))

subMetering1 <- as.numeric(subset4$Sub_metering_1)
subMetering2 <- as.numeric(subset4$Sub_metering_2)
subMetering3 <- as.numeric(subset4$Sub_metering_3)

# Open graphics device
png("plot4.png", width=480, height=480)

# split the area into 2x2 regions 
par(mfrow = c(2, 2)) 

#Row 1, column 1
plot(dt, gbActPower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

#Row 1, column 2
plot(dt, voltage, type="l", xlab="datetime", ylab="Voltage")

#Row 2, column 1
plot (dt, subMetering1, type="l", col="black", ylab="Energy sub metering", xlab="")
lines(dt, subMetering2, type="l", col="red")
lines(dt, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),  col=c("black", "red", "blue"), lty=, lwd=2, bty="n")

#Row 2, column 2
plot(dt, gbReActPower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
