setwd("~/Desktop/Coursera Johns Hopkins/Exploritory Data Analysis")

data <- read.csv("~/Desktop/Coursera Johns Hopkins/Exploritory Data Analysis/household_power_consumption.txt",
        header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, 
        stringsAsFactors=F, comment.char="", quote='\"')

data$Date <- as.Date(data$Date, format="%d/%m/%Y")

data_new <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data)
datetime <- paste(as.Date(data_new$Date), data_new$Time)

data_new$datetime <- as.POSIXct(datetime)

png("plot4.png",width = 480, height = 480)

par(mfrow=c(2,2))
with(data_new, {
        ## Plot 1
        plot(Global_active_power~datetime, type="l", 
             ylab="Global Active Power", xlab="")
        ## Plot 2
        plot(Voltage~datetime, type="l", 
             ylab="Voltage", xlab="datetime")
        ## Plot 3
        plot(Sub_metering_1~datetime, type="l", 
             ylab="Energy sub metering", xlab="",col="black")
        points(Sub_metering_2~datetime, type="l",xlab="",
             ylab="Sub_metering_2", col="red")
        points(Sub_metering_3~datetime, type="l", xlab="",
             ylab="Sub_metering_3",col="blue")
        legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
               legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        ## Plot 4
        plot(Global_reactive_power~datetime, type="l", 
             ylab="Global_reatice_power", xlab="datetime",
             ylim=c(0,0.5))
})

dev.off()
