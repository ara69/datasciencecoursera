source("pollutantmean.R")

# Test for single file
print("Sulfate mean : ")
pollutantmean("specdata", "sulfate", 169)

print("Nitrate mean : ")
pollutantmean("specdata", "nitrate", 53)

# Test for small set of files
print("Sulfate mean : ")
pollutantmean("specdata", "sulfate", 1:30)

print("Nitrate mean : ")
pollutantmean("specdata", "nitrate", 1:12)

# Test for large set of files
print("Sulfate mean : ")
pollutantmean("specdata", "sulfate", 100:300)

# Test for entire file set
print("Nitrate mean : ")
pollutantmean("specdata", "nitrate", 1:332)


