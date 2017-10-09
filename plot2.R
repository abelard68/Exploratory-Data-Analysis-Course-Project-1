
  power <- read.table("./household_power_consumption.txt", sep = ";", header = TRUE, 
                                                           na.strings = "?", stringsAsFactors = FALSE)  ##  reads data file
  
  subpower <- subset(power,power$Date=="1/2/2007" | power$Date =="2/2/2007")                            ##  only considering data for 2007/02/01 & 2007/02/02

  datetime <- strptime(paste(subpower$Date, subpower$Time, sep=" "), "%d/%m/%Y %H:%M:%S")               ##  converts date & time to POSIX
  
  png("plot2.png", width=480, height=480)                                                               ##  launch graphics device
  plot(datetime, subpower$Global_active_power, type="l", xlab="", 
                                               ylab="Global Active Power (kilowatts)")                  ##  creates the plot
  
  dev.off()                                                                                             ##  explicitly close graphics device
