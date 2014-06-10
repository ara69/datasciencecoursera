library(datasets)
data(iris)
iris
?iris
names(iris)

f <- factor(iris$Species)
class(f)
f


#ordered(s)

#Q1: In this dataset, what is the mean of 'Sepal.Length' for the species virginica?
s <- split(iris, iris$Species)
s
sapply(s, function(x) colMeans(x[, c("Sepal.Length", "Sepal.Width", 
                                     "Petal.Length", "Petal.Width")]))

#              setosa versicolor virginica
#Sepal.Length  5.006      5.936     6.588
#Sepal.Width   3.428      2.770     2.974
#Petal.Length  1.462      4.260     5.552
#Petal.Width   0.246      1.326     2.026


# Q2: what R code returns a vector of the means of the variables 'Sepal.Length', 'Sepal.Width', 'Petal.Length', and 'Petal.Width'?

colMeans(iris)
apply(iris[, 1:4], 1, mean)
rowMeans(iris[, 1:4])
apply(iris[, 1:4], 2, mean)


#Ans: apply(iris[, 1:4], 2, mean)
#Sepal.Length  Sepal.Width Petal.Length  Petal.Width 
#    5.843333     3.057333     3.758000     1.199333






library(datasets)
data(mtcars)
mtcars
?mtcars
names(mtcars)

require(graphics)
pairs(mtcars, main = "mtcars data")
coplot(mpg ~ disp | as.factor(cyl), data = mtcars, panel = panel.smooth, rows = 1)


#Q3: How can one calculate the average miles per gallon (mpg) by number of cylinders in the car (cyl)?

tapply(mtcars$mpg, mtcars$cyl, mean)
sapply(mtcars, cyl, mean)
lapply(mtcars, mean)
apply(mtcars, 2, mean)

#Ans: tapply(mtcars$mpg, mtcars$cyl, mean)

#        4        6        8 
# 26.66364 19.74286 15.10000 



#Q4: What is the absolute difference between the average horsepower of 4-cylinder cars and the average horsepower of 8-cylinder cars?

x <- tapply(mtcars$hp, mtcars$cyl, mean)
x
class(x)
y <- (x[3] - x[1])
y

# Ans 126.5779



debug(ls)
ls


