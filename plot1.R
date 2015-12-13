plot1 <- function(data_file, date_start, date_end){
  
  powertbl <- read.table(data_file, sep=";", header = TRUE, stringsAsFactors = FALSE, na.strings = "?")
  powertbl_filtered <- powertbl[powertbl$Date %in% c(date_start, date_end),]
  
  png(filename = "plot1.png")
  hist(powertbl_filtered$Global_active_power,
       breaks = 11,
       xlab = "Global Active Power (kilowatts)",
       main = "Global Active Power",
       col = "red")
  dev.off()
}