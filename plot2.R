## reading the data assuming the file is there in the 
## working directory, then subsetting the data into the another object 
## and this is the one we will be using. 
## I downloaded the file from the course website, unzipped it and used it's name like this
Filename = "household_power_consumption.txt" 
Power_Consumption <- read.table(Filename, header=TRUE, sep=";")
data <- Power_Consumption[Power_Consumption$Date %in% c("1/2/2007","2/2/2007") ,]

### Time conversion

date <- as.character(as.Date(data$Date, "%d/%m/%Y"))
tmp <- paste(date, data$Time)
dateTime <- strptime(tmp, "%Y-%m-%d %H:%M:%S")

## plotting 
png("plot2.png", width = 480, height = 480)
plot(dateTime, as.numeric(data$Global_active_power), type="l", 
     ylab="Global Active Power (kilowatts)", xlab="")
dev.off()