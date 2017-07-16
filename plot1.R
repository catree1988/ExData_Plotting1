## download, unzip and then read the data
if (!file.exists("./data")){dir.create("./data")}
if (!file.exists("./data/household_power_consumption.txt")){
        fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
        download.file(fileUrl,destfile = "./data/household_power_consumption.zip")
        unzip("./data/household_power_consumption.zip",exdir = "./data")
}
head <- names(read.table("./data/household_power_consumption.txt",header = TRUE, nrows=1,sep = ";"))
data <- read.table("./data/household_power_consumption.txt", nrows=2880,sep = ";",skip=66637,col.names=head)

## plot1
png("./data/Plot1.png")
hist(data$Global_active_power,xlab="Global Active Power (killowatts)",main="Global Active Power",col="red")
dev.off()
