# Exploratory Data Analysis - Assignment 2 - Q. #5
# Josh Irwin

# Load ggplot2 library
library("ggplot2")

# Set Working Directory
setwd("/Users/Josh/GitHub/ExploratoryDataAnalysisProject_Assignment2")

# Loading provided datasets - loading from local machine
NEI <- readRDS("data/summarySCC_PM25.rds")
SCC <- readRDS("data/Source_Classification_Code.rds")

# Grab the vehicle-related data
vehicles <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
vehiclesSCC <- SCC[vehicles,]$SCC
vehiclesNEI <- NEI[NEI$SCC %in% vehiclesSCC,]
baltimoreVehicles <- vehiclesNEI[vehiclesNEI$fips=="24510",]

# Create plot5.png using the ggplot2 library
png("plot5.png",width=480,height=480,units="px",bg="transparent")

ggp <- ggplot(baltimoreVehicles,aes(factor(year),Emissions)) + geom_bar(stat="identity",fill="grey",width=0.75) +
    theme_bw() +  guides(fill=FALSE) + labs(x="Year", y=expression("Total PM"[2.5]*" Emission (10^5 Tons)")) + 
    labs(title=expression("PM"[2.5]*" Motor Vehicle Emissions for Baltimore - 1999-2008"))
print(ggp)

dev.off()