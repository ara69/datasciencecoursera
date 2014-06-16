# Assignment 2
# Read the csv file and generate histogram for heart attack mortality rate

read.hospital.data <- function(outcome="") {
    result <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    # Form the data frame rows as provider name (column 1) and 
    # only with the columns
    # Provider Name (column 1)
    # Hospital Name (column 2)
    # State (column 7)
    # Heart Attack (column 11)
    # Heart Failure (column 17)
    # Pneumonia (column 23)
    
    colno <- 0 # The column no for the given outcome
    if(identical(outcome, "heart attack")) {
        colno <- 11
    } else if(identical(outcome, "heart failure")) {
        colno <- 17
    } else if(identical(outcome, "pneumonia")) {
        colno <- 23
    } else {
        stop("invalid outcome")
    }
    
    suppressWarnings(df <- data.frame(
                rate = as.numeric(result[,colno]), 
                hospital = result[,2],               
                state = result[,7]                
                ))
    
    
    row.names(df) <- result[,1]
    # retun the populated data frame after omitting the NAs
    na.omit(df)
    
}

# Returns the rank number after parsing the number and decoding best, worst 
rank.number <- function(df, num="best") {
    rank.no <- 0
    if (num == "best") {    
        rank.no <- 1  
    } else if (num == "worst") { 
        rank.no = nrow(df) # No of rows
    } else {    
        rank.no <- as.numeric(num)    
        if (is.na(rank.no)) {      
            stop("invalid num")    
        } else if (rank.no > nrow(df)) {      
            return(NA)    
        }  
    }
    rank.no   
}
