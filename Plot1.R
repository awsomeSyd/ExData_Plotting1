#download and unzip the file in Working Directory
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, "./ExDataPlotting.zip")
unzip("./ExDataPlotting.zip")
#read and subset downloaded file
dataSet <- read.table("./household_power_consumption.txt", sep = ";", header = TRUE)
febObs <- subset(dataSet, dataSet$Date== "1/2/2007" | dataSet$Date== "2/2/2007")
plot1DS <- as.numeric(subset(febObs$Global_active_power, febObs$Global_active_power!= "?"))
#open PNG graphic device, create the plot and close the graphic device
#file is saved in Working Directory
png(filename = "plot1.png", width = 480, height = 480)
hist(plot1DS, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
