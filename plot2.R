##Course 4: Exploratory data analysis, week 1: plot 2

# first clean the environment
rm(list = ls())

# Set the working directory (if this script runs on your own laptop/compuer, change it accordingly)
setwd("C:/Users/helbouazzaoui/Desktop/Coursera course/Data science course/Course 4 Exploratory Data Analysis/Week 1")

# read the data from the working directory
begin <- ymd_hms("2007-02-01 00:00:00")
end <- ymd_hms("2007-02-02 23:59:00")
nr_of_rows <- as.numeric(difftime(end, begin, units = "mins"))

## now read a subset of the data using grep() and readLines, assuming the zipfile was downloaded to your working directory and unzipped
file <- "household_power_consumption.txt"

## read the header names
tmp_headers <- read.table(file,sep = ";",nrows = 1)
header <- as.vector(as.matrix.data.frame(tmp_headers))

## detect first index/line where the data starts, i.e. where 1/2/2007 starts
first_index <- first(grep("1/2/2007", readLines(file)))
subset <- read.table(file, header = FALSE, sep = ";",skip = first_index , nrows = nr_of_rows)

## rename the header of the data
names(subset) <- header

## convert date to date format
tmp_datetime <- paste(subset$Date, subset$Time, sep = " ")
subset$datetime <- strptime(tmp_datetime, "%d/%m/%Y %H:%M:%S")


## plot solid line
png(filename = "plot2.png", width = 480, height = 480)
plot(subset$datetime, subset$Global_active_power, xlab = "", ylab = "Global Active Power (kiowatts)",type = "l")
dev.off()
