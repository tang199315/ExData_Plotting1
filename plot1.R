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
png(file = "plot1.png", width = 480, height = 480)
par(mfrow = c(1,1))
hist(subtable$Global_active_power, xlab = "Global Active Power (kilowatts)", col = "red",
     main = "Global Active Power")
dev.off()

