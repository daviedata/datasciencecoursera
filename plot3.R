
install.packages("data.table")
library("data.table")
# contruct graph over a 2-day period in February
# put in PNG file with 480X480



power2 <- data.table::fread(input = "household_power_consumption.txt"
                            , na.strings="?"
)

power2[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]

power2[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

power2 <- power2[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]




png("plot3.png", width=480, height=480)


plot(power2[, dateTime], power2[, Sub_metering_1], type="l", xlab="", ylab="Energy sub metering")
lines(power2[, dateTime], power2[, Sub_metering_2],col="red")
lines(power2[, dateTime], power2[, Sub_metering_3],col="blue")
legend("topright"
       , col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       ,lty=c(1,1), lwd=c(1,1))

dev.off()