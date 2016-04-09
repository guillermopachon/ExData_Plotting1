### EXPLORATORY DATA ANALYSIS
## COURSE PROJECT 1

# The following code can be run as long as the data 
# “Individual household electric power consumption Data Set” is in the working directory

# The activities this script do:

# 1.Loads the required data (dates 2007-02-01 and 2007-02-02)
# 2.Generate needed dataset
# 3.Set the plot row, col
# 4.Construct the 4 plots and save it to a PNG file.

## Then:

# 1. Load required data:
data <- read.table(unz("exdata_data_household_power_consumption.zip", "household_power_consumption.txt"), 
                   header=T, quote="", sep=";", na.strings = c("?"))

# 2. Subset the data
mydata <- subset(data, Date %in% c("1/2/2007","2/2/2007"))
mydata <- na.omit(mydata)

# Calculate new DateTime column
mydata$DateTime <- strptime(paste(mydata$Date, mydata$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")

# 3. Set 
png(filename = "plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))

# 4. Construct the plots
# 4.1 Plot 1
plot(mydata$DateTime, mydata$Global_active_power, xlab = "", ylab = "Global Active Power", type = "n")
lines(mydata$DateTime, mydata$Global_active_power)

# 4.2 Plot 2
plot(mydata$DateTime, mydata$Voltage, xlab = "datetime", ylab = "Voltage", type = "n")
lines(mydata$DateTime, mydata$Voltage)

# 4.3 Plot 3
plot(mydata$DateTime, mydata$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "n")
lines(mydata$DateTime, mydata$Sub_metering_1)
lines(mydata$DateTime, mydata$Sub_metering_2, col = "red")
lines(mydata$DateTime, mydata$Sub_metering_3, col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")

# 4.4 Plot 4
plot(mydata$DateTime, mydata$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type = "n")
lines(mydata$DateTime, mydata$Global_reactive_power)

dev.off()

# Note: x-axis names from spanish because of my operating system language

## END OF FILE