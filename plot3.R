# Exploratory Data Analysis
# Plotting Assignment 1
# Plot 3

# Set working directory
setwd("D:/Oscar/Data Science Specialization/Exploratory Data Analysis/Project 1")

# Filedownload code on plot1.R file
fileName <- "household_power_consumption.txt"

# Read file using data.table package
library(data.table) # Load data.table package
dropCols <- c("Global_reactive_power", "Voltage", "Global_intensity")
data <- fread(fileName, na.strings = "?", drop = dropCols)

# Manipulate data
data <- data[data$Date %in% c("1/2/2007","2/2/2007"), ] # Subset file using data.table pacakge
data[, DateTime:= paste(data$Date, data$Time, sep = "")] # Merge Date and Time in new variable
data[, DateTime:= strptime(DateTime, "%d/%m/%Y%H:%M:%S", tz = "")] # Change DateTime format: from character to POSIXct
data[, c("Date", "Time"):= NULL] # Delete Date and Time columns

# Create PNG file
png("plot3.png", width = 480, height = 480)
with(data, plot(DateTime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))
with(data, lines(DateTime, Sub_metering_2, type = "l", col = "red"))
with(data, lines(DateTime, Sub_metering_3, type = "l", col = "blue"))
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2.5, col = c("black", "red", "blue"))
dev.off()