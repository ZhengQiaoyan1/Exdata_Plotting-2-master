#This is assignment 2 (plot3) for exploratory data analysis.

####Set working directory####
setwd("E:/Courses/Exploratory Data Analysis/Project 2")

####Use readRDS() to read data####
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

####Select data for Baltimore City####
NEIBC <- subset(NEI,NEI$fips=="24510")

png(filename = "plot3.png")

NEIBC$year <- as.factor(NEIBC$year)

library(ggplot2)

g<-qplot(year,Emissions,data=NEIBC,facets=.~type)

 # geom_line()+
 # facet_wrap(bmicat~type,nrow=1,ncol=4)+
 # geom_smooth(method="lm",se=FALSE,col="steelblue",group=4)+
 # theme_bw(base_family="Avenir",base_size=10)+
 # labs(x="year")

print(g)
#g<-ggplot(NEIBC,aes(x=year,y=Emissions))   ,facets=.~type

#g+geom_point()+geom_smooth(aes(x=year,y=Emissions),method="lm",se=FALSE)+facet_wrap(.~type)+geom_point()
