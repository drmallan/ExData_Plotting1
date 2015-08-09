x <- read.table("household_power_consumption.txt",sep=";",header = TRUE,stringsAsFactors=FALSE)

# Subset the two dates of interest
y <- subset(x,Date=="1/2/2007" | Date=="2/2/2007")

# Combine date and time variables
y$Combined <- strptime(paste(y$Date, y$Time),"%d/%m/%Y %H:%M:%S")

par(mfrow=c(2,2))

# Plot four charts
with(y, {
  plot(Combined,Global_active_power,type="l",ylab="Global Active Power",xlab="")
  plot(Combined, Voltage,type="l",ylab="Voltage",xlab="datetime")
  plot(Combined, Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
  points(Combined, Sub_metering_2,col="red",type="l")
  points(Combined, Sub_metering_3,col="blue",type="l")
  recordGraphics(legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"),lty=1), list(), getNamespace("graphics"))
  plot(Combined, Global_reactive_power,type="l",ylab="Global_reactive_power",xlab="datetime")
})

# Send output to PNG file
dev.copy(png,file="plot4.png")
dev.off()