# Assignment 2
# Read the csv file and generate histogram for heart attack mortality rate

require(stats)

read.hospital.data <- function() {
    outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    # Form the data frame rows as provider name (column 1) and 
    # only with the columns
    # Provider Name (column 1)
    # Hospital Name (column 2)
    # State (column 7)
    # Heart Attack (column 11)
    # Heart Failure (column 17)
    # Pneumonia (column 23)
    suppressWarnings(df <- data.frame(
                heart.attack = as.numeric(outcome[,11]), 
                heart.failure = as.numeric(outcome[,17]), 
                pneumonia = as.numeric(outcome[,23]),
                hospital.name = outcome[,2], 
                state = outcome[,7]
                ))
    
    
    row.names(df) <- outcome[,1]
    # retun the populated data frame
    df
    
}

# Test the read.hospital.data
oc <- read.hospital.data()
class(oc)
names(oc)
head(oc)
