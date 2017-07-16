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

## plot2
png("./data/Plot2.png")
with(data,plot(datetime,Global_active_power,type="l",xlab=""))
dev.off()
