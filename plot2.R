plot2 <- function(){
	url<- "http://archive.ics.uci.edu/ml/machine-learning-databases/00235/household_power_consumption.zip"
	download.file(url,"./hpc.zip")
	unzip("./hpc.zip")
	data <- read.table(pipe('findstr /B /R ^[1-2]/2/2007 household_power_consumption.txt'),header=F, sep=';')
	colnames(data) <-names(read.table('household_power_consumption.txt', header=TRUE,sep=";",nrows=1))
	data$Time <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
	png(file = "plot2.png",width = 480, height = 480)
	plot(data$Time,data$Global_active_power,ylab="Global Active Power (kilowatts)",xlab="", type="l")
	dev.off()
}