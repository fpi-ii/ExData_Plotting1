# set the working directory to where the data file is
setwd("...exploratory_data_analysis/assignments/data");
dfile <- "household_power_consumption.txt";
# read the file
dfall <- read.csv(dfile, sep=";", header=TRUE);
# one could use read.table() as well

# after reading in the data, take the subset for the two dates of interest.
df <- dfall[(dfall$Date == "1/2/2007" | dfall$Date == "2/2/2007"),];

# read.csv read (almost) every column in the data file as a factor. 
# now transform it to numeric, data, time, etc. as needed
df <- transform(df, Date = as.Date(Date, "%d/%m/%Y"));
df <- transform(df, Time = strftime(strptime(Time, "%H:%M:%S"),"%H:%M:%S"));
df <- transform(df, Global_active_power = as.numeric(Global_active_power));

# create the first plot, save it into a png file, close the png graph device
hist(df$Global_active_power, col='red', main = 'Global Active Power', xlab = 'Global Active Power (kilowatts)')
dev.copy(png, file = 'plot1.png')
dev.off()
# note: the png file is saved in the working directory, which is data.