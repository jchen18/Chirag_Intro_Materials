#Data Import
library(tidyverse)
heights <- read_csv("data/heights.csv")
read_csv("a,b,c
          1,2,3
          4,5,6")
#Exercises
#Q: What function would you use to read a file where fields were separated with
#“|”?
#A: read_delim()

#Q: Apart from file, skip, and comment, what other arguments do read_csv() and read_tsv() have in common?
help("read_csv")
#A: file, col_names, col_types, locale, na, quoted_na, quote, comment, trim_ws, skip, n_max, guess-max, progress, skip_empty_rows

#Q: What are the most important arguments to read_fwf()?
help(read_fwf)
#A: col_positions - informs on the size of the fixed width files

#Q: Sometimes strings in a CSV file contain commas. To prevent them from causing problems they need to be surrounded by a quoting character, like " or '. By convention, read_csv() assumes that the quoting character will be ", and if you want to change it you’ll need to use read_delim() instead. What arguments do you need to specify to read the following text into a data frame?
"x,y\n1,'a,b'"
x <- "x,y\n1,'a,b'"
read_delim(x, ",",quote = "'")

#Q: Identify what is wrong with each of the following inline CSV files. What happens when you run the code?
read_csv("a,b\n1,2,3\n4,5,6") #the last row has 3 items whereas the rest have only 2
read_csv("a,b,c\n1,2\n1,2,3,4") #items do not the match the dimensions
read_csv("a,b\n\"1") #last quotation at end does not work - a is treated as double
read_csv("a,b\n1,2\na,b") #reads in alright, but doesn't really make sense to have two of same row - treated as character vectors
read_csv("a;b\n1;3") # the semicolon doesn't delimit the values from one another


#################
challenge <- read_csv(readr_example("challenge.csv"))
problems(challenge)
help(problems)
challenge <- read_csv(readr_example("challenge.csv"),
                      col_types = cols(
                        x = col_integer(),
                        y = col_character()
                      )
                    )

challenge <- read_csv(readr_example("challenge.csv"),
                      col_types = cols(
                        x = col_double(),
                        y = col_character()
                      )
)
tail(challenge)
head(challenge)


challenge <- read_csv(readr_example("challenge.csv"),
                      col_types = cols(
                        x = col_double(),
                        y = col_date()
                      )
)
tail(challenge)

challenge2 <- read_csv(readr_example("challenge.csv"), guess_max = 1001)
tail(challenge2)
