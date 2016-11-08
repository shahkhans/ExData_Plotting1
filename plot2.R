library("dplyr")
library("lubridate")
# Read data from file
dataFile <- "./data/household_power_consumption.txt"
dataset <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors = FALSE)

Date1 <- ymd("2007-02-01")
Date2 <- ymd("2007-02-02")

# Extract Subset of data based on the given dates
subset2 <- filter(dataset, dmy(Date) %in% c(Date1, Date2))
rm(dataset) #remove dataset from memory
str(subset2) #check the internal structure of the subset

# Construct a Scatter Line Plot #2
y_axis <- "Global Active Power (kilowatts)"
mtitle <- "Global Active Power"
png(filename="plot2.png", width=480, height=480)
with(subset2, plot(dmy_hms(paste(Date, Time)), as.numeric(Global_active_power), type = "l", main = mtitle, ylab=y_axis, xlab = ""))

dev.off()