setwd("/Users/kofiunique/Documents/data_class")

##load file from folder
data_file<-"./energy/household_power_consumption.txt"
##read data table
data_1 <- read.table(data_file,header=TRUE, sep=';',stringsAsFactors=FALSE, dec=".")

datasub <-data_1 [data_1$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(datasub$Date, datasub$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalAPower <- as.numeric(datasub$Global_active_power)
globalRPower <- as.numeric(datasub$Global_reactive_power)

submetering1 <- as.numeric(datasub$Sub_metering_1)
submetering2 <- as.numeric(datasub$Sub_metering_2)
submetering3 <- as.numeric(datasub$Sub_metering_3)
Volt <- as.numeric(datasub$Voltage)

## Plot graphs

par(mfrow=c(2,2), mar= c(4,4,2,2))



plot(datetime,globalAPower,type ="l",xlab= " ",ylab = "Global Active Power(kilowatts)",)

plot(datetime, Volt,type = "l",xlab= "datetime ",ylab = "voltage")

plot(datetime,submetering1,type = "l",,xlab= " ",ylab = "Energy Sub metering")
lines(datetime, submetering2,type = "l",col= "red")
lines(datetime, submetering3,type = "l",col= "blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1) ,lwd=1.5, col = c('black','red','blue'),
       bty="n",cex=.5)


plot(datetime, globalRPower,type = "l",xlab= "datetime ",ylab = "Global_reactive_power")

##width of 480 pixels and a height of 480 pixels

dev.copy(png, file = "plot4.png",width = 480, height = 480)

## close the PNG device!
dev.off()

