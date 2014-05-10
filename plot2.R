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
png(file = "plot2.png", width = 480, height = 480)
plot(x= myData$Timevar, y = myData$Global_active_power, main = "", type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
