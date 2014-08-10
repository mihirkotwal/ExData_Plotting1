# Plot 4: Multiple Time Series Plots
#         for February 1, 2007 and February 2, 2007

# Use the sqldf package to only import data necessary to create the plots
library(sqldf)
fileName <- "household_power_consumption.txt"
selectClause <- "SELECT Date || ' ' || Time AS dt, Global_active_power,
                Global_reactive_power, Voltage, Sub_metering_1,
                Sub_metering_2, Sub_metering_3"
fromClause <- "FROM file"
whereClause <- "WHERE Date IN ('1/2/2007', '2/2/2007')"
sqlQuery <- paste(selectClause, fromClause, whereClause)
df <- read.csv.sql(fileName, sqlQuery, sep=";")

# Convert dates and times represented as strings to datetime objects
df[, 1] <- as.POSIXct(strptime(df[, 1], "%d/%m/%Y %H:%M:%S"))

# Create plots from data and save to PNG file
png(file = "plot4.png")
par(mfrow=c(2, 2))
plot(x = df[, 1], y = df[, 2], type = "l", xlab = "",
     ylab = "Global Active Power")
plot(x = df[, 1], y = df[, 4], type = "l", xlab = "datetime",
     ylab = "Voltage")
plot(x = df[, 1], y = df[, 5], type = "l", xlab = "",
     ylab = "Energy sub metering")
lines(x = df[, 1], y = df[, 6], col = "Red")
lines(x = df[, 1], y = df[, 7], col = "Blue")
legend("topright", legend = colnames(df)[5:7],
       col = c("Black", "Red", "Blue"), bty = "n", lty = 1)
plot(x = df[, 1], y = df[, 3], type = "l", xlab = "datetime",
     ylab = "Global_reactive_power")
dev.off()
