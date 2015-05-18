dfile <- "./data/household_power_consumption.txt";
# read the file
dfall <- read.table(dfile, sep=";", header=TRUE, stringsAsFactors=FALSE);

# after reading in the data, take the subset for the two dates of interest.
df <- dfall[(dfall$Date == "1/2/2007" | dfall$Date == "2/2/2007"),];

# read.csv read (almost) every column in the data file is of type character 
# now transform it to numeric as needed
df <- transform(df, Date = as.Date(Date, "%d/%m/%Y"));
df <- transform(df, Time = strftime(strptime(Time, "%H:%M:%S"),"%H:%M:%S"));
df <- transform(df, Global_active_power = as.numeric(Global_active_power));
df <- transform(df, Global_reactive_power = as.numeric(Global_reactive_power));
df <- transform(df, Sub_metering_1 = as.numeric(Sub_metering_1));
df <- transform(df, Sub_metering_2 = as.numeric(Sub_metering_2));
df <- transform(df, Voltage = as.numeric(Voltage));

datetime <- strptime(paste(df$Date, df$Time, sep=" "), "%Y-%m-%d %H:%M:%S");

png("plot4.png", width=480, height=480);

par(mfrow = c(2, 2), mar = c(5, 4, 2, 1));

plot(datetime, df$Global_active_power, type = 'l', ylab = 'Global Active Power (kilowatts)', xlab='');

plot(datetime, df$Voltage, type = 'l', ylab = 'Voltage');

plot(datetime, df$Sub_metering_1, type = 'l', ylab = 'Energy sub metering', xlab='');
lines(datetime, df$Sub_metering_2, col = 'red');
lines(datetime, df$Sub_metering_3, col = 'blue');
legend("topright", col = c('black', 'blue', 'red'), legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lty = 1, cex = 0.5);

plot(datetime, df$Global_reactive_power, type = 'l', ylab = 'Global_reactive_power');

dev.off();
