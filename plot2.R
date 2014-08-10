# Plot 2: Time Series Plot of Global Active Power
#         for February 1, 2007 and February 2, 2007

# Use the sqldf package to only import data necessary to create the plot
library(sqldf)
fileName <- "household_power_consumption.txt"
selectClause <- "SELECT Date || ' ' || Time AS dt, Global_active_power"
fromClause <- "FROM file"
whereClause <- "WHERE Date IN ('1/2/2007', '2/2/2007')"
sqlQuery <- paste(selectClause, fromClause, whereClause)
df <- read.csv.sql(fileName, sqlQuery, sep=";")

# Convert dates and times represented as strings to datetime objects
df[, 1] <- as.POSIXct(strptime(df[, 1], "%d/%m/%Y %H:%M:%S"))

# Create plot from data and save to PNG file
png(file = "plot2.png")
plot(df, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
