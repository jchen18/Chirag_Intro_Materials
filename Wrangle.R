#learning about tibbles

library(tidyverse)
as_tibble(iris)

tibble(
  x = 1:5,
  y = 1,
  z = x^2 + y
)

tb <- tibble(
  `:)` = "smile",
  ` ` = "space",
  `2000` = "number"
)
tb

tribble(
  ~x, ~y, ~z,
  "a", 1, 3.5,
  "b", 2, 5.5,
)


df <- tibble(
  x = runif(5),
  y = rnorm(5)
)
df
df$x
df[[x]]
df[["x"]]
df[[1]]
df[[2]]

#Exercises
#Q: How can you tell that if an object is a tibble?
#A: You can tell an object is a tibble if the value type variables are displayed and there should be a thing stating the dimensions of the tibble 
mtcars

#Q: Compare and contrast the following operations on a data.frame and equivalent tibble. What is different? Why might the default data frame behaviours cause you frustration?

df <- data.frame(abc = 1, xyz = "a")
df$x
df[, "xyz"]
df[, c("abc", "xyz")]

df_tibble <- as_tibble(df)
df_tibble
df_tibble$x
df_tibble[, "xyz"]
df_tibble[, c("abc", "xyz")]

#A: subsetting with the tibble is much more strict - need to use $ or [[]] instead. you get the same results for both the data.frame and the tibble, but the display is different 

#Q: If you have the name of a variable stored in an object, e.g. var <- "mpg", how can you extract the reference variable from a tibble?
var <- "mpg"
#A: use double brackets df[[var]]

# Practice referring to non-syntactic names in the following data frame by:
#   
#   Extracting the variable called 1.
# 
# Plotting a scatterplot of 1 vs 2.
# 
# Creating a new column called 3 which is 2 divided by 1.
# 
# Renaming the columns to one, two and three.

annoying <- tibble(
  `1` = 1:10,
  `2` = `1` * 2 + rnorm(length(`1`))
)

annoying
annoying[["1"]]
ggplot(annoying, aes(x = `1`, y = `2`)) + 
  geom_point() 

annoying <- add_column(annoying, `3` = annoying$`2`/annoying$`1`)
annoying
names(annoying) <- c("one", "two", "three")
annoying

#Q: What does tibble::enframe() do? When might you use it?
tibble::enframe()
enframe(c(a = "1", b = "2", c = "3"))
#A: converts vector into tibble 


