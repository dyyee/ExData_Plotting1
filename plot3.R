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

png(filename = "plot3.png",width = 480,height = 480)

data <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))



plot(data$Sub_metering_1 ~ data$Datetime
     , type = "l"
     , main = ""
     , xlab = ""
     , ylab = "Energy Sub Metering"
     , col = "Black"
)

lines(data$Sub_metering_2 ~ data$Datetime
      , type ="l"
      , col = "Red"
)

lines(data$Sub_metering_3 ~ data$Datetime
      , type ="l"
      , col = "Blue"
)


legend("topright"
       , legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
       , lty=1
       , lwd=2 
       , col=c("black", "red", "blue")
)


dev.off()