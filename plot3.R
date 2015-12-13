plot3 <- function(data_file, date_start, date_end){
  
  powertbl <- read.table(data_file, sep=";", header = TRUE, stringsAsFactors = FALSE, na.strings = "?")
  data <- powertbl[powertbl$Date %in% c(date_start, date_end),]
  
  data$dttm <- paste(data$Date, data$Time)
  data$dttm <- strptime(data$dttm, format = "%d/%m/%Y %H:%M:%S")
  
  png(filename = "plot3.png")
  plot(data$dttm, data$Sub_metering_1, type = "l", xlab = NA, ylab = "Energy sub metering")
  lines(x = data$dttm, y = data$Sub_metering_2, col = "red")
  lines(x = data$dttm, y = data$Sub_metering_3, col = "blue")
  legend("topright", col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1))
  dev.off()
}