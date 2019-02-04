#Read the data
dataset<-read.table('./household_power_consumption.txt', header = T, sep = ';', na.strings = '?',
                    stringsAsFactors = F)


#Convert dates into dates variables
dataset$Date<-strptime(dataset$Date, format = '%d/%m/%Y')


#Select only dates of interest
dataset<-dataset[(dataset$Date>='2007-02-01')&(dataset$Date<='2007-02-02'),]

#Elaborate histogram and print to png 
png("plot1.png", width=480, height=480)
hist(dataset$Global_active_power, col = 'red', main = 'Global Active Power',
     xlab = 'Global Active Power (kilowatts)')
dev.off()