plot2 <- function() {
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
    subPd$Date <- as.POSIXct(paste(subPd$Date, subPd$Time))
  }
  png(filename="plot2.png", width= 480, height=480)
  plot(subPd$Date,subPd$Global_active_power, 
       type="l", 
       xlab="", 
       ylab="Global Active Power (kilowatts)")
  
  dev.off()
}
