# Pragramming Assignment 2

# Write a function named 'pollutantmean' that calculates the mean of a pollutant (sulfate or nitrate) across a specified list of monitors. The function 'pollutantmean' takes three arguments: 'directory', 'pollutant', and 'id'. Given a vector monitor ID numbers, 'pollutantmean' reads that monitors' particulate matter data from the directory specified in the 'directory' argument and returns the mean of the pollutant across all of the monitors, ignoring any missing values coded as NA. A prototype of the function is as follows

pollutantmean <- function(directory, pollutant, id = 1:332) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'pollutant' is a character vector of length 1 indicating
    ## the name of the pollutant for which we will calculate the
    ## mean; either "sulfate" or "nitrate".
    
    ## 'id' is an integer vector indicating the monitor ID numbers
    ## to be used
    
    ## Return the mean of the pollutant across all monitors list
    ## in the 'id' vector (ignoring NA values)
    
    
    # Supporting local functions
     
    # Get the index column of the pollutant in the csv file. 
    # 2 for sulfate, 3 for nitrate
    get.col.index <- function(p) {
        i=1
        
        if(identical(p,"sulfate")) {
            i <- 2
        } 
        
        if(identical(p,"nitrate")) {
            i <- 3
        }
        
        i
    }
    
    # Reads the file with given idname and returns the filltered (non-na) pollutant
    get.filtered.data <- function(directory, pollutant, idname) {
        # Read the csv file
        filename = paste0(directory, "/", formatC(idname, width=3, flag="0"), ".csv")       
        csvdata = read.csv(filename)
        
        # Get the column index of the pollutant
        idx <- get.col.index(pollutant)  
        # Populate a dataframe with only the required pollutant
        filtered.data <- data.frame(csvdata[,idx])
        # Return the non-na rows
        filtered.data[!is.na(filtered.data)]
    }
    
    
    # Main function starts here
    
    # The vector of filtered (non-na) pollutants for all ids
    filtered.pollutant <- NULL
    
    
    # Find the mean from the list of id files
    for (idname in id) {
       filtered.pollutant <- c(filtered.pollutant, 
                              get.filtered.data(directory, pollutant, idname))
    }
    
    # Return the mean of the filtered pollutants
    mean(filtered.pollutant)    
}



# Sample tests

pollutantmean("specdata", "sulfate", 1:10)
## [1] 4.064
pollutantmean("specdata", "nitrate", 70:72)
## [1] 1.706
pollutantmean("specdata", "nitrate", 23)
## [1] 1.281

