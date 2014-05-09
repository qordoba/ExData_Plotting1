## reading the data assuming the file is there in the 
## working directory, then subsetting the data into the another object 
## and this is the one we will be using 

url = "household_power_consumption.txt"
Power_Consumption <- read.table(url, header=TRUE, nrows=2100000, sep=";", stringsAsFactors =FALSE)
data <- Power_Consumption[Power_Consumption$Date %in% c("1/2/2007","2/2/2007") ,]

### Time conversion

date <- as.character(as.Date(data$Date, "%d/%m/%Y"))
tmp <- paste(date, data$Time)
dateTime <- strptime(tmp, "%Y-%m-%d %H:%M:%S")

## plotting 
png("plot2.png", width = 480, height = 480)
plot(dateTime, as.numeric(subset$Global_active_power), type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()