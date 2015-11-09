data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

subSetData2 <- data.frame(subSetData, datetime = strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S"))
data2_1 <- transform(subSetData2, Date = as.Date(Date, format="%d/%m/%Y"), Time = strptime(Time, format="%I:%M:%S"), Global_active_power = as.numeric(Global_active_power))
png("plot2.png", width=480, height=480)
plot(data2_1$datetime, data2_1$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
