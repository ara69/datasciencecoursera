# Assignment 1: Part 3
# Write a function that takes a directory of data files and a threshold for complete cases and calculates the correlation between sulfate and nitrate for monitor locations where the number of completely observed cases (on all variables) is greater than the threshold. The function should return a vector of correlations for the monitors that meet the threshold requirement. If no monitors meet the threshold requirement, then the function should return a numeric vector of length 0. A prototype of this function follows

corr <- function(directory, threshold = 0) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'threshold' is a numeric vector of length 1 indicating the
    ## number of completely observed observations (on all
    ## variables) required to compute the correlation between
    ## nitrate and sulfate; the default is 0
    
    ## Return a numeric vector of correlations
    
    
    # Supporting function
    # Get the correlation of the sulphate and nitrate for the complete rows
    # For the given directory,  idname and threshold
    # Return a vector of length 2
    # First argument: TRUE if the complete count > threshold, otherwise FALSE
    # Second argument correlation of sulfate and nitrate for the complete rows
    
    get.corr <- function(directory, idname, threshold = 0) {
        pidname = sprintf("%03d", idname) # padded idname, for 2 use 002
        # Read the csv file
        filename = paste0(directory, "/", pidname, ".csv")       
        csvdata = read.csv(filename)
        
        # Form a dataframe of complete data (with no NA)
        complete_data <- csvdata[complete.cases(csvdata),]
        
        corr_v <- c(FALSE, 0)
        # If the no of complete records > threshold
        if(length(complete_data$ID) > threshold) {
            # Return the correlation of sulfate and nitrate
            corr_v[2] <- cor(complete_data[,2], complete_data[,3])
            corr_v[1] <- TRUE
        }
        corr_v
    }
    
    # The data frame of id and nobs for the entire set
    pos <- 0
    corr_vect <- vector(mode = "numeric")
    # Find the correlations whose threshold is met
    for(id in 1:332){
        corr_v <- get.corr(directory, id, threshold)
        if(corr_v[1]) { # Valid correlation (complete count > threshold)
            pos <- pos + 1
            corr_vect[pos] <- corr_v[2]
        }
    }
    corr_vect
}


cr <- corr("specdata", 150)
head(cr)
