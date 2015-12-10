### import data
data <- read.table('D:/Coursera/Exploratory_Data_Analysis/exdata_data_household_power_consumption/household_power_consumption.txt', sep=';', header=T)
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format='%d/%m/%Y %T')
subdata <- subset(data, DateTime >= '2007-02-01 00:00:00' & DateTime <= '2007-02-02 23:59:00')
head(subdata)

### convert subdata$Global_active_power from factor to numeric
subdata$Global_active_power <- as.numeric(levels(subdata$Global_active_power))[subdata$Global_active_power]
subdata$Sub_metering_1 <- as.numeric(levels(subdata$Sub_metering_1))[subdata$Sub_metering_1]
subdata$Sub_metering_2 <- as.numeric(levels(subdata$Sub_metering_2))[subdata$Sub_metering_2]

### plot 3
png(filename='D:/Coursera/Exploratory_Data_Analysis/plot3.png', width=480, height=480)
plot(subdata$DateTime, subdata$Sub_metering_1, ylab='Energy sub metering', xlab='',type='l')
lines(subdata$DateTime, subdata$Sub_metering_2, col='red')
lines(subdata$DateTime, subdata$Sub_metering_3, col='blue')
legend('topright', c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), lty=c(1,1,1),col=c('black', 'red', 'blue'))
dev.off()
