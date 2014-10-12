data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
data$Datetime <- as.POSIXct(paste(as.Date(data$Date), data$Time))

par(mfrow=c(2,2),mar=c(4,4,2,1), oma=c(0,0,2,0))

plot(data$Global_active_power~data$Datetime, type="l", ylab="Global Active Power", xlab="")

plot(data$Voltage~data$Datetime, type="l",ylab="Voltage", xlab="datetime")

plot(data$Sub_metering_1~data$Datetime, type="l",ylab="Energy sub metering", xlab="")
lines(data$Sub_metering_2~data$Datetime,col='Red')
lines(data$Sub_metering_3~data$Datetime,col='Blue')
legend('topright',  col=c("black", "red", "blue"), lty=1,  bty = "n", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(data$Global_reactive_power~data$Datetime, type="l",ylab="Global_rective_power",xlab="datetime")

dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()