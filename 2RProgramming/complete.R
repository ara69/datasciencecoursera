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
    
    # Read the file with given idname and get the no of non-na rows
    get.complete.count <- function(directory, idname) {
        # Read the csv file
        filename = paste0(directory, "/", formatC(idname, width=3, flag="0"), ".csv")       
        csvdata = read.csv(filename)
        
        # Form a dataframe of complete data (with no NA)
        complete.data <- csvdata[complete.cases(csvdata),]
        # Return the count of complete rows
        nrow(complete.data)
    }
    
    
    # The main function   
    row.count <- length(id) # No of rows (no of passed ids)
    # Define the output complete count matrix of id 
    # and nobs(no of complete rows)
    mccount <- matrix(nrow = row.count, ncol=2, 
                      dimnames=list(1:row.count, c("id", "nobs"))) 
    
   pos <- 0
   if(row.count == 1) {
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
    data.frame(mccount)
}


# Sample Test

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
complete("specdata", 30:25)
##   id nobs
## 1 30  932
## 2 29  711
## 3 28  475
## 4 27  338
## 5 26  586
## 6 25  463
complete("specdata", 3)
##   id nobs
## 1  3  243
