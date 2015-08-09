# Exploratory Data Analysis
# Project 1
# Plot 1

# Read data from file
x <- read.table("household_power_consumption.txt",sep=";",header = TRUE,stringsAsFactors=FALSE)

# Subset the two dates of interest
y <- subset(x,Date=="1/2/2007" | Date=="2/2/2007")

# Draw histogram
hist(as.numeric(y$Global_active_power),main="Global Active Power",xlab="Global Active Power (kilowatts)",col="red")

# Output to PNG file
dev.copy(png,file="plot1.png")
dev.off()
