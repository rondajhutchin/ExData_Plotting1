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

## set graphs to be 2 by 2
par(mfrow=c(2,2))

# plot all 4 graphs at once using basic plot and "with" function
with( subPowerData,{
  plot( subPowerData$Time,as.numeric(as.character( subPowerData$Global_active_power)),type="l",  xlab="",ylab="Global Active Power")  
  plot( subPowerData$Time,as.numeric(as.character( subPowerData$Voltage)), type="l",xlab="datetime",ylab="Voltage")
  plot( subPowerData$Time, subPowerData$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
  with( subPowerData,lines(Time,as.numeric(as.character(Sub_metering_1))))
  with( subPowerData,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
  with( subPowerData,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
  legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.6)
  plot( subPowerData$Time,as.numeric(as.character( subPowerData$Global_reactive_power)),type="l",xlab="datetime",ylab="Global_reactive_power")
})

## Saving to file plot4.png
dev.copy(png, file="plot4.png", height=480, width=880)
dev.off()

