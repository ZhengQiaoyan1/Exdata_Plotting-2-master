#This is assignment 2 (plot4) for exploratory data analysis.

####Set working directory####
setwd("E:/Courses/Exploratory Data Analysis/Project 2")

####Use readRDS() to read data####
NEI <- readRDS("summarySCC_PM25.rds")
SCC<- readRDS("Source_Classification_Code.rds" )

library(dplyr)

####select coal combustion-related data#######
scc_coal_comb <- filter(SCC, grepl("([cC][oO][mM][bB](.*)[cC][oO][aA][lL])|
                                   ([cC][oO][aA][lL](.*)[cC][oO][mM][bB])",
                                    SCC$Short.Name)) %>%select(SCC)
coal_comb <- filter(NEI, NEI$SCC %in% scc_coal_comb$SCC)

coal_combave <- tapply(coal_comb$Emissions,coal_comb$year,sum)

png(filename = "plot4.png")

plot(x=c(1999,2002,2005,2008),coal_combave,xlab="Year",ylab="Total emissioms from coal combustion-related sources",col="red",typ="o")

