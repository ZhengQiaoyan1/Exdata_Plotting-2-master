#This is assignment 2 (plot1) for exploratory data analysis.

####Set working directory####
setwd("E:/Courses/Exploratory Data Analysis/Project 2")

####Use readRDS() to read data####
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

head(NEI)

png(filename = "plot1.png")

NEI$year <- as.factor(NEI$year)

NEIGRP <- tapply(NEI$Emissions,NEI$year,sum)

NEIGRP<-data.frame(NEIGRP)

as.numeric(NEIGRP$NEIGRP)

plot(x=c(1999,2002,2005,2008),NEIGRP$NEIGRP,xlab="Year",ylab="Total emissioms from PM2.5",col="red",typ="o")
