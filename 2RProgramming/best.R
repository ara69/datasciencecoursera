source("hospital.R") # To read the outcome csv file

# Assignment 2 - Part 2
# Finding the best hospital in a state
# Write a function called best that take two arguments: the 2-character abbreviated name of a state and an outcome name. The function reads the outcome-of-care-measures.csv file and returns a character vector with the name of the hospital that has the best (i.e. lowest) 30-day mortality for the specifed outcome in that state. The hospital name is the name provided in the Hospital.Name variable. The outcomes can be one of "heart attack", "heart failure", or "pneumonia". Hospitals that do not have data on a particular outcome should be excluded from the set of hospitals when deciding the rankings.

# Handling ties. If there is a tie for the best hospital for a given outcome, then the hospital names should be sorted in alphabetical order and the first hospital in that set should be chosen (i.e. if hospitals \b", \c", and \f" are tied for best, then hospital \b" should be returned). 

# The function should check the validity of its arguments. If an invalid state value is passed to best, the function should throw an error via the stop function with the exact message \invalid state". If an invalid outcome value is passed to best, the function should throw an error via the stop function with the exact message \invalid outcome".

# The function best
best <- function(state, outcome) {
    ## Read outcome data
    ## Check that state and outcome are valid
    ## Return hospital name in that state with lowest 30-day death
    ## rate
    
    hospital <- read.hospital.data()
    
    #print(head(hospital))
    
    # Filter on state
    state.hospital <- hospital[hospital$state == state,]
    #print(head(state.hospital))
        
    if(length(state.hospital[,1]) == 0) {
        stop("invalid state")
    }
    
    # State hospital outcome (Filtered on the outcome)
    sho <- NULL
    
    if(identical(outcome, "heart attack")) {
        min.outcome = min(state.hospital$heart.attack, na.rm = TRUE)
        sho <- state.hospital[(state.hospital$heart.attack 
                                                 == min.outcome), ]
        sho <- sho[complete.cases(sho),]       
    } else if(identical(outcome, "heart failure")) {
        min.outcome = min(state.hospital$heart.failure, na.rm = TRUE)
        sho <- state.hospital[(state.hospital$heart.failure 
                               == min.outcome), ]
        sho <- sho[complete.cases(sho),]
    } else if(identical(outcome, "pneumonia")) {
        min.outcome = min(state.hospital$pneumonia, na.rm = TRUE)
        sho <- state.hospital[(state.hospital$pneumonia 
                               == min.outcome), ]
        sho <- sho[complete.cases(sho),]
    } else {
        stop("invalid outcome")
    }
    
    
    # Sort on the given outcome
    sort(sho)
    # Return the hospital name of the best outcome    
    sho$hospital.name
}
 
best("CA", "heart attack")

