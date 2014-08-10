# Plot 1: Histogram of Global Active Power
#         for February 1, 2007 and February 2, 2007

# Use the sqldf package to only import data necessary to create the plot
library(sqldf)
fileName <- "household_power_consumption.txt"
selectClause <- "SELECT Global_active_power"
fromClause <- "FROM file"
whereClause <- "WHERE Date IN ('1/2/2007', '2/2/2007')"
sqlQuery <- paste(selectClause, fromClause, whereClause)
df <- read.csv.sql(fileName, sqlQuery, sep=";")

# Create plot from data and save to PNG file
png(file = "plot1.png")
hist(df[, 1], col = "Red", main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")
dev.off()