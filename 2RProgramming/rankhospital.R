source("readhospitaldata.R") # To read the outcome csv file

# Assignment 2 - Part 3

#Ranking hospitals by outcome in a state 

#Write a function called rankhospital that takes three arguments: the 2-character abbreviated name of a state (state), an outcome (outcome), and the ranking of a hospital in that state for that outcome (num). The function reads the outcome-of-care-measures.csv file and returns a character vector with the name of the hospital that has the ranking specified by the num argument. For example, the call rankhospital("MD", "heart failure", 5) would return a character vector containing the name of the hospital with the 5th lowest 30-day death rate for heart failure. The num argument can take values \best", \worst", or an integer indicating the ranking (smaller numbers are better). If the number given by num is larger than the number of hospitals in that state, then the function should return NA. Hospitals that do not have data on a particular outcome should be excluded from the set of hospitals when deciding the rankings. Handling ties. It may occur that multiple hospitals have the same 30-day mortality rate for a given cause of death. In those cases ties should be broken by using the hospital name. 

#For example, in Texas (\TX"), the hospitals with lowest 30-day mortality rate for heart failure are shown here.
                       
# head(texas)
# Hospital.Name Rate Rank
# 3935 FORT DUNCAN MEDICAL CENTER 8.1 1
# 4085 TOMBALL REGIONAL MEDICAL CENTER 8.5 2
# 4103 CYPRESS FAIRBANKS MEDICAL CENTER 8.7 3
# 3954 DETAR HOSPITAL NAVARRO 8.7 4
# 4010 METHODIST HOSPITAL,THE 8.8 5
# 3962 MISSION REGIONAL MEDICAL CENTER 8.8 6

# Note that Cypress Fairbanks Medical Center and Detar Hospital Navarro both have the same 30-day rate (8.7). However, because Cypress comes before Detar alphabetically, Cypress is ranked number 3 in this scheme and Detar is ranked number 4. One can use the order function to sort multiple vectors in this manner (i.e. where one vector is used to break ties in another vector). The function should use the following template. 

                       
#The function should check the validity of its arguments. If an invalid state value is passed to best, the function should throw an error via the stop function with the exact message \invalid state". If an invalid outcome value is passed to best, the function should throw an error via the stop function with the exact message \invalid outcome". 
 

# The rankhospital function to rank the hospital based on the mortality

rankhospital <- function(state, outcome, num = "best") {
    ## Read outcome data
    ## Check that state and outcome are valid
    ## Return hospital name in that state with the given rank
    ## 30-day death rate
        
    hospital <- read.hospital.data()
    
    #print(head(hospital))
    
    # Filter on state
    state.hospital <- na.omit(hospital[hospital$state == state,])
    # Suppress the state
    state.hospital$state <- NULL
        
    if(nrow(state.hospital) == 0) {
        stop("invalid state")
    }
    
    ranked.state <- NULL
    
    if(identical(outcome, "heart attack")) {
        state.hospital$heart.failure <- NULL
        state.hospital$pneumonia <- NULL
        ranked.state <- state.hospital[do.call(order, state.hospital), ]
    } else if(identical(outcome, "heart failure")) {
        state.hospital$heart.attack <- NULL
        state.hospital$pneumonia <- NULL
        ranked.state <- state.hospital[do.call(order, state.hospital), ]
    } else if(identical(outcome, "pneumonia")) {
        state.hospital$heart.attack <- NULL
        state.hospital$heart.failure <- NULL
        ranked.state <- state.hospital[do.call(order, state.hospital), ]
    } else {
        stop("invalid outcome")
    }
    
    # Print for testing  
     print("Top hospitals")
     print(head(ranked.state))
     print("Bottom hospitals")
     print(tail(ranked.state))
    
    
    ranked.hospital <- NULL # Vector containing the ranked state name
    if(num == "best"){	
        # First row in ranked.hospital
        ranked.hospital = ranked.state[1, 2]	
    } else if(num == "worst"){
        # Last row in ranked.hospital
        worst.row = max(ranked.state[, 1])		
        ranked.hospital = ranked.state[which(ranked.state[, 1] == worst.row), 2]	
    } else {
        # num'th row in ranked.hospital
        num = as.integer(num)		
        if(typeof(num) == "integer" && nrow(ranked.state) >= num){			
            ranked.hospital = ranked.state[num, 2]		
        } else {
            # Invalid rank
            ranked.hospital <- NA		
        }	
    }	
    
    
    # Return the hospital name for the given state, outcome and rank 
    as.character(ranked.hospital)
}
 


# Sample test

rankhospital("TX", "heart failure", 4)
#[1] "DETAR HOSPITAL NAVARRO"

rankhospital("MD", "heart attack", "worst")
#[1] "HARFORD MEMORIAL HOSPITAL"

rankhospital("MN", "heart attack", 5000)
#[1] NA


rankhospital("CA", "pneumonia", 5)
#[1] PROVIDENCE TARZANA MEDICAL CENTER
