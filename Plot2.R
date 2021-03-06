df <- fread("household_power_consumption.txt",na.strings = "?")
df <- subset(df,Date == "1/2/2007" | Date =="2/2/2007")
df$Date <- as.Date(df$Date,"%d/%m/%Y")
df <- cbind(df,paste0(df$Date,df$Time))
names(df)[10] <- "DateTime"
df$DateTime <- as.POSIXct(df$DateTime)
png(filename = "plot2.png",width=480,height=480)
plot(df$DateTime,df$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()
rm(df)