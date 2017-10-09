
  power <- read.table("./household_power_consumption.txt", sep = ";", header = TRUE, 
                                                           na.strings = "?", stringsAsFactors = FALSE)  ##  reads data file 
  
  subpower <- subset(power,power$Date=="1/2/2007" | power$Date =="2/2/2007")                            ##  only wanting data for 2007/02/01 & 2007/02/02
  
  datetime <- strptime(paste(subpower$Date, subpower$Time, sep=" "), "%d/%m/%Y %H:%M:%S")               ##  converts date & time to POSIX
  
  
  png("plot4.png", width=480, height=480)                                                               ##  launch graphics device png
  par(mfrow = c(2, 2))                                                                                  ##  create a multi-paneled plotting window
  
  plot(datetime, subpower$Global_active_power, type="l", xlab="", ylab="Global Active Power")           ##  creates the first plot
  plot(datetime, subpower$Voltage, type="l", xlab="", ylab="Voltage")                                   ##  creates the second plot
  
  plot(datetime, subpower$Sub_metering_1, type="l", ylab="Energy Sub metering", xlab="")                ##  creates the third plot
  lines(datetime, subpower$Sub_metering_2, type="l", col="red")                                         ##  add line for sub_metering_2
  lines(datetime, subpower$Sub_metering_3, type="l", col="blue")                                        ##  add line for sub_metering_3
  
  
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, 
                     bty = "n", col=c("black", "red", "blue"))                                          ##  add legend, without box, to plot
  
  
  plot(datetime, subpower$Global_reactive_power, type="l", xlab="", ylab="Global Active Power")         ##  creates the fourth plot
  
  dev.off()                                                                                             ##  explicitly close graphics device
  