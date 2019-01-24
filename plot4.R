library(data.table)
setwd('/Users/shilpa.shripad/Cousera_Data_Analytics/Assignment4')

# read file
full_data = read.table(file = 'household_power_consumption.txt', header = TRUE,sep = ';', stringsAsFactors = FALSE)
full_data = setDT(full_data)

# Fitler required data 2007-02-01 and 2007-02-02
filtered_data = full_data[full_data$Date %in% c('1/2/2007','2/2/2007')]

# start ploting
png('plot4.png', height = 480, width = 480)
par(mfrow=c(2,2))
plot(x = strptime(paste(filtered_data$Date, filtered_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") , y=as.numeric(filtered_data$Global_active_power), type = 'l', xlab = '', ylab = 'Global Active Power')
plot(x = strptime(paste(filtered_data$Date, filtered_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") , y=as.numeric(filtered_data$Voltage), type = 'l', xlab = 'datetime', ylab = 'Voltage')
plot(x = strptime(paste(filtered_data$Date, filtered_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") , y=as.numeric(filtered_data$Sub_metering_1), type = 'l', xlab = '', ylab = 'Energy sub metering')
lines(x = strptime(paste(filtered_data$Date, filtered_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") , y=as.numeric(filtered_data$Sub_metering_2), type = 'l',  col= 'red')
lines(x = strptime(paste(filtered_data$Date, filtered_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") , y=as.numeric(filtered_data$Sub_metering_3), type = 'l', col= 'blue' )
legend('topright', legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), col=c('black', 'red', 'blue'),lty=1, lwd=2.5)
plot(x = strptime(paste(filtered_data$Date, filtered_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") , y=as.numeric(filtered_data$Global_reactive_power), type = 'l', xlab = 'datetime', ylab = 'Global_reactive_power')
dev.off()