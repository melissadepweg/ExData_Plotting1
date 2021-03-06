setwd("C:/Users/mdepweg/Documents/coursera/Exploratory Data Analysis")
#Pulling Data
mydata <- read.table("household_power_consumption.txt", sep=";", 
                     col.names=c("Date", "Time", "Global_active_power","Global_reactive_power", "Voltage", 
                                 "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
                     stringsAsFactors=FALSE)
mydata<- subset(mydata[2:nrow(mydata),])
mydata$Date2 <- as.Date(mydata$Date,"%d/%m/%Y")

subset <- subset(mydata, Date2>='2007-02-01')
subset <- subset(subset, Date2<='2007-02-02')
subset$DateTime<- as.POSIXct(paste(subset$Date2, subset$Time), format="%Y-%m-%d %H:%M:%S")

#Plotting Plot 3
png(filename="plot3.png", width = 480, height = 480, units = "px")
plot(subset$DateTime,subset$Sub_metering_1,type="l",col="black", xlab="", ylab="Energy sub metering",main="")
lines(subset$DateTime,subset$Sub_metering_2,col="red")
lines(subset$DateTime,subset$Sub_metering_3,col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lty=c(1,1), 
       col=c("black", "red", "blue"))
dev.off()
