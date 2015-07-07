setwd("~/Desktop/Coursera Johns Hopkins/Exploritory Data Analysis")

data <- read.csv("~/Desktop/Coursera Johns Hopkins/Exploritory Data Analysis/household_power_consumption.txt",
        header=T, sep=';', na.strings="?", nrows=2075259, 
        check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

data$Date <- as.Date(data$Date, format="%d/%m/%Y")

data_new <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data)
datetime <- paste(as.Date(data_new$Date), data_new$Time)

data_new$datetime <- as.POSIXct(datetime)

png("plot3.png",width = 480, height = 480)
with(data_new, {
        plot(Sub_metering_1~datetime, type="l",
             ylab="Energy sub metering", xlab="",col="black")
        points(Sub_metering_2~datetime,type="l",xlab="",
             ylab="Sub_metering_2",col="Red")
        points(Sub_metering_3~datetime,type="l", xlab="",
               ylab="Sub_metering_3",col="Blue")
        legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2,
               legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
})

dev.off()


