#This script creates the png file of plot1, 
#based on the household_power_consumption.txt file 
#that should be located in the same directory as this R file

alldata <- read.csv("household_power_consumption.txt", sep=";")
epc <- subset(alldata, Date == "1/2/2007" | Date == "2/2/2007")
hist(as.numeric(epc$Global_active_power), 12, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.copy(png, file= "plot1.png")
dev.off()