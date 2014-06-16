source("readhospitaldata.R") # To read the outcome csv file

# Assignment 2 - Part 2
# Finding the best hospital in a state
# Write a function called best that take two arguments: the 2-character abbreviated name of a state and an outcome name. The function reads the outcome-of-care-measures.csv file and returns a character vector with the name of the hospital that has the best (i.e. lowest) 30-day mortality for the specifed outcome in that state. The hospital name is the name provided in the Hospital.Name variable. The outcomes can be one of "heart attack", "heart failure", or "pneumonia". Hospitals that do not have data on a particular outcome should be excluded from the set of hospitals when deciding the rankings.

# Handling ties. If there is a tie for the best hospital for a given outcome, then the hospital names should be sorted in alphabetical order and the first hospital in that set should be chosen (i.e. if hospitals \b", \c", and \f" are tied for best, then hospital \b" should be returned). 

# The function should check the validity of its arguments. If an invalid state value is passed to best, the function should throw an error via the stop function with the exact message \invalid state". If an invalid outcome value is passed to best, the function should throw an error via the stop function with the exact message \invalid outcome".

# The function best
best <- function(state, outcome) {
    ## Read outcome data and validate the outcome
    hospital <- read.hospital.data(outcome)
    
    ## Check and populate that state data
    state.data <- hospital[hospital$state == state,]
        
    if(nrow(state.data) == 0) {
        stop("invalid state")
    }
        
    ## Return hospital name in that state with lowest 30-day death rate
    min.outcome = min(state.data$rate, na.rm = TRUE)
    min.state.data <- state.data[(state.data$rate == min.outcome), ]
    as.character(min.state.data$hospital)
}
 

# Sample test

best("TX", "heart attack")
#[1] "CYPRESS FAIRBANKS MEDICAL CENTER"

best("TX", "heart failure")
#[1] "FORT DUNCAN MEDICAL CENTER"

best("MD", "heart attack")
#[1] "JOHNS HOPKINS HOSPITAL, THE"

#best("BB", "heart attack")
#Error in best("BB", "heart attack") : invalid state

#best("NY", "hert attack")
#Error in best("NY", "hert attack") : invalid outcome

best("MD", "pneumonia")
#[1] "GREATER BALTIMORE MEDICAL CENTER"
