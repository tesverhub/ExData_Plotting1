setwd("~/CloudStation/Coursera/Exploratory_data_analysis/ExData_Plotting1")

zipfile <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",zipfile)
data <- read.table(unz(zipfile, "household_power_consumption.txt"), sep=";", na.strings="?",skip= 66637,nrows= 2880, col.names = colnames(read.table(unz(zipfile, "household_power_consumption.txt"), sep=";", nrow = 1,header = TRUE)))
unlink(zipfile)

png(filename = "plot1.png", width = 480, height = 480)

hist(data$Global_active_power, xlab = "Global Active Power (kilowatts)", main = "Global Active Power",ylab = "Frequency", col = "red")

dev.off()  