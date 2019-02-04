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
png("plot2.png", width=480, height=480)
plot(datetime,dataset$Global_active_power, type = 'l',ylab = 'Global Active Power (kilowatts)')
dev.off()