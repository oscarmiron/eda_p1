# Exploratory Data Analysis
# Plotting Assignment 1
# Plot 1

# Set working directory
setwd("D:/Oscar/Data Science Specialization/Exploratory Data Analysis/Project 1")

# Download file
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, "household_power_consumption.zip", method = "curl")
DateDownloaded <- date() # Date when the file was downloaded.
unzip("household_power_consumption.zip")
fileName <- "household_power_consumption.txt"

# Read file using data.table package
library(data.table) # Load data.table package
dropCols <- c("Time", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
data <- fread(fileName, na.strings = "?", drop = dropCols)

# Subset file using data.table pacakge
data <- data[data$Date %in% c("1/2/2007","2/2/2007"), ]

# Create PNG file
png("plot1.png", width = 480, height = 480)
hist(data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()