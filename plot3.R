data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

subSetData2 <- data.frame(subSetData, datetime = strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S"))
data2_3 <- transform(subSetData2, Date = as.Date(Date, format="%d/%m/%Y"), Time = strptime(Time, format="%I:%M:%S"), Global_active_power = as.numeric(Global_active_power), Sub_metering_1 = as.numeric(Sub_metering_1), Sub_metering_2 = as.numeric(Sub_metering_2), Sub_metering_3 = as.numeric(Sub_metering_3))
png("plot3.png", width=480, height=480)
plot(data2_3$datetime, data2_3$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(data2_3$datetime, data2_3$Sub_metering_2, type="l", col="red")
lines(data2_3$datetime, data2_3$Sub_metering_3, type="l", col="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1, lwd=2.5)
