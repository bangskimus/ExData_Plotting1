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

# Open the png device
png("plot2.png", width=480, height=480)

# Create the Plot
plot(dateTime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

# Turn off the graphics device png
dev.off()
