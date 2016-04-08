setwd("/Users/kofiunique/Documents/data_class")

##load file from folder
data_file<-"./energy/household_power_consumption.txt"

##read data table
data_1 <- read.table(data_file,header=TRUE, sep=';',stringsAsFactors=FALSE, dec=".")
rm(data_file)

## create a subset of the data with time 1/2/07-2/2/07

datasub <-data_1 [data_1$Date %in% c("1/2/2007","2/2/2007") ,]
globalAPower <- as.numeric(datasub$Global_active_power)

## Plot histogram
hist(globalAPower,main = "Global Active Power",xlab = "Global Active Power(kilowatts)", ylab = "Frequency",col= "red")
##width of 480 pixels and a height of 480 pixels
dev.copy(png, file = "plot1.png",width = 480, height = 480)

## close the PNG device!
dev.off()


