plot1 <- function() {
  if (!exists("powerData")) {
    powerData <<- read.csv("household_power_consumption.txt", sep=";")
    powerData$Date <<- as.Date(as.character(powerData$Date), "%d/%m/%Y")
  }
  
  if (!exists("subPd")) {
    subPd <<- subset(powerData, Date >= as.Date("2007-02-01") 
                     & Date <= as.Date("2007-02-02") )
    subPd$Global_active_power <<- as.numeric(as.character(subPd$Global_active_power))
  }
  png(filename="plot1.png", width= 480, height=480)
  hist(subPd$Global_active_power, 
       xlab="Global Active Power (kilowatts)",
       main="Global Active Power",
       col="red")
  dev.off()
}
