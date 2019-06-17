#Strings
library(tidyverse)
library(stringr)

string1 <- "This is a string"
string2 <- 'This is a string with a "quote" inside'

x <- c("abc", NA)
str_c("|- ", x, " -|")
str_c("|- ", str_replace_na(x), " -|")

x <- c("Apple", "Banana", "Pear")
str_sub(x, 1, 3)
str_sub(x, -3, -1)

help(str_wrap)
help(str_trim)

x <- c("apple", "banana", "pear")
str_view(x, "an")

sentences
length(sentences)
head(sentences)
tail(sentences)

colours <-  c("red", "orange", "yellow", "green", "blue", "purple")
colour_match <- str_c(colours, collapse = "|")
head(colour_match)

has_colour <- str_subset(sentences, colour_match)
head(has_colour)
matches <- str_extract(has_colour, colour_match)
head(matches)

more <- sentences[str_count(sentences, colour_match) > 1]
str_extract(more, colour_match)

noun <- "(a|the) ([^ ]+)"

has_noun <- sentences %>%
  str_subset(noun) %>%
  head(10)
has_noun %>% str_extract(noun)
has_noun %>% str_match(noun)
