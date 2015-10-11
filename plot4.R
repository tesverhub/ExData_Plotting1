
zipfile <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",zipfile)
data <- read.table(unz(zipfile, "household_power_consumption.txt"), sep=";", na.strings="?",skip= 66637,nrows= 2881, col.names = colnames(read.table(unz(zipfile, "household_power_consumption.txt"), sep=";", nrow = 1,header = TRUE)))
unlink(zipfile)

data$Date_Time <- strptime(paste(data$Date, data$Time),"%d/%m/%Y %H:%M:%S")
data$Day <- strftime(data$Date_Time,"%a")

png(filename = "plot4.png", width = 480, height = 480)

par(mfrow = c(2,2))

plot(data$Global_active_power, type = "n", xaxt = "n", xlab = "",ylab = "Global Active Power")
lines(data$Global_active_power)
axis(1,at = which(data$Time == "00:00:00"), labels = unique(data$Day))

plot(data$Voltage, type = "n", xaxt = "n", xlab = "datetime",ylab = "Voltage")
lines(data$Voltage)
axis(1,at = which(data$Time == "00:00:00"), labels = unique(data$Day))

plot(data$Sub_metering_1, type = "n", xaxt = "n", xlab = "",ylab = "Energy sub metering")
lines(data$Sub_metering_1)
lines(data$Sub_metering_2, col = "red")
lines(data$Sub_metering_3, col = "blue")
axis(1,at = which(data$Time == "00:00:00"), labels = unique(data$Day))
legend("topright", lty=1, col = c("black", "red", "blue"), legend = names(data)[7:9],bty = "n")

with(data, plot(Global_reactive_power, type = "n", xaxt = "n", xlab = "datetime"))
lines(data$Global_reactive_power)
axis(1,at = which(data$Time == "00:00:00"), labels = unique(data$Day))

dev.off() 