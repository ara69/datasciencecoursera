# Assignment 2
# Read the csv file and generate histogram for heart attack mortality rate

outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
head(outcome)

ncol(outcome)
names(outcome)

outcome[, 11] <- as.numeric(outcome[, 11])
## You may get a warning about NAs being introduced; that is okay
hist(outcome[, 11])


# Assignmet 2 - Part 1 (online submission)
source("submitscript1.R")
submit()

# Assignmet 2 - Part 3 (online submission)
source("submitscript3.R")
submit()

