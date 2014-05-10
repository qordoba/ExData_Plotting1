## reading the data assuming the file is there in the 
## working directory, then subsetting the data into the another object 
## and this is the one we will be using. 
## I downloaded the file from the course website, unzipped it and used it's name like this
Filename = "household_power_consumption.txt" 
Power_Consumption <- read.table(Filename, header=TRUE, sep=";", stringsAsFactors =FALSE)
data <- Power_Consumption[Power_Consumption$Date %in% c("1/2/2007","2/2/2007") ,]

### Time conversion

date <- as.character(as.Date(data$Date, "%d/%m/%Y"))
tmp <- paste(date, data$Time)
dateTime <- strptime(tmp, "%Y-%m-%d %H:%M:%S")

## Plotting 
png("plot3.png", width = 480, height = 480)
plot(dateTime, as.numeric(data$Sub_metering_1), type="l", xlab="", ylab="Energy Submetering")
lines(dateTime, as.numeric(data$Sub_metering_2), type="l", col="red")
lines(dateTime, as.numeric(data$Sub_metering_3), type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd =2.5,col=c("black", "red", "blue"))
dev.off()