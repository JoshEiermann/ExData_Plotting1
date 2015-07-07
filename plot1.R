setwd("~/Desktop/Coursera Johns Hopkins/Exploritory Data Analysis")

data <- read.csv("./household_power_consumption.txt",
        header=T, sep=';', na.strings="?", nrows=2075259, 
        check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

data$Date <- as.Date(data$Date, format="%d/%m/%Y")

data_new <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data)
datetime <- paste(as.Date(data_new$Date), data_new$Time)

data_new$Datetime <- as.POSIXct(datetime)

png("plot1.png", width=480, height=480)

hist(data_new$Global_active_power, main="Global Active Power",
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.off()
