# Project assignment 1
# Exploratory Data Analysis
# May 9, 2014

print("Please locate the file named 'household_power_consumption.txt'")
pwr_consumption <- read.csv(file=file.choose(), sep=";")
pwr_consumption$Date <- as.Date(pwr_consumption$Date,format="%d/%m/%Y")
pwr_consumption <- pwr_consumption[pwr_consumption$Date>=as.Date("2007-02-01") &
                                     pwr_consumption$Date<as.Date("2007-02-03"),]
pwr_consumption$DateAndTime <- '0'
pwr_consumption$DateAndTime <- paste(as.character(pwr_consumption$Date),
                                                         as.character(pwr_consumption$Time))
pwr_consumption2 <- pwr_consumption
pwr_consumption2$Global_active_power <- as.numeric(as.character(pwr_consumption2$Global_active_power))
pwr_consumption2$Global_reactive_power <- as.numeric(as.character(pwr_consumption$Global_reactive_power))
pwr_consumption2$Voltage <- as.numeric(as.character(pwr_consumption$Voltage))
pwr_consumption2$Global_intensity <- as.numeric(as.character(pwr_consumption$Global_intensity))
pwr_consumption2$Sub_metering_1 <- as.numeric(as.character(pwr_consumption$Sub_metering_1))
pwr_consumption2$Sub_metering_2 <- as.numeric(as.character(pwr_consumption$Sub_metering_2))
pwr_consumption2$Sub_metering_2 <- as.numeric(as.character(pwr_consumption$Sub_metering_2))
pwr_consumption2$DateAndTime <- as.POSIXlt(pwr_consumption2$DateAndTime, format="%Y-%m-%d %H:%M:%S")

png(filename = "plot3.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white", res = NA)

plot(pwr_consumption2$DateAndTime, pwr_consumption2$Global_active_power, type="n",
     xlab="", ylab="Energy sub metering", ylim=c(0,38))
lines(pwr_consumption2$DateAndTime, pwr_consumption2$Sub_metering_1, col="black")
lines(pwr_consumption2$DateAndTime, pwr_consumption2$Sub_metering_2, col="red")
lines(pwr_consumption2$DateAndTime, pwr_consumption2$Sub_metering_3, col="blue")
leg_txt<-c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
legend("topright",legend=leg_txt, lty=1, col=c("black","red","blue"))

dev.off()