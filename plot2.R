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

datetime <- strptime(paste(df$Date, df$Time, sep=" "), "%Y-%m-%d %H:%M:%S");
plot(datetime, df$Global_active_power, type = 'l', ylab = 'Global Active Power (kilowatts)', xlab='');
dev.copy(png, file = 'plot2.png', height=480, width=480)
dev.off();
