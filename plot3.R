## download, unzip and then read the data
if (!file.exists("./data")){dir.create("./data")}
if (!file.exists("./data/household_power_consumption.txt")){
        fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
        download.file(fileUrl,destfile = "./data/household_power_consumption.zip")
        unzip("./data/household_power_consumption.zip",exdir = "./data")
}
head <- names(read.table("./data/household_power_consumption.txt",header = TRUE, nrows=1,sep = ";"))
data <- read.table("./data/household_power_consumption.txt", nrows=2880,sep = ";",skip=66637,col.names=head)
datetime <- paste(data$Date,data$Time)
datetime <- strptime(datetime,"%d/%m/%Y %H:%M:%S")
data <- cbind(datetime,data)
rm(datetime,head)

## plot3
png("./data/Plot3.png")
with(data,plot(datetime,Sub_metering_1,type="l",xlab="",ylab="Energy sub metering"))
with(data,lines(datetime,Sub_metering_2,col="red"))
with(data,lines(datetime,Sub_metering_3,col="blue"))
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1)
dev.off()
