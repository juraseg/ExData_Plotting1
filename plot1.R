# read data
filename <- 'household_power_consumption.txt'
household <- read.csv(filename, sep=";", na.strings="?")
# transform date time
household$datetime <- strptime(paste(household$Date, household$Time, ' '), '%d/%m/%Y %H:%M:%S')
household$Date <- as.Date(strptime(household$Date, '%d/%m/%Y'))
# take only records with date = 2007-02-01 or 2007-02-02
household <- household[(household$Date == as.Date('2007-02-01') | household$Date == as.Date('2007-02-02')), ]

# draw plot
png(filename = "plot1.png")
hist(household$Global_active_power, col="red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()
