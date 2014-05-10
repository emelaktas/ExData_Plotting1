# Set working directory - change this accordingly
setwd("/Users/emelaktas/ExData_Plotting1")

# The source data
myFile <- "household_power_consumption.txt"

# Load the sqldf package.
require ("sqldf")

# SQL query to select required range
mySql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"

# The data set to be used in plots
myData <- read.csv2.sql(myFile,mySql)

# Convert date - time variables to date and time
# Date
myData$Datevar <- as.Date(myData$Date, format = "%d/%m/%Y")

# Combine date and time 
myData$Timevar <- paste(myData$Datevar, myData$Time)

# Strip time
myData$Timevar <- strptime(myData$Timevar, format = "%Y-%m-%d %H:%M:%S")

# Save .png 
png(file = "plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))
plot(x= myData$Timevar, y = myData$Global_active_power, main = "", type = "l", xlab = "", ylab = "Global Active Power")
plot(x= myData$Timevar, y = myData$Voltage, main = "", type = "l", xlab = "datetime", ylab = "Voltage")
plot(x= myData$Timevar, y = myData$Sub_metering_1, main = "", type = "l", xlab = "", ylab = "Energy sub metering")
lines(x= myData$Timevar, y = myData$Sub_metering_2, col = "red", main = "", type = "l", xlab = "", ylab = "Energy sub metering")
lines(x= myData$Timevar, y = myData$Sub_metering_3, col = "blue", main = "", type = "l", xlab = "", ylab = "Energy sub metering")
legend("topright",cex=0.7, lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(x= myData$Timevar, y = myData$Global_reactive_power, main = "", type = "l", xlab = "datetime", ylab = "Global_reactive_ower")
dev.off()


