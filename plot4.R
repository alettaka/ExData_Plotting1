alldata <- read.csv("household_power_consumption.txt", sep=";")
epc <- subset(alldata, Date == "1/2/2007" | Date == "2/2/2007")
library(lubridate)
# my locale gives different weekday labels, therefore setting it to US
Sys.setlocale(category = "LC_ALL", locale = "en_US.UTF-8") 
epc$DateTime <- dmy(epc$Date) + hms(epc$Time)

epc$Sub_metering_1 <- as.numeric(epc$Sub_metering_1)
epc$Sub_metering_2 <- as.numeric(epc$Sub_metering_2)

png(filename = "plot4.png",
    width = 500, height = 500)

par(mfrow = c(2,2))
#top left
with(epc, plot(DateTime, as.numeric(epc$Global_active_power), type = "l",ylab = "Global Active Power", xlab=""))

#top right
with(epc, plot(DateTime, as.numeric(epc$Voltage), type = "l",
               ylab = "Voltage", xlab= "datetime"))

#bottom left
plot(epc$DateTime, epc$Sub_metering_1, type="l", col="black", lty=1, 
     ylab = "Energy sub metering", xlab="" )
lines(epc$DateTime, epc$Sub_metering_2, type="l", col="red", lty=1)
lines(epc$DateTime, epc$Sub_metering_3, type="l", col="blue", lty=1)
legend("topright", col=c("red","blue","black"), lty = c(1,1,1), bty = "n",
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#bottom right
with(epc, plot(DateTime, as.numeric(epc$Global_reactive_power), type = "l",
               ylab = "Global_reactive_power", xlab= "datetime"))
dev.off()