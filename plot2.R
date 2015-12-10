### import data
data <- read.table('D:/Coursera/Exploratory_Data_Analysis/exdata_data_household_power_consumption/household_power_consumption.txt', sep=';', header=T)
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format='%d/%m/%Y %T')
subdata <- subset(data, DateTime >= '2007-02-01 00:00:00' & DateTime <= '2007-02-02 23:59:00')
head(subdata)

### convert subdata$Global_active_power from factor to numeric
subdata$Global_active_power <- as.numeric(levels(subdata$Global_active_power))[subdata$Global_active_power]

### plot 2
png(filename='D:/Coursera/Exploratory_Data_Analysis/plot2.png', width=480, height=480)
plot(subdata$DateTime, subdata$Global_active_power, ylab='Global Active Power (kilowatts)',
     xlab='',type='l')
dev.off()
