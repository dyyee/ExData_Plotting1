data <- read.table(file = "household_power_consumption.txt"
                   ,header=TRUE
                   ,stringsAsFactors=FALSE
                   ,sep=";"
                   ,na.strings = "?")

data$Date <- as.Date(data$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

data <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))


#reset the graph parameter to default
par(opar)


png(filename = "plot4.png",width = 480,height = 480)



#setting the plot margin to required layout
par(mfcol=c(2,2),oma=c(0.1,0.1,0.1,0.1))



#Plot Active Power
plot(data$Global_active_power ~ data$Datetime
     ,type = "l"
     , main = ""
     , xlab = ""
     , ylab = "Global Active Power"
     , col = "Black"
)



#Plot Metering
plot(data$Sub_metering_1 ~ data$Datetime
     , type = "l"
     , main = ""
     , xlab = ""
     , ylab = "Energy Sub Metering"
     , col = "Black"
)

#adding metering 2
lines(data$Sub_metering_2 ~ data$Datetime
      , type ="l"
      , col = "Red"
)

#adding metering 3
lines(data$Sub_metering_3 ~ data$Datetime
      , type ="l"
      , col = "Blue"
)

#adding legend for metering plot
legend("topright"
       , legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
       , lty=1
       , lwd=1 
       , col=c("black", "red", "blue")
       , bty = "n"
)




#plot voltage
plot(data$Voltage ~ data$Datetime
     ,type = "l"
     , main = ""
     , xlab = "datetime"
     , ylab = "Voltage"
)




#plot reactive power
plot(data$Global_reactive_power ~ data$Datetime
     ,type = "l"
     , main = ""
     , xlab = "datetime"
     , ylab = "Global_reactive_power"
)


dev.off()

