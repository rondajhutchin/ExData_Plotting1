#Read in the data after downloading into a text file in working directory
PowerData <- read.table("household_power_consumption.txt",skip=1,sep=";")

##Get names and subset of data
names(PowerData) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subPowerData <- subset(PowerData,PowerData$Date=="1/2/2007" | PowerData$Date =="2/2/2007")


## format the date
subPowerData$Date <- as.Date(subPowerData$Date, format="%d/%m/%Y")
subPowerData$Time <- strptime(subPowerData$Time, format="%H:%M:%S")
subPowerData[1:1440,"Time"] <- format(subPowerData[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subPowerData[1441:2880,"Time"] <- format(subPowerData[1441:2880,"Time"],"2007-02-02 %H:%M:%S")


# Plot the data using plot basic function and label x and y axis
plot(subPowerData$Time,as.numeric(as.character(subPowerData$Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)") 

## Saving to file plot2.png
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()


