
x <-c(0.18, -1.54, 0.42, 0.95)
w <- c(2,1,3,1)
mean(x)
y <- x*w
y
z <- (x-mean(x))^2
z
t <- w*z
t

lm(formula = I(x - mean(x)) ~ I(w - mean(w)) - 1)
