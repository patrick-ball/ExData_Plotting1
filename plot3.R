# read in all data
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

# set Date column data to Date class
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

# create date filter
filter <- data[,1] == "2007-02-01" | data[,1] == "2007-02-02"

# apply date filter
data <- data[filter,]

# create desired plot in png file
png(file = "plot3.png")

plot(data$Sub_metering_1,
     ylab= "Energy sub metering",
     xlab = "",
     type= "n",
     xaxt= "n")

lines(data$Sub_metering_1)
lines(data$Sub_metering_2, col="red")
lines(data$Sub_metering_3, col="blue")

axis(1, at=c(1,1440,2880), labels=c("Thu", "Fri", "Sat"))
legend("topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"),
       lwd = 1)

dev.off()
