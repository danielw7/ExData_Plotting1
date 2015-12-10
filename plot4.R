### import data
data <- read.table('D:/Coursera/Exploratory_Data_Analysis/exdata_data_household_power_consumption/household_power_consumption.txt', sep=';', header=T)
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format='%d/%m/%Y %T')
subdata <- subset(data, DateTime >= '2007-02-01 00:00:00' & DateTime <= '2007-02-02 23:59:00')
head(subdata)

### convert subdata$Global_active_power from factor to numeric
subdata$Global_active_power <- as.numeric(levels(subdata$Global_active_power))[subdata$Global_active_power]
subdata$Sub_metering_1 <- as.numeric(levels(subdata$Sub_metering_1))[subdata$Sub_metering_1]
subdata$Sub_metering_2 <- as.numeric(levels(subdata$Sub_metering_2))[subdata$Sub_metering_2]
subdata$Global_reactive_power <- as.numeric(levels(subdata$Global_reactive_power))[subdata$Global_reactive_power]
subdata$Voltage <- as.numeric(levels(subdata$Voltage))[subdata$Voltage]

### plot 4
png(filename='D:/Coursera/Exploratory_Data_Analysis/plot4.png', width=480, height=480)
par(mfrow=c(2,2))
plot(subdata$DateTime, subdata$Global_active_power, ylab='Global Active Power',
     xlab='',type='l')
plot(subdata$DateTime, subdata$Voltage, ylab='Voltage', xlab='datetime', type='l')
plot(subdata$DateTime, subdata$Sub_metering_1, ylab='Energy sub metering', xlab='',type='l')
lines(subdata$DateTime, subdata$Sub_metering_2, col='red')
lines(subdata$DateTime, subdata$Sub_metering_3, col='blue')
legend('topright', c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), bty='n',
       lty=c(1,1,1),col=c('black', 'red', 'blue'))
plot(subdata$DateTime, subdata$Global_reactive_power, ylab='Global_reactive_power', xlab='datetime', type='l')
dev.off()
