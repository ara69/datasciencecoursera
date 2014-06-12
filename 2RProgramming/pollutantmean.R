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
    
    # Read the file with given idname and get the mean for the pollutant
    get.mean <- function(directory, pollutant, idname) {
        pidname = sprintf("%03d", idname) # padded idname, for 2 use 002
        # Read the csv file
        filename = paste0(directory, "/", pidname, ".csv")       
        csvdata = read.csv(filename)
        
        # Get the column index of the pollutant
        idx <- get.col.index(pollutant)           
        filtered_data <- csvdata[,idx][!is.na(csvdata[,idx])]
        mean(filtered_data)
    }
    
    
    # Main function starts here
    
    means <- NULL # The vector of means for the given ids
    pos <- 0      # Indexes of the ids
    pmean <- 0    # The final pollutant mean for the given ids
    
    if(length(id) == 1) {
        # Find the mean from single file
        pmean <- get.mean(directory, pollutant, id)
    } else {
        # Find the mean from the list of id files
        for (idname in id) {
            
            means[pos] <- get.mean(directory, pollutant, idname)
            pos <- pos + 1
        }
        pmean <- mean(means, na.rm = TRUE)    
    }
    
    pmean # return the final mean for the given file names
}



# Unit test for single file
pollutantmean("specdata", "sulfate", 7)


# Unit test for multiple file
pollutantmean("specdata", "nitrate", 50:60)
