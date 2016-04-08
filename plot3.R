##read data table
data_1 <- read.table(data_file,header=TRUE, sep=';',stringsAsFactors=FALSE, dec=".")

datasub <-data_1 [data_1$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(datasub$Date, datasub$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalAPower <- as.numeric(datasub$Global_active_power)

submetering1 <- as.numeric(datasub$Sub_metering_1)
submetering2 <- as.numeric(datasub$Sub_metering_2)
submetering3 <- as.numeric(datasub$Sub_metering_3)

##plot(datetime,globalAPower,type ="l",main = "Plot 2",xlab= " ",ylab = "Global Active Power(kilowatts)")

plot(datetime,submetering1,type = "l",main = "Plot 3",xlab= " ",ylab = "Energy Submetering")
lines(datetime, submetering2,type = "l",col= "red")
lines(datetime, submetering3,type = "l",col= "blue")
legend('topright',c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,lwd= 2, 
       col = c('black','red','blue'))

##width of 480 pixels and a height of 480 pixels
dev.copy(png, file = "plot3.png",width = 480, height = 480)

## close the PNG device!
dev.off()
