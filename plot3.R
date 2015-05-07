dfile <- "./data/household_power_consumption.txt";
# read the file
dfall <- read.table(dfile, sep=";", header=TRUE, stringsAsFactors=FALSE);

# after reading in the data, take the subset for the two dates of interest.
df <- dfall[(dfall$Date == "1/2/2007" | dfall$Date == "2/2/2007"),];

# read.csv read (almost) every column in the data file is of type character 
# now transform it to numeric as needed
df <- transform(df, Date = as.Date(Date, "%d/%m/%Y"));
df <- transform(df, Time = strftime(strptime(Time, "%H:%M:%S"),"%H:%M:%S"));
df <- transform(df, Sub_metering_1 = as.numeric(Sub_metering_1));
df <- transform(df, Sub_metering_2 = as.numeric(Sub_metering_2));

datetime <- strptime(paste(df$Date, df$Time, sep=" "), "%Y-%m-%d %H:%M:%S");

png("plot3.png", width=480, height=480)
plot(datetime, df$Sub_metering_1, type = 'l', ylab = 'Energy sub metering', xlab='');
lines(datetime, df$Sub_metering_2, col = 'red');
lines(datetime, df$Sub_metering_3, col = 'blue');
legend("topright", col = c('black', 'blue', 'red'), legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lty = 1);
dev.off();
