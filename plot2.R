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
png(file = "plot2.png", width = 480, height = 480)
par(mfrow = c(1,1))
plot(as.numeric(subtable$Global_active_power) ~ as.POSIXct(subtable$StandardTime) , 
     type = 'l', ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()

