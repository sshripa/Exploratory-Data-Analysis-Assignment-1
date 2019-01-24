library(data.table)
setwd('/Users/shilpa.shripad/Cousera_Data_Analytics/Assignment4')

# read file
full_data = read.table(file = 'household_power_consumption.txt', header = TRUE,sep = ';', stringsAsFactors = FALSE)
full_data = setDT(full_data)

# Fitler required data 2007-02-01 and 2007-02-02
filtered_data = full_data[full_data$Date %in% c('1/2/2007','2/2/2007')]

# start ploting
png('plot2.png', height = 480, width = 480)
plot(x = strptime(paste(filtered_data$Date, filtered_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") , y=as.numeric(filtered_data$Global_active_power), type = 'l', xlab = '', ylab = 'Global Active Power(kilowatts)')
dev.off()