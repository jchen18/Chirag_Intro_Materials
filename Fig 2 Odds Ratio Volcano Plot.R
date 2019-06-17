library(tidyverse)

load("~/Downloads/merged.RData")
view(mergedResults$merged_data)


#consistent points of 2007 & 2013-2014 survey
mergedResults$merged_data$consistent_07_13 <- mergedResults$merged_data$replicated_univariate_07 & mergedResults$merged_data$replicated_univariate_13


#2007 survey
#"pvalue_univariate_07" , "odds_ratio_univariate_07" 
odds_ratio_07 <- 
  select(mergedResults$merged_data, "var_label", "variable", "pvalue_univariate_07" , "odds_ratio_univariate_07", "consistent_07_13") %>%
  mutate(log10FC = -log10(pvalue_univariate_07))
  
ggplot(odds_ratio_07, aes(odds_ratio_univariate_07, log10FC, color = consistent_07_13)) + 
  geom_point(alpha = 0.5) + 
  scale_x_log10()



#2013 - 2014 survey
#"pvalue_univariate_13" , "odds_ratio_univariate_13"
odds_ratio_13 <- 
  select(mergedResults$merged_data,"var_label", "variable", "pvalue_univariate_13" , "odds_ratio_univariate_13", "consistent_07_13") %>%
  mutate(log10FC = -log10(pvalue_univariate_13))

ggplot(odds_ratio_13, aes(odds_ratio_univariate_13, log10FC, color = consistent_07_13)) + 
  geom_point(alpha = 0.5) + 
  scale_x_log10()

