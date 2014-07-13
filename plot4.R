plot4 <- function(){
	url<- "http://archive.ics.uci.edu/ml/machine-learning-databases/00235/household_power_consumption.zip"
	download.file(url,"./hpc.zip")
	unzip("./hpc.zip")
	data <- read.table(pipe('findstr /B /R ^[1-2]/2/2007 household_power_consumption.txt'),header=F, sep=';')
	colnames(data) <-names(read.table('household_power_consumption.txt', header=TRUE,sep=";",nrows=1))
	png(file = "plot4.png",width = 480, height = 480)
	par(mfrow = c(2,2))
	plot(data$Time,data$Global_active_power,ylab="Global Active Power (kilowatts)",xlab="", type="l")
	plot(data$Time,data$Voltage,ylab="Voltage",xlab="datetime", type="l")
	plot(data$Time, data$Sub_metering_1, type = "l", xlab = "",ylab = "Energy sub metering")
	lines(data$Time, data$Sub_metering_2,col="red")	
	lines(data$Time, data$Sub_metering_3,col="blue")
	legend("topright", c("Sub_metering_1 ","Sub_metering_2","Sub_metering_3"),lwd=c(1,1,1),col=c("black", "red","blue"),bty="n")
	plot(data$Time, data$Global_reactive_power,xlab = "datetime",ylab="Global_reactive_power", type = "l")
	dev.off()
}
