## Load data
table <- read.table("household_power_consumption.txt", na.strings = "?", dec = ".", 
                    sep = ";", header = TRUE)
subtable <- table[ table$Date == '1/2/2007' | table$Date == '2/2/2007', ]

##Time Conversion
date_segment <- as.character(subtable$Date)
time_segment <- as.character(subtable$Time)
time_char <- paste(date_segment, time_segment)
time_list <- strptime(time_char, "%d/%m/%Y %T")
subtable$StandardTime <- time_list

##Plotting with base plotting system
png(file = "plot3.png", width = 480, height = 480)
par(mfrow = c(1,1))
plot(as.numeric(subtable$Sub_metering_1) ~ as.POSIXct(subtable$StandardTime), 
     type = 'n', ylab = "Energy sub metering", xlab = "")
lines(as.numeric(subtable$Sub_metering_1) ~ as.POSIXct(subtable$StandardTime))
lines(as.numeric(subtable$Sub_metering_2) ~ as.POSIXct(subtable$StandardTime),
      col = "red")
lines(as.numeric(subtable$Sub_metering_3) ~ as.POSIXct(subtable$StandardTime),
      col = "blue")
legend(x = "topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "green"), lwd=1, pch=c(NA,NA,NA))
dev.off()

