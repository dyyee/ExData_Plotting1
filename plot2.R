data <- read.table(file = "household_power_consumption.txt"
                   ,header=TRUE
                   ,stringsAsFactors=FALSE
                   ,sep=";"
                   ,na.strings = "?")

data$Date <- as.Date(data$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

#reset the graph parameter to default
par(opar)

png(filename = "plot2.png",width = 480,height = 480)

data <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))


plot(data$Global_active_power ~ data$Datetime
     ,type = "l"
     , main = ""
     , xlab = ""
     , ylab = "Global Active Power (kilowatts)"
     , col = "Black"
)


dev.off()