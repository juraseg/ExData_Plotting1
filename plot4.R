# read data
filename <- 'household_power_consumption.txt'
household <- read.csv(filename, sep=";", na.strings="?")
# transform date time
household$datetime <- strptime(paste(household$Date, household$Time, ' '), '%d/%m/%Y %H:%M:%S')
household$Date <- as.Date(strptime(household$Date, '%d/%m/%Y'))
# take only records with date = 2007-02-01 or 2007-02-02
household <- household[(household$Date == as.Date('2007-02-01') | household$Date == as.Date('2007-02-02')), ]

# draw plot
png(filename = "plot4.png")
par(mfrow = c(2, 2))
# Global active power plot
plot(household$datetime, household$Global_active_power, type="l", ylab = "Global Active Power", xlab = "")
# Voltage plot
plot(household$datetime, household$Voltage, type="l", ylab = "Voltage", xlab = "")
# Energy sub metering plot
plot(household$datetime, household$Sub_metering_1, type="l", ylab = "Energy sub metering", xlab = "")
points(household$datetime, household$Sub_metering_2, type="l", col="red")
points(household$datetime, household$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1, 1, 1), col=c("black", "red", "blue"))
# Global reactive power plot
plot(household$datetime, household$Global_reactive_power, type="l", ylab = "Global Reactive Power", xlab = "")
dev.off()
