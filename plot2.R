##Download File
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile = "household_power_consumption.zip")

##Use Library
library(dplyr);
library(lubridate);

##Read Data
hpc<-read.csv2(file = "household_power_consumption.txt");
hpc_base<-mutate(hpc,Date = as.Date(Date,format="%d/%m/%Y",tz=""),Datetime=as.POSIXct(strptime(paste(hpc_base$Date,hpc_base$Time), format = "%Y-%m-%d %H:%M:%S"), tz=""));

##plot2
##Call Graphic Device
png(filename ="plot2.png");

##Prepare data
select(hpc_base,Date,Datetime,Global_active_power,Global_reactive_power,Voltage,Sub_metering_1,Sub_metering_2,Sub_metering_3) %>% mutate(nDay=wday(hpc_base$Datetime),aDay=wday(hpc_base$Datetime, label = TRUE),Global_active_power=as.numeric(as.character((Global_active_power))),Global_reactive_power=as.numeric(as.character((Global_reactive_power))),Voltage=as.numeric(as.character((Voltage))),Sub_metering_1=as.numeric(as.character((Sub_metering_1))),Sub_metering_2=as.numeric(as.character((Sub_metering_2))),Sub_metering_3=as.numeric(as.character((Sub_metering_3))))  ->hpc_base_plot2;

##Subset Data
subset(hpc_base_plot2, Date == c("2008-12-04")|Date == c("2008-12-05")) -> hpc_base_plot2_subset;

##Plot Graph
with(hpc_base_plot2_subset, plot(Global_active_power~Datetime, type = "l", ylab = "Global Active Power (kilowatts)", xlab = ""));

##Off & Save Graphic Device
dev.off();
