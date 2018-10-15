install.packages("data.table")
library("data.table")
# contruct graph over a 2-day period in February
# put in PNG file with 480X480

powertxt <- data.table::fread(input = "household_power_consumption.txt", na.strings = "?")

power <- subset(powertxt, powertxt$Date=="1/2/2007" | powertxt$Date=="2/2/2007")

png("plot1.png", width=480, height=480)

hist(as.numeric(as.character(power$Global_active_power)),col="red", main="Global Active Power", xlab = "Global Active Power (kilowatts)")


power[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]

dev.off()