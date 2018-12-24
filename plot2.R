# Exploratory Data Analysis
# Plotting Assignment 1
# Plot 2

# Set working directory
setwd("D:/Oscar/Data Science Specialization/Exploratory Data Analysis/Project 1")

# Filedownload code on plot1.R file
fileName <- "household_power_consumption.txt"

# Read file using data.table package
library(data.table) # Load data.table package
dropCols <- c("Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
data <- fread(fileName, na.strings = "?", drop = dropCols)

# Manipulate data
data <- data[data$Date %in% c("1/2/2007","2/2/2007"), ] # Subset file using data.table pacakge
data[, DateTime:= paste(data$Date, data$Time, sep = "")] # Merge Date and Time in new variable
data[, DateTime:= strptime(DateTime, "%d/%m/%Y%H:%M:%S", tz = "")] # Change DateTime format: from character to POSIXct
data[, c("Date", "Time"):= NULL] # Delete Date and Time columns

# Create PNG file
png("plot2.png", width = 480, height = 480)
plot(data$DateTime, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()