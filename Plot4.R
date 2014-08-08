#### R Script for generating Assignment1 - Plot4.png #####

#loads data.table which contains the fread(), a faster version of read.table()
library(data.table)

# reads file into dataframe
setwd("~/coursera/lectures/4-ExploratoryAnalysis/Assignment1/")
fileLoc <- "~/coursera/lectures/4-ExploratoryAnalysis/Assignment1/household_power_consumption.txt"
power <- fread(fileLoc, sep = ";", na.strings="?", 
        skip = 66637, nrows = 2880) #extracts 1/2/2007 to 2/2/2007, no headings

# creates a POSIXlt time variable for x-axis of plot
dateString <- paste(power[[1]],power[[2]]) #concatenates date and time columns
power[[1]] <- strptime(dateString, "%d/%m/%Y %H:%M:%S") #converts to POSIXlt format

#plots a 2x2 matrix populating column-wise
png(filename = "ExData_Plotting1/Plot4.png", 
    width = 480, height = 480, type = "cairo") # type="cairo" allows lwd < 1 for use in bottom-right plot
par(mfcol=c(2, 2))

#top-left: from Plot2.png
plot(x = power[[1]], y = power[[3]], 
     type = "l", xlab = "", ylab = "Global Active Power")

#bottom-left: from Plot3.png
plot(x = power[[1]], y = power[[7]], type = "l", xlab = "", ylab = "Energy sub-metering")
points(x = power[[1]], y = power[[8]], type = "l", col = "red") 
points(x = power[[1]], y = power[[9]], type = "l", col = "blue") 
legend("topright", bty = "n", lty = 1, col = c("black", "red", "blue"), # bty="n" turns the legend box off.
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#top-right: Voltage over time
plot(x = power[[1]], y = power[[5]], 
     type = "l", xlab = "datetime", ylab = "Voltage")

#bottom-right: Global reactive power over time
plot(x = power[[1]], y = power[[4]], type = "o", xlab = "datetime", ylab = "Global_reactive_power", 
     lwd = 0.7, pch = ".") # lwd=0.7, pch=".", and type="o" is what I found to best match example output

dev.off()