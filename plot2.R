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
subset$Days <- weekdays(subset$DateTime)

#Plotting Plot2
png(filename="plot2.png", width = 480, height = 480, units = "px")
plot(subset$DateTime,subset$Global_active_power,type = "l",xlab="",ylab="Global Active Power (kilowatts)",main="")
dev.off()

