setwd("~/CloudStation/Coursera/Exploratory_data_analysis/ExData_Plotting1")
data <- read.csv("household_power_consumption.txt", sep=";", na.strings="?",skip= 66636,nrows= 2879, col.names = colnames(read.csv("household_power_consumption.txt", sep=";", nrow = 1,header = TRUE)))

png(filename = "plot1.png", width = 480, height = 480)

hist(data$Global_active_power, xlab = "Global Active Power (kilowatts)", main = "Global Active Power",ylab = "Frequency", col = "red")

dev.off()  