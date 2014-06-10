library(dataset)
airquality
x <- split(airquality, airquality$Month)
str(x)

tapply(airquality$Ozone, airquality$Month, mean, na.rm=TRUE)
tapply(airquality$Solar.R, airquality$Month, mean, na.rm=TRUE)
tapply(airquality$Wind, airquality$Month, mean, na.rm=TRUE)
tapply(airquality$Temp, airquality$Month, mean, na.rm=TRUE)


#Q1: What is produced at the end of this snippet of R code?

set.seed(1)
rpois(5, 2)

#Ans: [1] 1 1 2 4 1


#Q5: What does the following code do?

set.seed(10)
x <- rbinom(10, 10, 0.5)
e <- rnorm(10, 0, 20)
y <- 0.5 + 2 * x + e
y

#Q8: Consider the following R code
library(datasets)
Rprof()
#y <- pnorm(100)
#x1 <- rnorm(100)
#x2 <- qnorm(100)
fit <- lm(y ~ x1 + x2)
Rprof(NULL)
summaryRprof()

#(Assume that y, x1, and x2 are present in the workspace.) Without running the code, what percentage of the run time is spent in the 'lm' function, based on the 'by.total' method of normalization shown in 'summaryRprof()'?


#Q9: Question 9
#When using 'system.time()', what is the user time?

system.time(tapply(airquality$Temp, airquality$Month, mean, na.rm=TRUE))

system.time(runif(300^3)*3)
system.time(runif(300^3, max=3))
