
dfile <- "./data/household_power_consumption.txt";
# read the file
dfall <- read.table(dfile, sep=";", header=TRUE, stringsAsFactors=FALSE);

# after reading in the data, take the subset for the two dates of interest.
df <- dfall[(dfall$Date == "1/2/2007" | dfall$Date == "2/2/2007"),];

# read.csv read (almost) every column in the data file is of type character 
# now transform it to numeric as needed
df <- transform(df, Global_active_power = as.numeric(Global_active_power));

# create the first plot, save it into a png file, close the png graph device
hist(df$Global_active_power, col='red', main = 'Global Active Power', xlab = 'Global Active Power (kilowatts)');
dev.copy(png, file = 'plot1.png', height=480, width=480)
dev.off();
