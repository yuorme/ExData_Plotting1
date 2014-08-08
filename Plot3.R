#### R Script for generating Assignment1 - Plot3.png #####

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

#plots histogram using png
png(filename = "ExData_Plotting1/Plot3.png", width = 480, height = 480)
plot(x = power[[1]], y = power[[7]], type = "l", xlab = "", ylab = "Energy sub-metering") # creates plot with submeter_1
points(x = power[[1]], y = power[[8]], type = "l", col = "red") # adds submeter_2
points(x = power[[1]], y = power[[9]], type = "l", col = "blue") # adds submeter_3
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()