data <- read.table(file = "household_power_consumption.txt"
                   ,header=TRUE
                   ,stringsAsFactors=FALSE
                   ,sep=";"
                   ,na.strings = "?")

data$Date <- as.Date(data$Date, format="%d/%m/%Y")

#reset the graph parameter to default
par(opar)

png(filename = "plot1.png",width = 480,height = 480)

data <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))


hist(data$Global_active_power
     , main = "Global Active Power"
     , xlab = "Global Active Power (kilowatts)"
     , ylab = "Frequency"
     , col = "Red"
     )

dev.off()