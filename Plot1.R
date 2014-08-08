#### R Script for generating Assignment1 - Plot1.png #####

#loads data.table which contains the fread(), a faster version of read.table()
library(data.table)

# reads file into dataframe
setwd("~/coursera/lectures/4-ExploratoryAnalysis/Assignment1/")
fileLoc <- "~/coursera/lectures/4-ExploratoryAnalysis/Assignment1/household_power_consumption.txt"
power <- fread(fileLoc, sep = ";", na.strings="?", skip = 66637, nrows = 2880) #extracts 1/2/2007 to 2/2/2007, no headings

#plots histogram using png
png(filename = "ExData_Plotting1/Plot1.png", width = 480, height = 480)
hist(power[[3]], col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)") #power[[3]] selects Global_active_power
dev.off()