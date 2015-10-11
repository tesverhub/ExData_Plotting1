setwd("~/CloudStation/Coursera/Exploratory_data_analysis/ExData_Plotting1")
data <- read.csv("household_power_consumption.txt", sep=";", na.strings="?",skip= 66636,nrows= 2881, col.names = colnames(read.csv("household_power_consumption.txt", sep=";", nrow = 1,header = TRUE)))

data$Date_Time <- strptime(paste(data$Date, data$Time),"%d/%m/%Y %H:%M:%S")
data$Day <- strftime(data$Date_Time,"%a")

png(filename = "plot2.png", width = 480, height = 480)
plot(data$Global_active_power, type = "n", xaxt = "n", xlab = "",ylab = "Global Active Power (kilowatts)")
lines(data$Global_active_power)
axis(1,at = which(data$Time == "00:00:00"), labels = unique(data$Day))
dev.off() 