plot2 <- function(data_file, date_start, date_end){

  
  powertbl <- read.table(data_file, sep=";", header = TRUE, stringsAsFactors = FALSE, na.strings = "?")
  data <- powertbl[powertbl$Date %in% c(date_start, date_end),]
  
  data$dttm <- paste(data$Date, data$Time)
  data$dttm <- strptime(data$dttm, format = "%d/%m/%Y %H:%M:%S")
  
  png(filename = "plot2.png")
  plot(data$dttm, data$Global_active_power,
       type = "l",
       ylab = "Global Active Power (kilowatts)",
       xlab = NA)
  dev.off()
}