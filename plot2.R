# read in all data
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

# set Date column data to Date class
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

# create date filter
filter <- data[,1] == "2007-02-01" | data[,1] == "2007-02-02"

# apply date filter
data <- data[filter,]

# create desired plot in png file
png(file = "plot2.png")
plot(data$Global_active_power,
     ylab= "Global Active Power (kilowatts)",
     xlab = "",
     type= "lines",
     xaxt= "n")
axis(1, at=c(1,1440,2880), labels=c("Thu", "Fri", "Sat"))
dev.off()
