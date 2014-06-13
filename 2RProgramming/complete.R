#Programming assignment 1 part2

# Write a function that reads a directory full of files and reports the number of completely observed cases in each data file. The function should return a data frame where the first column is the name of the file and the second column is the number of complete cases. A prototype of this function follows

complete <- function(directory, id = 1:332) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'id' is an integer vector indicating the monitor ID numbers
    ## to be used
    
    ## Return a data frame of the form:
    ## id nobs
    ## 1  117
    ## 2  1041
    ## ...
    ## where 'id' is the monitor ID number and 'nobs' is the
    ## number of complete cases
    
    
    # Supporting function
    
    # Read the file with given idname and get the mean for the pollutant
    get.complete.count <- function(directory, idname) {
        pidname = sprintf("%03d", idname) # padded idname, for 2 use 002
        # Read the csv file
        filename = paste0(directory, "/", pidname, ".csv")       
        csvdata = read.csv(filename)
        
        # Form a dataframe of complete data (with no NA)
        complete_data <- csvdata[complete.cases(csvdata),]
        # Return the count of complete rows
        length(complete_data$ID)
    }
    
    
    # The main function   
    row_count <- length(id) # No of rows (no of passed ids)
    # Define the output complete count matrix of id 
    # and nobs(no of complete rows)
    mccount <- matrix(nrow = row_count, ncol=2, 
                      dimnames=list(1:row_count, c("id", "nobs"))) 
    
   pos <- 0
   if(row_count == 1) {
        # Find the complete count from single file
        pos <- pos + 1
        mccount[pos,1] <- id
        mccount[pos,2] <- get.complete.count(directory, id)
    } else {
        # Find the complete count from the list of id files
        for (idname in id) {            
            pos <- pos + 1
            mccount[pos,1] <- idname
            mccount[pos,2] <- get.complete.count(directory, idname)
        }
    }
    # Populate the output data frame and return
    rbind(mccount)
}


complete("specdata", 1)
##   id nobs
## 1  1  117
complete("specdata", c(2, 4, 8, 10, 12))
##   id nobs
## 1  2 1041
## 2  4  474
## 3  8  192
## 4 10  148
## 5 12   96
