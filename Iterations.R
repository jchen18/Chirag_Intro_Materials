#Iterations
library(tidyverse)
df <- tibble(
  a = rnorm(10),
  b = rnorm(10),
  c = rnorm(10),
  d = rnorm(10)
)

#without use of for loop
median(df$a)
#> [1] -0.246
median(df$b)
#> [1] -0.287
median(df$c)
#> [1] -0.0567
median(df$d)
#> [1] 0.144

#using a for loop
output <- vector("double", ncol(df))
for (i in seq_along(df)) {
  output[[i]] = median(df[[i]])
}
output



for (i in seq_along(x)) {
  name <- names(names(x[[i]]))
  value <- x[[i]]
}

means <- c(0,1,2)
out <- vector("list", length(means))

for (i in seq_along(means)) {
  n <- sample(100,1)
  out[[i]] <- rnorm(n,means[[i]])
}
str(out)
str(unlist(out))

mu <- list(5, 10, -3)
mu %>%
  map(rnorm, n = 5) %>%
  str()

sigma <- list(1, 5, 10)
seq_along(mu) %>%
  map(~rnorm(5, mu[[.]], sigma[[.]])) %>%
  str()

map2(mu, sigma, rnorm, n = 5) %>% str()
