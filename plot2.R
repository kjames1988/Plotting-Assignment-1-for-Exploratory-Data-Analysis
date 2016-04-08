setwd("/Users/kofiunique/Documents/data_class")

##load file from folder
data_file<-"./energy/household_power_consumption.txt"

##read data table
data_1 <- read.table(data_file,header=TRUE, sep=';',stringsAsFactors=FALSE, dec=".")

datasub <-data_1 [data_1$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(datasub$Date, datasub$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalAPower <- as.numeric(datasub$Global_active_power)

plot(datetime,globalAPower,type ="l",main = "Plot 2",xlab= " ",ylab = "Global Active Power(kilowatts)")
