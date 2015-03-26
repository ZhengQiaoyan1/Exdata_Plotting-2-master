#This is assignment 2 (plot6) for exploratory data analysis.

####Set working directory####
setwd("E:/Courses/Exploratory Data Analysis/Project 2")

####Use readRDS() to read data####
NEI <- readRDS("summarySCC_PM25.rds")
SCC<- readRDS("Source_Classification_Code.rds" )
#BaltimoreCity#
NEIBC <- subset(NEI,NEI$fips=="24510")
#California#
NEILACC <- subset(NEI,NEI$fips=="06037")

library(dplyr)
library(ggplot2)

####select coal combustion-related data#######
scc_motor_vehicle <- filter(SCC, grepl("([mM][oO][tT][oO][rR](.*)[vV][eE][hH][iI][cC][lL][eE])",
                                       SCC$Short.Name)) %>%select(SCC)
#BaltimoreCity#
coal_comb <- filter(NEIBC, NEIBC$SCC %in% scc_motor_vehicle$SCC)
#California#
coal_comb2 <- filter(NEILACC, NEILACC$SCC %in% scc_motor_vehicle$SCC)

png(filename = "plot6.png")

m <- rbind (coal_comb,coal_comb2)

g<-qplot(year,Emissions,data=m,facets=.~fips,geom=c("line","point"))
plot(g)


