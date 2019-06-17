#Functions
df <- tibble::tibble(
  a = rnorm(10),
  b = rnorm(10),
  c = rnorm(10),
  d = rnorm(10)
)

df$a <- (df$a - min(df$a, na.rm = TRUE)) / 
  (max(df$a, na.rm = TRUE) - min(df$a, na.rm = TRUE))
df$b <- (df$b - min(df$b, na.rm = TRUE)) / 
  (max(df$b, na.rm = TRUE) - min(df$a, na.rm = TRUE))
df$c <- (df$c - min(df$c, na.rm = TRUE)) / 
  (max(df$c, na.rm = TRUE) - min(df$c, na.rm = TRUE))
df$d <- (df$d - min(df$d, na.rm = TRUE)) / 
  (max(df$d, na.rm = TRUE) - min(df$d, na.rm = TRUE))

#Rewritten into a function
x <- df$a
(x - min(x, na.rm = TRUE)) / (max(x, na.rm = TRUE) - min(x, na.rm = TRUE))

rng <- range(x, na.rm = TRUE)
(x - rng[1]) / (rng[2] - rng[1])

rescale01 <- function(x) {
  rng <- range(x, na.rm = TRUE)
  (x - rng[1]) / (rng[2] - rng[1])
}
rescale01(c(0, 5, 10))


df$a <- rescale01(df$a)
df$b <- rescale01(df$b)
df$c <- rescale01(df$c)
df$d <- rescale01(df$d)

#Q: Practice writing the following into functions
x <- c(1,2,3,NA, NA)
is.na(x)
mean(is.na(x))

prop_na <- function(x) {
  mean(is.na(x))
}
  
prop_na(x)

sum_to_one <- function(x, na.rm = FALSE){
  x / sum(x, na.rm = TRUE)
}
sum_to_one(x)

coeff_variation <- function(x, na.rm = FALSE) {
  sd(x, na.rm = TRUE) / mean(x, na.rm = TRUE)
}


# Hello -------------------------------------------------------------------


test <- function(x, y, op){
  switch(op,
         plus = x + y,
         minus = x - y,
         times = x*y,
         divide = x/y,
         stop("unknown op!")
         )
}

test(1 ,2, 1)

