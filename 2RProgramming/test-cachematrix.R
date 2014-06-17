source("cachematrix.R")

# 2x2 matrix inverse test
m <- matrix(5:8, 2, 2)
m

cm <- makeCacheMatrix(m)

cacheSolve(cm)

cacheSolve(cm)


# 3x3 matrix inverse test

m <- matrix(c(1:3, 7:5, 2,5,9), 3, 3)
m

cm <- makeCacheMatrix(m)
cacheSolve(cm)
