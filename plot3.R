library("dplyr")
library("lubridate")
# Read data from file
dataFile <- "./data/household_power_consumption.txt"
dataset <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors = FALSE)

Date1 <- ymd("2007-02-01")
Date2 <- ymd("2007-02-02")

# Extract Subset of data based on the given dates
subset3 <- filter(dataset, dmy(Date) %in% c(Date1, Date2))
rm(dataset) #remove dataset from memory
str(subset3) #check the internal structure of the subset

dt <- with(subset3, dmy_hms(paste(Date, Time)))
subMetering1 <- as.numeric(subset3$Sub_metering_1)
subMetering2 <- as.numeric(subset3$Sub_metering_2)
subMetering3 <- as.numeric(subset3$Sub_metering_3)


# Construct a Scatter Plot #3 on all Sub-meterings (3-layers)
png("plot3.png", width=480, height=480)
plot (dt, subMetering1, type="l",  col="black", xlab="", ylab="Energy sub metering")
lines(dt, subMetering2, type="l", col="red")
lines(dt, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1, lwd=2)
dev.off()	
