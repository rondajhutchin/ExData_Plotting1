#Read in the data after downloading into a text file in working directory
PowerData <- read.table("household_power_consumption.txt",skip=1,sep=";")

##Get names and subset of data
names(PowerData) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subPowerData <- subset(PowerData,PowerData$Date=="1/2/2007" | PowerData$Date =="2/2/2007")

