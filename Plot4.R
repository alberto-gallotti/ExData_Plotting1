#Read the data
dataset<-read.table('./household_power_consumption.txt', header = T, sep = ';', na.strings = '?',
                    stringsAsFactors = F)


#Convert dates into dates variables
dataset$Date<-strptime(dataset$Date, format = '%d/%m/%Y')


#Select only dates of interest
dataset<-dataset[(dataset$Date>='2007-02-01')&(dataset$Date<='2007-02-02'),]

#Create new variable that contains dates and time
datetime<-paste(dataset$Date, dataset$Time, sep = ' ')
datetime<-as.POSIXct(datetime)


#Elaborate plot and print to png 
png("plot4.png", width=480, height=480)
par(mfcol = c(2,2))
plot(datetime,dataset$Global_active_power, type = 'l',ylab = 'Global Active Power (kilowatts)', xlab = '')
plot(datetime,dataset$Sub_metering_1, type = 'l',ylab = 'Energy sub metering', xlab = '')
lines(datetime,dataset$Sub_metering_2, col = 'red')
lines(datetime,dataset$Sub_metering_3, col = 'blue')
legend('topright', c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), lty = 1, lwd = 2,
       col = c('black', 'red','blue'))
plot(datetime,dataset$Voltage, type = 'l',ylab = 'Voltage')
plot(datetime,dataset$Global_reactive_power, type = 'l',ylab = 'Global_reactive_power')
dev.off()