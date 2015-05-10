plot3 <- function() {
  # cache original load so I can tweak the rest of the function without
  # waiting for load over and over again
  if (!exists("powerData")) {
    powerData <<- read.csv("household_power_consumption.txt", sep=";")
    powerData$Date <<- as.Date(as.character(powerData$Date), "%d/%m/%Y")
  }
  
  if (!exists("subPd")) {
    subPd <<- subset(powerData, Date >= as.Date("2007-02-01") 
                     & Date <= as.Date("2007-02-02") )
    subPd$Global_active_power <<- as.numeric(as.character(subPd$Global_active_power))
    subPd$Date <<- as.POSIXct(paste(subPd$Date, subPd$Time))
  }
  png(filename="plot3.png", width= 480, height=480)

  plot(subPd$Date,subPd$Sub_metering_1, 
             type="l", 
             xlab="", 
             ylab="Energy sub metering")
  lines(subPd$Date,subPd$Sub_metering_2, col="red")
  lines(subPd$Date,subPd$Sub_metering_3, col="blue")
  
  
  legend( x="topright", 
          legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_2"),
          col=c("black","red", "blue"), lwd=1, lty=c(1)  )
  
  dev.off()
}
