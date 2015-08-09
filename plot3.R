# Exploratory Data Analysis
# Project 1
# Plot 3

# Read data from file
x <- read.table("household_power_consumption.txt",sep=";",header = TRUE,stringsAsFactors=FALSE)

# Subset the two dates of interest
y <- subset(x,Date=="1/2/2007" | Date=="2/2/2007")

# Combine date and time variables
y$Combined <- strptime(paste(y$Date, y$Time),"%d/%m/%Y %H:%M:%S")

# Plot three sub_metering variables
with(y, plot(Combined, Sub_metering_1,type="l",ylab="Energy sub metering",xlab=""))
with(y, points(Combined, Sub_metering_2,col="red",type="l"))
with(y, points(Combined, Sub_metering_3,col="blue",type="l"))

# Add legend
recordGraphics(legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"),lty=1), list(), getNamespace("graphics"))

# Send output to PNG file
dev.copy(png,file="plot3.png")
dev.off()