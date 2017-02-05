library(dplyr)

# Read the file into a data frame.
data = read.table("../../household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")

# Filter for Date either equal to Feb 1 2007 or Feb 2 2007
subsetData <- data %>% filter ((Date == "1/2/2007" | Date == "2/2/2007") & Global_active_power !=  "?")

# Create a new column called DateTime
subsetData$DateTime <- strptime(paste0(subsetData$Date, " ", subsetData$Time), format = "%d/%m/%Y %H:%M:%S")
dateTime <- subsetData$DateTime

# Convert to numeric the column Global_active_power from character
globalActivePower <- as.numeric(subsetData$Global_active_power)

# Convert to numeric the column Sub_metering_1 from character
subMetering1 <- as.numeric(subsetData$Sub_metering_1)

# Convert to numeric the column Sub_metering_2 from character
subMetering2 <- as.numeric(subsetData$Sub_metering_2)

# Convert to numeric the column Sub_metering_3 from character
subMetering3 <- as.numeric(subsetData$Sub_metering_3)

# Open the png device
png("plot3.png", width=480, height=480)

# Create the Plot
plot(dateTime, subMetering1, type="l", ylab="Energy sub metering", xlab="", col="black")
lines(dateTime, subMetering2, type="l", col="red")
lines(dateTime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

# Turn off the graphics device png
dev.off()
