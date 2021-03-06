df <- fread("household_power_consumption.txt",na.strings = "?")
df <- subset(df,Date == "1/2/2007" | Date =="2/2/2007")
df$Date <- as.Date(df$Date,"%d/%m/%Y")
df <- cbind(df,paste0(df$Date,df$Time))
names(df)[10] <- "DateTime"
df$DateTime <- as.POSIXct(df$DateTime)
png(filename = "plot3.png",width=480,height=480)
plot(df$DateTime,df$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(df$Sub_metering_2~df$DateTime,col="red")
lines(df$Sub_metering_3~df$DateTime,col="blue")
legend("topright",legend=c("Sub_metering_1 ","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1,lwd=2)
dev.off()
rm(df)
