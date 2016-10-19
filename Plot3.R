#download and unzip the file in Working Directory
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, "./ExDataPlotting.zip")
unzip("./ExDataPlotting.zip")
#read and subset downloaded file
dataSet <- read.table("./household_power_consumption.txt", sep = ";", header = TRUE)
febObs <- subset(dataSet, dataSet$Date== "1/2/2007" | dataSet$Date== "2/2/2007")
dateDS <- strptime(paste(febObs$Date, febObs$Time), format = "%d/%m/%Y %H:%M:%S")
#open PNG graphic device, create the plot and close the graphic device
#file is saved in Working Directory
png(filename = "plot3.png", width = 480, height = 480)

plot(dateDS, febObs$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
points(dateDS, febObs$Sub_metering_2, col = "red", type = "l")
points(dateDS, febObs$Sub_metering_3, col = "blue", type = "l")
legend("topright", lty = 1, col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3") )
dev.off()
