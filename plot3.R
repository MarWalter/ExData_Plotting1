Dir_data <- dir("exdata-data-household_power_consumption", full.names = TRUE)
energy_data <- read.csv(Dir_data, colClasses = "", sep = ";")
our_data <- subset(energy_data, Date == "1/2/2007" | Date == "2/2/2007")
our_data$Date <- paste(our_data$Date, our_data$Time)
our_data$Date <- strptime(our_data$Date, "%d/%m/%Y %H:%M:%S")
our_data$Sub_metering_1 <- as.numeric(our_data$Sub_metering_1)
our_data$Sub_metering_2 <- as.numeric(our_data$Sub_metering_2)
our_data$Sub_metering_3 <- as.numeric(our_data$Sub_metering_3)
with(our_data, plot(Date, Sub_metering_1, "l", xlab = "", ylab = "Energy sub metering"))
with(our_data, lines(Date, Sub_metering_2, "l", col = "red"))
with(our_data, lines(Date, Sub_metering_3, "l", col = "blue"))
legend("topright", lty =1, col = c("black", "blue", "red"), legend = c("Sub_metering_1",
                                                                       "Sub_metering_2",
                                                                       "Sub_metering_3"))