
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
data2_1 <- transform(subSetData, Date = as.Date(Date, format="%d/%m/%Y"), Time = strptime(Time, format="%I:%M:%S"), Global_active_power = as.numeric(Global_active_power))

png("plot1.png", width=480, height=480)
hist(data2_1$Global_active_power, col="red", main = paste("Global Active Power"), xlab = "Global Active Power (kilowatts)")
dev.off()