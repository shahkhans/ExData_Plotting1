library("dplyr")
library("lubridate")

# Read data from file
dataFile <- "./data/household_power_consumption.txt"
dataset <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors = FALSE)

Date1 <- ymd("2007-02-01")
Date2 <- ymd("2007-02-02")

# Extract Subset of data based on the given dates
subset1 <- filter(dataset, dmy(Date) %in% c(Date1, Date2))
rm(dataset) #remove dataset from memory
str(subset1) #check the internal structure of the subset

# Construct plot #1 as a histogram
png(filename="plot1.png", width=480, height=480)
hist(as.numeric(subset1$Global_active_power), main ="Global Active Power", col="red", xlab="Global Active Power (kilowatts)")
dev.off()