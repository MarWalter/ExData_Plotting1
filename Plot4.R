## First Plot
Dir_data <- dir("exdata-data-household_power_consumption", full.names = TRUE)
energy_data <- read.csv(Dir_data, sep = ";")
our_data <- subset(energy_data, Date == "1/2/2007" | Date == "2/2/2007")
our_data$Date <- paste(our_data$Date, our_data$Time)
our_data$Date <- strptime(our_data$Date, "%d/%m/%Y %H:%M:%S")
our_data$Global_active_power <- as.numeric(our_data$Global_active_power)
plot(our_data$Date, our_data$Global_active_power, "l", xlab = "", ylab = "Global Active Power (kilowatts)")


## Second Plot
our_data$Voltage <- as.numeric(our_data$Voltage)


##Thrid Plot
our_data$Sub_metering_1 <- as.numeric(our_data$Sub_metering_1)
our_data$Sub_metering_2 <- as.numeric(our_data$Sub_metering_2)
our_data$Sub_metering_3 <- as.numeric(our_data$Sub_metering_3)


##Fourth Plot
our_data$Global_reactive_power <- as.numeric(our_data$Global_reactive_power)


##All together
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
with(our_data, {
        plot(Date, Global_active_power, "l", xlab = "", ylab = "Global Active Power (kilowatts)")
        plot(Date, Voltage, "l", xlab = "datetime", ylab = "Voltage")
        plot(Date, Sub_metering_1, "l", xlab = "", ylab = "Energy sub metering")
         lines(Date, Sub_metering_2, "l", col = "red")
         lines(Date, Sub_metering_3, "l", col = "blue")
         legend("topright", lty ="solid", cex =.8, col = c("black", "blue", "red"), legend = c("Sub_metering_1",
                                                                                      "Sub_metering_2",
                                                                                      "Sub_metering_3"))
        plot(Date, Global_reactive_power, "l", xlab = "datetime", ylab = "Global Reactive Power")
})