#Vectors
library(tidyverse)

x1 <- list(c(1,2), c(3,4))
x2 <- list(list(1,2), list(3,4))
x3 <- list(1,list(2, list(3)))

a <- list(a = 1:3, b = "a string", c = pi, d = list(-1, -5))

x <- 1:10
attr(x, "greeting")

attr(x, "greeting") <- "hello"
attr(x, "farewell") <- "bye"
attributes(x)
