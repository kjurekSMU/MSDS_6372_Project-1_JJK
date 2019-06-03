# Project 01, Goal 02 - Pankaj, Karl, Shawn 

# reading the original modeling data 
modelingData <- read.csv("C:/Users/shawn/OneDrive/SMU/Applied Stat/Project01/modelingData.csv") 

# Select ID, timestamp and price, and transform to YYYY-MM-DD 
goal2_data <- modelingData[c("id", "timestamp", "price_doc")]
goal2_data$timestamp <- as.Date(goal2_data$timestamp, origin = "1899-12-30")

# Parding day, month, year and month-year 
goal2_data$day <- format.Date(goal2_data$timestamp, "%d")
goal2_data$month <- format.Date(goal2_data$timestamp, "%m")
goal2_data$year <- format.Date(goal2_data$timestamp, "%Y") 
goal2_data$monthYear <- paste(year, month, sep="")

# Aggregate by month-year
goal2_agg <- aggregate(goal2_data, by=list(monthYear), FUN = mean)
goal2_agg <- goal2_agg[c("Group.1", "price_doc")]
names(goal2_agg) <- c("monthYear", "AvgPrice")
goal2_agg$month <- seq.int(nrow(goal2_agg))

# write to CSV to load from SAS 
write.csv(goal2_agg, file="goal2data.csv")