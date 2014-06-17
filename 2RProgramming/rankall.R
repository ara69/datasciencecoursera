source("readhospitaldata.R") # To read the outcome csv file

# Assignment 2 - Part 4

## Ranking hospitals in all states

# Write a function called rankall that takes two arguments: an outcome name (outcome) and a hospital rank- ing (num). The function reads the outcome-of-care-measures.csv file and returns a 2-column data frame containing the hospital in each state that has the ranking specified in num. For example the function call rankall("heart attack", "best") would return a data frame containing the names of the hospitals that are the best in their respective states for 30-day heart attack death rates. The function should return a value for every state (some may be NA). The first column in the data frame is named hospital, which contains the hospital name, and the second column is named state, which contains the 2-character abbreviation for the state name. Hospitals that do not have data on a particular outcome should be excluded from the set of hospitals when deciding the rankings.

# Handling ties. The rankall function should handle ties in the 30-day mortality rates in the same way that the rankhospital function handles ties.

# NOTE: For the purpose of this part of the assignment (and for eficiency), your function should NOT call the rankhospital function from the previous section. The function should check the validity of its arguments. If an invalid outcome value is passed to rankall, the function should throw an error via the stop function with the exact message \invalid outcome". The num variable can take values \best", \worst", or an integer indicating the ranking (smaller numbers are better). If the number given by num is larger than the number of hospitals in that state, then the function should return NA.

# The function should use the following template.

rankall <- function(outcome, num = "best") {
    ## Read outcome data and check the outcome are valid
    hospital <- read.hospital.data(outcome)
            
    ## For each state, find the hospital of the given rank
    ranked.data <- NULL
    
    for(state in levels(hospital$state)) {
        # The hospital data for this state
        state.data <- hospital[hospital$state == state, ]
        rank.no <- rank.number(state.data, num) 
        
        result <- NULL
        if(is.na(rank.no)){
            result <- data.frame(hospital=rank.no, state=state)
        } else {
            ranked.state <- state.data[do.call(order, state.data), ][rank.no, ]
            result <- data.frame(hospital=ranked.state$hospital, state=state)
        }
        row.names(result) <- state
        ## Populate the data frame with the hospital names and the
        ## (abbreviated) state name
        ranked.data <- rbind(ranked.data, result)
    }
        
    ## Return the data frame with the hospital names and the
    ## (abbreviated) state name
    ranked.data
}
 

