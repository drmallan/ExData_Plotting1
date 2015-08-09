# Exploratory Data Analysis
# Project 1
# Plot 2

# Read data from file
x <- read.table("household_power_consumption.txt",sep=";",header = TRUE,stringsAsFactors=FALSE)

# Subset the two dates of interest
y <- subset(x,Date=="1/2/2007" | Date=="2/2/2007")

# Combine date and time variables
y$Combined <- strptime(paste(y$Date, y$Time),"%d/%m/%Y %H:%M:%S")

# Plot Global Active Power by Data
plot(y$Combined,y$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")

# Send plot to PNG file
dev.copy(png,file="plot2.png")
dev.off()