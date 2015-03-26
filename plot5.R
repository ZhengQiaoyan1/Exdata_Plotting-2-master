#This is assignment 2 (plot5) for exploratory data analysis.

####Set working directory####
setwd("E:/Courses/Exploratory Data Analysis/Project 2")

####Use readRDS() to read data####
NEI <- readRDS("summarySCC_PM25.rds")
SCC<- readRDS("Source_Classification_Code.rds" )
NEIBC <- subset(NEI,NEI$fips=="24510")

library(dplyr)

####select coal combustion-related data#######
scc_motor_vehicle <- filter(SCC, grepl("([mM][oO][tT][oO][rR](.*)[vV][eE][hH][iI][cC][lL][eE])",
                                   SCC$Short.Name)) %>%select(SCC)
coal_comb <- filter(NEIBC, NEIBC$SCC %in% scc_motor_vehicle$SCC)

png(filename = "plot5.png")

plot(coal_comb$year,coal_comb$Emissions,xlab="Year",ylab="Total emissioms from coal combustion-related sources",
     col="red",type="o")
