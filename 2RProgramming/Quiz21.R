getwd()



# Define a function

function1 <- function() {
  x <- rnorm(100)
  mean(x)
}

# Define 2nd function
function2 <- function(x) {
  x * rnorm(length(x))
}

# List functions
ls()

# List files
dir()


# Invoke the functions

print("function1"); function1();

print("function2")
function2(10)

function2(4:10)




# Class and attributes
x <- 1L
class(x)
attributes(x)
print(x)

x <- 1:50
x
class(x)
attributes(x)

y <-4
class(4)

z <- c(3, 5.9)
class(z)
z
as.numeric(z)

x <- matrix(1:12, nrow=3, ncol=4)
x
class(x)
attributes(x)

m <- 1:12
m
dim(m) <- c(4,3)
m


#Q4 - What is the class of the object defined by x <- c(4, TRUE)?
y <- c(4, TRUE)
attributes(y)
class(y)

#Q4 - If I execute the expression x <- 4L in R, what is the class of the object `x' as determined by the `class()' function?
x <- 4L
class(x)

#Q5 - What is the class of the object defined by the expression x <- c(4, "a", TRUE)?
x <- c(4, "a", TRUE)
class(x)

x <- c(4, TRUE)
class(x)

#Q6
x <- c(1,3, 5); y <- c(3, 2, 10); 
attributes(rbind(x,y))
attributes(cbind(x,y))
class(rbind(x,y))
class(cbind(x,y))


rbind(x,y)
lbind(x,y)


# A key property of vectors in R is that

x <- c(1:4, "a", TRUE)
x
x <- vector(numeric, length=6)
x[1] <-1
x[5] <-"a"
x[6] = T
x


#Q8 - Suppose I have a list defined as x <- list(2, "a", "b", TRUE). What does x[[2]] give me?

x <- list(2, "a", "b", TRUE)
x[[2]]
class(x[[2]])
x[[1]]
class(x[[1]])

#Q8 - 


#Q9 - Suppose I have a vector x <- 1:4 and y <- 2:3. What is produced by the expression x + y?

x <- 1:4 
y <- 2:3
x
y
x+y

#Q9 - Suppose I have a vector x <- 1:4 and a vector y <- 2. What is produced by the expression x + y?
x <- 1:4 
y <- 2
x
y
x+y

#Q10 Suppose I have a vector x <- c(17, 14, 4, 5, 13, 12, 10) and I want to set all elements of this vector that are greater than 10 to be equal to 4. What R code achieves this?

x <- c(17, 14, 4, 5, 13, 12, 10)
x
x[x > 10] <- 4
x

x[x >= 11] <- 4
x


# Read a csv file


getwd()

x <- read.csv("hw1_data.csv")
x



#Q11 In the dataset provided for this Quiz, what are the column names of the dataset?
attributes(x)

#Q12 - Extract the first 2 rows of the data frame and print them to the console. What does the output look like?
x[1:2,]

#Q13 - How many observations (i.e. rows) are in this data frame?
length(x[,1])

#Q14 - Extract the last 2 rows of the data frame and print them to the console. What does the output look like?
x[152:153,]


#Q15 - What is the value of Ozone in the 47th row?
x$Ozone[47]

#Q16 How many missing values are in the Ozone column of this data frame?
length(x$Ozone[is.na(x$Ozone)])

#Q17 - What is the mean of the Ozone column in this dataset? Exclude missing values (coded as NA) from this calculation.
mean(x$Ozone[!is.na(x$Ozone)])

# Will be TRUE if all elements of a row is non-NA
good <- complete.cases(x)
good

x[good, ][1:153,]

# Q17 - Mean of the Ozone column
mean(x$Ozone[!is.na(x$Ozone)])

# Q18 - Extract the subset of rows of the data frame where Ozone values are above 31 and Temp values are above 90. What is the mean of Solar.R in this subset?
mean(x$Solar.R[(x$Ozone > 31 & !is.na(x$Ozone)) & (x$Temp > 90 & !is.na(x$Temp))])

# Q19 - What is the mean of "Temp" when "Month" is equal to 6?
x$Temp[x$Month == 6]
mean(x$Temp[x$Month == 6])


#Q20 - What was the maximum ozone value in the month of May (i.e. Month = 5)?
x$Ozone[x$Month == 5 & !is.na(x$Ozone)]
max(x$Ozone[x$Month == 5 & !is.na(x$Ozone)])














