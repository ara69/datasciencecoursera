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
        # Read the csv file
        filename = paste0(directory, "/", formatC(idname, width=3, flag="0"), ".csv")       
        csvdata = read.csv(filename)
        
        # Form a dataframe of complete data (with no NA)
        complete.data <- csvdata[complete.cases(csvdata),]
        
        # Correlation vector of boolean, corelation of single file
        corr.v <- c(FALSE, 0)
        # If the no of complete records > threshold
        if(nrow(complete.data) > threshold) {
            # Return the correlation of sulfate and nitrate
            corr.v[2] <- cor(complete.data[,2], complete.data[,3])
            corr.v[1] <- TRUE
        }
        corr.v
    }
    
    # The data frame of id and nobs for the entire set
    pos <- 0
    pollutant.corr <- vector(mode = "numeric")
    # Find the correlations whose threshold is met
    for(id in 1:332){
        corr.v <- get.corr(directory, id, threshold)
        if(corr.v[1]) { # Valid correlation (complete count > threshold)
            pos <- pos + 1
            pollutant.corr[pos] <- corr.v[2]
        }
    }
    pollutant.corr
}


cr <- corr("specdata", 150)
head(cr)
## [1] -0.01896 -0.14051 -0.04390 -0.06816 -0.12351 -0.07589
summary(cr)
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
## -0.2110 -0.0500  0.0946  0.1250  0.2680  0.7630
cr <- corr("specdata", 400)
head(cr)
## [1] -0.01896 -0.04390 -0.06816 -0.07589  0.76313 -0.15783
summary(cr)
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
## -0.1760 -0.0311  0.1000  0.1400  0.2680  0.7630
cr <- corr("specdata", 5000)
summary(cr)
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
## 
length(cr)
## [1] 0
cr <- corr("specdata")
summary(cr)
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
## -1.0000 -0.0528  0.1070  0.1370  0.2780  1.0000
length(cr)
## [1] 323
