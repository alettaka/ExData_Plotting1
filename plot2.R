alldata <- read.csv("household_power_consumption.txt", sep=";")
epc <- subset(alldata, Date == "1/2/2007" | Date == "2/2/2007")
library(lubridate)
# my locale gives different weekday labels
Sys.setlocale(category = "LC_ALL", locale = "en_US.UTF-8") 
epc$DateTime <- dmy(epc$Date) + hms(epc$Time)

with(epc, plot(DateTime, as.numeric(epc$Global_active_power), type = "l",ylab = "Global Active Power (kilowatts)", xlab=""))
dev.copy(png, file= "plot2.png")
dev.off()
